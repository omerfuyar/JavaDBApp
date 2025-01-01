import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class App {
    static String query = "SELECT * FROM dual";

    public static void main(String[] args) throws Exception {
        // System.out.println("Hello, World!");
        ConnectToDataBase();
    }

    static void ConnectToDataBase() {

        String url = "jdbc:oracle:thin:@//localhost:1521/XEPDB1";
        String userName = "SYSTEM";
        String password = "078864";

        try {
            Connection connection = DriverManager.getConnection(url, userName, password);
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery(query);
            resultSet.next();
            String result = resultSet.getString(1);
            System.out.println(result);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}