import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FN71996 {
    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;


    public void openConnection(){

// Step 1: Load IBM DB2 JDBC driver

        try {

            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());

        }

        catch(Exception cnfex) {

            System.out.println("Problem in loading or registering IBM DB2 JDBC driver");

            cnfex.printStackTrace();
        }

// Step 2: Opening database connection


        try {

            connection = DriverManager.getConnection("jdbc:db2://62.44.108.24:50000/SAMPLE", "db2admin", "db2admin");

            statement = connection.createStatement();

        }

        catch(SQLException s){

            s.printStackTrace();

        }

    }

    public void closeConnection(){

        try {

            if(null != connection) {

                // cleanup resources, once after processing

                resultSet.close();

                statement.close();


                // and then finally close connection

                connection.close();

            }

        }

        catch (SQLException s) {

            s.printStackTrace();

        }

    }

    public void select(String stmnt, int column) {

        try{

            resultSet = statement.executeQuery(stmnt);

            String result = "";

            while(resultSet.next()) {

                for (int i = 1; i <= column; i++) {

                    result += resultSet.getString(i);

                    if (i == column) result += " \n";
                    else             result += ", ";
                }
            }

            System.out.println("Executing query: " + stmnt + "\n");
            System.out.println("Result output \n");
            System.out.println("---------------------------------- \n");
            System.out.println(result);

        }
        catch (SQLException s)
        {
            s.printStackTrace();
        }

    }

    public void insert(String stmnt) {

        try{

            statement.executeUpdate(stmnt);

        }

        catch (SQLException s){

            s.printStackTrace();

        }

        System.out.println("Successfully inserted!");

    }


    public void delete(String stmnt) {

        try{

            statement.executeUpdate(stmnt);

        }

        catch (SQLException s){

            s.printStackTrace();

        }

        System.out.println("Successfully deleted!");

    }

    public static void main(String[] args) {

        FN71996 fn71996 = new FN71996();
        String stmnt = "";
        String name = "NGDEK";
        String email = "ngdek@gmail.com";
        String address = "Bulgaria";
        String number = "89674484";

        fn71996.openConnection();

        stmnt = "SELECT NAME, GRADE FROM FN71996.STUDENT";

        fn71996.select(stmnt, 2);

        stmnt = " INSERT INTO FN71996.SCHOOL(NAME, EMAIL, ADDRESS, PNUMBER)"
                + " VALUES ('" + name + "','" + email + "','" + address + "', '" + number + "')";

        fn71996.insert(stmnt);


        stmnt = "DELETE FROM FN71996.SCHOOL WHERE NAME = " + "'" + name + "' ";

        fn71996.delete(stmnt);

        fn71996.closeConnection();

    }

}
