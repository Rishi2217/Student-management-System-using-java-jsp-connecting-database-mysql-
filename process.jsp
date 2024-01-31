<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Process Registration</title>
</head>
<body>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String department = request.getParameter("department");
    String studentClass = request.getParameter("studentClass");
    String rollNumber = request.getParameter("rollNumber");
    String gender = request.getParameter("gender");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "darsh@8896");
        Statement st = conn.createStatement();

        int i = st.executeUpdate("INSERT INTO signin (name, email, phone, department, class, rollno, gender, Password) VALUES ('" + name + "','" + email + "','" + phone + "','" + department + "','" + studentClass + "','" + rollNumber + "','" + gender + "','" + password + "')");
        
        if (i > 0) {
            out.println("<div style='color:green;'>Data is successfully inserted!</div>");
            out.println("<a href='Login.jsp'>Login</a>");
        } else {
            out.println("<div style='color:red;'>Error: Data couldn't be inserted.</div>");
        }

    } catch (Exception e) {
        out.println("<div style='color:red;'>Error: " + e.getMessage() + "</div>");
        e.printStackTrace();
    }
%><%
    // Your existing code to process the form data and insert into the database

    // After successfully inserting into the database, set the email as a session attribute
    
    session.setAttribute("email", email);

    // Redirect to the user details page
   
%>

</body>
</html>
