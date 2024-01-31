<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Sign-In</title>

<style>
body {
font-family: 'Arial', sans-serif; margin: 0;
padding: 0;
background-color: #f4f4f4;
}
.container { width: 50%; margin: auto;
margin-top: 50px;
box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
form {
background: black; padding: 20px; border-radius: 8px;
border: 2px solid #ccc; display: grid;
gap: 10px;
}

label {
font-weight: bold; color: white;
}

input {
width: 100%; padding: 8px;
 
box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px;
}

button {
background-color: #4caf50; color: white;
padding: 10px; border: none; border-radius: 4px; cursor: pointer;
}

button:hover {
background-color: #45a049;
}
</style>
</head>
<body>
<div class="container">
<form action="process.jsp" method="post">
<label for="name">Name:</label>
<input type="text" id="name" name="name" required>
<label for="email">Email:</label>
<input type="email" id="email" name="email" required>

<label for="phone">Phone Number:</label>
<input type="tel" id="phone" name="phone" required>

<label for="department">Department:</label>
<input type="text" id="department" name="department" required>

<label for="class">Class:</label>
<input type="text" id="class" name="studentClass" required>
<label for="rollno">Roll Number:</label>
<input type="text" id="rollno" name="rollNumber" required>
<label for="gender">Gender:</label>
<input type="radio" id="male" name="gender" value="male" checked>
<label for="male">Male</label>
 
<input type="radio" id="female" name="gender" value="female">
<label for="female">Female</label>

<label for="password">Password:</label><input type="password" id="password" name="password" required>
<button type="submit">Sign In</button>

</form>
</div>
</body>

</html>

