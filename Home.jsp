<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
        }

        .navbar {
            background-color: #333;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .content {
            padding: 20px;
        }
    </style>
</head>

<body>

    <div class="navbar">
        <a href="result.jsp">Results</a>
        <a href="userinfo.jsp">User Info</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="content">
        <h1>Welcome to Pillai College Student Portal</h1>
        <p>Empowering Minds, Enriching Lives</p>
        <p>Explore the latest updates, view your results, and manage your student information with ease.</p>
    </div>

</body>

</html>
