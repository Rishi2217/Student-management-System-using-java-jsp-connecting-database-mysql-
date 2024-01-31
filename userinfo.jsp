<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: auto;
            margin-top: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #333;
            padding: 20px;
            border-radius: 8px;
            border: 2px solid #555;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #777;
            text-align: left;
        }

        th {
            background-color: #444;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #555;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>User Details</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Department</th>
                <th>Class</th>
                <th>Roll Number</th>
                <th>Gender</th>
            </tr>
        </thead>
        <tbody>
            <% 
                try {
                    // Retrieve user information from session
                    String email = (String) session.getAttribute("email");

                    // Check if the user is logged in
                    if (email != null && !email.isEmpty()) {
                        // Database connection details
                        String dbURL = "jdbc:mysql://localhost:3306/student";
                        String dbUser = "root";
                        String dbPassword = "darsh@8896";

                        // Establish a database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","darsh@8896");

                        // Use a prepared statement to avoid SQL injection
                        String query = "SELECT * FROM signin WHERE email=?";
                        PreparedStatement preparedStatement = conn.prepareStatement(query);
                        preparedStatement.setString(1, email);

                        // Execute the query
                        ResultSet rs = preparedStatement.executeQuery();

                        // Display user details in a table
                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("name") + "</td>");
                            out.println("<td>" + rs.getString("email") + "</td>");
                            out.println("<td>" + rs.getString("phone") + "</td>");
                            out.println("<td>" + rs.getString("department") + "</td>");
                            out.println("<td>" + rs.getString("Class") + "</td>");
                            out.println("<td>" + rs.getString("rollno") + "</td>");
                            out.println("<td>" + rs.getString("gender") + "</td>");
                            out.println("</tr>");
                        }

                        // Close resources
                        rs.close();
                        preparedStatement.close();
                        conn.close();
                    } else {
                        out.println("<tr><td colspan='7'>Invalid or empty email parameter.</td></tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
