import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

import java.util.Properties;

class TestDB {

    /*

      /usr/share/java

      http://dev.mysql.com/doc/connector-j/5.1/en/

      https://jdbc.postgresql.org/documentation/documentation.html

    */

   static Connection conn = null;   

   public static void main(String[] args) {
      // PostgreSQL

      try {

         System.out.println("Loading Class org.postgresql.Driver");

         Class.forName("org.postgresql.Driver");

         System.out.println("Loading org.postgresql.Driver Successful");

         String url = "jdbc:postgresql://localhost/postgres";

         Properties props = new Properties();

         props.setProperty("user","postgres");

         props.setProperty("password","iauro100");

         props.setProperty("ssl","true");

         conn = DriverManager.getConnection(url, props); 

         // or

         //url = "jdbc:postgresql://localhost/database?user=user&password=password&ssl=true";

         url = "jdbc:postgresql://localhost/postgres?user=postgres&password=iauro100&ssl=true";

         Connection conn = DriverManager.getConnection(url);

         // Do something with the Connection

         System.out.println("Test Connection Successful");

      } catch (SQLException ex) {

         // handle any errors

         System.out.println("SQLException: " + ex.getMessage());

         System.out.println("SQLState: " + ex.getSQLState());

         System.out.println("VendorError: " + ex.getErrorCode());

      } catch (ClassNotFoundException ex) {

         System.out.println("Class Not Found: " + ex.getMessage());

      }

   }

}
