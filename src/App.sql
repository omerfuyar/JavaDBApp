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
   ac_first_flight_date date,
   ac_wheight           number(10) check ( ac_wheight > 0 ),
   ac_length            number(10) check ( ac_length > 0 )
);

drop table aircrafts;

create sequence ac_id_seq start with 100000 increment by 1 maxvalue 999999;

create table countries (
   country_name   varchar2(100) unique not null,
   country_region varchar2(100) not null
);

create table companies (
   company_name    varchar2(100) unique not null,
   company_country varchar2(100) not null
);