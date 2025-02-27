package JDBC;

import java.sql.*;

public class Crudopp {
    //    Class.forName("com.mysql.cj.jdbc.Driver");
    static String url = "jdbc:mysql://localhost:3306/products";
    static String username = "root";
    //Give the password to access MySQL server
    static String password = "suhail$@786";
    Connection con = null;
    Statement statement = null;
    ResultSet rs = null;

    public static void main(String[] args) throws SQLException {
//        selectRecords();
//         selectColumnFromRecords();
//          selectRecordsWithCondition();
//        selectRecordsWithExternalParameters(2);
//          selectRecordsWithPreparedStatement(24);
        insertRecord();
        // insertRecordWithVariables(18,"SP",780000);
        // insertRecordWithPreparedStatement(11,"MDH",670000);
        //deleteRecord();
        //deleteRecordWithVariables(22);
        //deleteRecordWithPreparedStatement(15);
        // updateRecord();
        // updateRecordWithVariables(18, 850000);
        //updateRecordWithPreparedStatement(17, 880000);
    }

    public static void selectRecords() throws SQLException {
        String query = "select * from productdetails";
        //Step 1 - connect database
        Connection connection = DriverManager.
                getConnection(url, username, password);
        //Step 2 - Creating statement
        Statement stmt = connection.createStatement();
        //Step 3 - Executing query and Processing resultset
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {

            System.out.print("\nId is:" + rs.getInt(1));
            System.out.print("\nName is:" + rs.getString(2));
            System.out.print("\nPrice is:" + rs.getDouble(3));
            System.out.print("\nQuantity is:" + rs.getInt(4));
        }
        //Step 4 - Close connection
        connection.close();
    }

    public static void insertRecord() throws SQLException {

        String query = "insert into productdetails values(4, 'car',9560000,18);";
        Connection connect = DriverManager.
                getConnection(url, username, password);
        Statement st = connect.createStatement();
        int row = st.executeUpdate(query);
        System.out.println("Number of rows affected:"
                + row);
        connect.close();
    }

    public static void selectColumnFromRecords() throws SQLException {
        String query = "select id, name, price from productdetails where id=1;";
        Connection con = DriverManager.getConnection(url,username,password);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        while(rs.next()) {
            System.out.print("\nId is:" + rs.getInt(1));
            System.out.print("\nName is:" + rs.getString(2));
            System.out.print("\nPrice is:" + rs.getDouble(3));
        }
        con.close();
    }
    public static  void selectRecordsWithCondition() throws SQLException {

        String query = "select id, name, price from productdetails where quantity>10;";
        Connection connection = DriverManager.
                getConnection(url,username, password);
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()) {
            System.out.print("\nId is:" + rs.getInt(1));
            System.out.print("\nName is:" + rs.getString(2));
            System.out.print("\nPrice is:" + rs.getDouble(3));
        }
        //Step 4 - Close connection
        connection.close();
    }

    public static  void selectRecordsWithExternalParameters(int id) throws SQLException {

        String query = "select id, name, price from productdetails " +
                "where id="+id+";";

        Connection connection = DriverManager.
                getConnection(url,username, password);
        //Step 2 - Creating statement
        Statement stmt = connection.createStatement();
        //Step 3 - Executing query and Processing resultset
        ResultSet rs = stmt.executeQuery(query);
        while(rs.next()) {
            System.out.print("\nId is:" + rs.getInt(1));
            System.out.print("\nName is:" + rs.getString(2));
            System.out.print("\nPrice is:" + rs.getDouble(3));
        }
        //Step 4 - Close connection
        connection.close();
    }
    public static  void selectRecordsWithPreparedStatement(int quantity) throws SQLException {
        Connection connection = DriverManager.
                getConnection(url,username, password);
        PreparedStatement pstmt = connection.
                prepareStatement("select id, name, price , quantity from productdetails where quantity=?");
        pstmt.setInt(1,quantity);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()) {
            System.out.print("\nId is:" + rs.getInt(1));
            System.out.print("\nName is:" + rs.getString(2));

        }
        //Step 4 - Close connection
        connection.close();
    }


}
