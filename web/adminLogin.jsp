<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
</head>
<body>
  <header>
    <h1>Admin Login</h1>
  </header>
  <main>


    <%
      
      String adminUsername = request.getParameter("adminUsername");
      String adminPassword = request.getParameter("adminPassword");
      boolean isAuthenticated = false;

      
      String correctUsername = "admin";
      String correctPassword = "admin123";

      
      if (adminUsername != null && adminPassword != null && adminUsername.equals(correctUsername) && adminPassword.equals(correctPassword)) {
          
          isAuthenticated = true;
          response.sendRedirect("home.jsp"); 
      } else if (adminUsername != null || adminPassword != null) {
          
          out.println("<p style='color:red;'>Invalid username or password. Please try again.</p>");
      }
    %>
  </main>
</body>
</html>
