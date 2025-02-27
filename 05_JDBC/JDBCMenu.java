package JDBC;

import java.sql.*;
import java.util.Scanner;

public class JDBCMenu {
    private static final String URL = "jdbc:mysql://localhost:3306/company";
    private static final String USER = "root";
    private static final String PASSWORD = "suhail$@786";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Database connected successfully!");

            while (true) {
                System.out.println("\nMenu:");
                System.out.println("1. Insert a new Row");
                System.out.println("2. Update a Row");
                System.out.println("3. Delete a Row");
                System.out.println("4. Select Rows");
                System.out.println("5. Exit");
                System.out.print("Enter your choice: ");
                int choice = scanner.nextInt();
                scanner.nextLine(); // Consume newline

                switch (choice) {
                    case 1:
                        insertRow(connection, scanner);
                        break;
                    case 2:
                        updateRow(connection, scanner);
                        break;
                    case 3:
                        deleteRow(connection, scanner);
                        break;
                    case 4:
                        selectRows(connection);
                        break;
                    case 5:
                        System.out.println("Exiting the program...");
                        return;
                    default:
                        System.out.println("Invalid choice. Try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void insertRow(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter Employee ID: ");
        int empId = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Enter Employee Name: ");
        String empName = scanner.nextLine();

        System.out.print("Enter Employee Email: ");
        String empEmail = scanner.nextLine();

        String query = "INSERT INTO employee (emp_id, emp_name, emp_email) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, empId);
            pstmt.setString(2, empName);
            pstmt.setString(3, empEmail);
            int rowsAffected = pstmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) inserted successfully!");
        }
    }

    private static void updateRow(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter Employee ID to update: ");
        int empId = scanner.nextInt();
        scanner.nextLine();

        System.out.print("Enter new Employee Name: ");
        String empName = scanner.nextLine();

        System.out.print("Enter new Employee Email: ");
        String empEmail = scanner.nextLine();

        String query = "UPDATE employee SET emp_name = ?, emp_email = ? WHERE emp_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, empName);
            pstmt.setString(2, empEmail);
            pstmt.setInt(3, empId);
            int rowsAffected = pstmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) updated successfully!");
        }
    }

    private static void deleteRow(Connection connection, Scanner scanner) throws SQLException {
        System.out.print("Enter Employee ID to delete: ");
        int empId = scanner.nextInt();

        String query = "DELETE FROM employee WHERE emp_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, empId);
            int rowsAffected = pstmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) deleted successfully!");
        }
    }

    private static void selectRows(Connection connection) throws SQLException {
        String query = "SELECT * FROM employee";
        try (PreparedStatement pstmt = connection.prepareStatement(query); ResultSet resultSet = pstmt.executeQuery()) {
            System.out.println("\nEmployee Details:");
            while (resultSet.next()) {
                System.out.println(resultSet.getInt("emp_id") + " | " + resultSet.getString("emp_name") + " | " + resultSet.getString("emp_email"));
            }
        }
    }
}
