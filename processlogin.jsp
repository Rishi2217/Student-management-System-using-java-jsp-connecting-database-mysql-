<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Process</title>
</head>
<body>

<%
    // JDBC driver name and database URL
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/student";

    // Database credentials
    String USER = "root";
    String PASS = "darsh@8896";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Register JDBC driver
        Class.forName(JDBC_DRIVER);

        // Open a connection
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?", "root","darsh@8896");

        // Retrieve data from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Query to check if the email and password match in the database
        String query = "SELECT * FROM signin WHERE email=? AND password=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        // Execute the query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // User authenticated, redirect to a welcome page or dashboard
            response.sendRedirect("Home.jsp");
        } else {
            // Invalid credentials, display an error message
            out.println("<div style='color:red;'>Invalid email or password. Please try again.</div>");
        }

        pstmt.close();

    } catch (SQLException se) {
        // Handle errors for JDBC
        se.printStackTrace();
    } catch (Exception e) {
        // Handle other exceptions
        e.printStackTrace();
    } finally {
        // Finally block used to close resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
%>

</body>
</html>
