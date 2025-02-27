package JDBC.Task;

import java.sql.*;
import java.util.Scanner;

public class Crudopp {
    static String url = "jdbc:mysql://localhost:3306/college";
    static String username = "root";
    static String password = "suhail$@786";
    static Connection connection = null;
    static Statement statement = null;
    static PreparedStatement prepStatement = null;
    static ResultSet resultSet = null;

    public static void main(String[] args) throws SQLException {

        int id, mobile;
        String name, email;

        Scanner in = new Scanner(System.in);
        int choice;
        do {
            System.out.println("\n=== CRUD Operations Menu ===");
            System.out.println("1. Insert Record");
            System.out.println("2. View Records");
            System.out.println("3. Update Record");
            System.out.println("4. Delete Record");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");
            choice = in.nextInt();

            switch (choice) {
                case 1:
                    System.out.println("Enter information for creating records");
//                    System.out.println("Enter id");
//                    id = in.nextInt();
                    in.nextLine();
                    System.out.println("Enter name:");
                    name = in.next();
                    System.out.println("Enter email:");
                    email = in.next();

                    System.out.println("Enter mobile:");
                    mobile = in.nextInt();

                    insertstudents(name, email, mobile);
                    displaystudents();
                    break;
                case 2:
                    displaystudents();
                    break;
                case 3:
                    System.out.println("Enter information for updating records");
                    System.out.println("Enter id");
                    id = in.nextInt();
                    in.nextLine();
                    System.out.println("Enter name:");
                    name = in.nextLine();
                    in.nextLine();
                    System.out.println("Enter email:");
                    email = in.nextLine();
                    in.nextLine();

                    System.out.println("Enter mobile:");
                    mobile = in.nextInt();

                    updateStudent(id, name, email, mobile);
                    break;
                case 4:
                    System.out.println("Enter information for deleting records");
                    System.out.println("Enter id");
                    id = in.nextInt();

                    deletestudent(id);
                    break;
                case 5:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.out.println("Invalid choice! Please try again.");
            }
        } while (choice != 5);
        in.close();


    }

    public static void displaystudents() throws SQLException {
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        String selectQuery = "SELECT * FROM students";
        resultSet = statement.executeQuery(selectQuery);
        while (resultSet.next()) {
            System.out.print("\nId is: " + resultSet.getInt("s_id"));
            System.out.print("\nName is: " + resultSet.getString("s_name"));
            System.out.print("\nEmail is: " + resultSet.getString("s_email"));
            System.out.print("\nMobile is: " + resultSet.getString("s_mobileno"));
        }

    }

    public static void insertstudents(
            String name, String email, int mobile) throws SQLException {

        //String query = "insert into employee vawlues(15, 'ABR',720000);";
        String query = "INSERT INTO students (s_name, s_email, s_mobileno) VALUES (?,?,?)";

        connection = DriverManager.
                getConnection(url, username, password);
        prepStatement = connection.prepareStatement(query);
//        prepStatement.setInt(1, id);
        prepStatement.setString(1, name);
        prepStatement.setString(2, email);
        prepStatement.setInt(3, mobile);
        System.out.println("Number of rows affected:"
                + prepStatement.executeUpdate());
        connection.close();


    }

    public static void updateStudent(int id,
                                     String name, String email, int mobile) throws SQLException {
        String query = "update students set s_name=?,s_email=?,s_mobileno=? where s_id=?";
        connection = DriverManager.
                getConnection(url, username, password);
        prepStatement = connection.prepareStatement(query);
        prepStatement.setInt(4, id);
        prepStatement.setString(1, name);
        prepStatement.setString(2, email);
        prepStatement.setInt(3, mobile);
        System.out.println("Number of rows affected:"
                + prepStatement.executeUpdate());
        connection.close();
        displaystudents();
    }

    public static void deletestudent(int id) throws SQLException {

        // String query = "delete from employee where emp_id=11;";
//        String query = "delete from student where s_id="
//                + id + ";";
//        connection = DriverManager.
//                getConnection(url, username, password);
//        statement = connection.createStatement();
//        System.out.println("Number of rows affected:"
//                + statement.executeUpdate(query));
//        connection.close();
        String query = "DELETE FROM students WHERE s_id=?";
        connection = DriverManager.getConnection(url, username, password);
        prepStatement = connection.prepareStatement(query);
        prepStatement.setInt(1, id);
        int rowsAffected = prepStatement.executeUpdate();
        System.out.println("Number of rows affected: " + rowsAffected);
        connection.close();
        displaystudents();
    }

}
