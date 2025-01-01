select *
  from dual; --test connection

create user omruyr identified by 078864; --create user

grant connect,resource to omruyr; --grant connect and resource roles to user

CONNECT omruyr/078864@localhost:1521/XEPDB1; --switch / connect to user

create table aircrafts (
   ac_id                number(10) primary key,
   ac_model             varchar2(100) unique not null,
   ac_class             varchar2(100),
   ac_country           varchar2(100) not null,
   ac_company           varchar2(100) not null,
   ac_status            varchar2(100) not null,
   ac_units             number(10) check ( ac_units > 0 ),
   ac_first_flight_year number(4) check ( ac_first_flight_year > 0 ),
   ac_wheight           number(10) check ( ac_wheight > 0 ),
   ac_length            number(10) check ( ac_length > 0 )
);

create sequence ac_id_seq start with 100000 increment by 1 maxvalue 999999;

select ac_id_seq.nextval
  from dual;

create table countries (
   country_name   varchar2(100) primary key,
   country_region varchar2(100) not null
);

create table regions (
   region_name varchar2(100) primary key
);

create table companies (
   company_name    varchar2(100) primary key,
   company_country varchar2(100) not null
);

create table classes (
   class_name varchar2(100) primary key
);

create table statuses (
   status_name varchar2(100) primary key
);

alter table aircrafts
   add constraint fk_ac_country foreign key ( ac_country )
      references countries ( country_name );

alter table aircrafts
   add constraint fk_ac_company foreign key ( ac_company )
      references companies ( company_name );

alter table aircrafts
   add constraint fk_ac_class foreign key ( ac_class )
      references classes ( class_name );

alter table aircrafts
   add constraint fk_ac_status foreign key ( ac_status )
      references statuses ( status_name );

alter table countries
   add constraint fk_country_region foreign key ( country_region )
      references regions ( region_name );

alter table companies
   add constraint fk_company_country foreign key ( company_country )
      references countries ( country_name );