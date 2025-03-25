<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Doctor Appointment Management</title>
  <link rel="stylesheet" href="index.css">
</head>
<body>
  <header>
    <h1>Doctor Appointment Management</h1>
  </header>
  <main>
 
    <section class="appointment-form-container">
      <h2>Book an Appointment</h2>
      <form action="bookAppointment.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="date">Appointment Date:</label>
        <input type="date" id="date" name="date" required>
        
        <label for="doctor">Select Doctor:</label>
        <select id="doctor" name="doctor" required>
          <%
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##SOHAM", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT doctor_id, doctor_name FROM C##SOHAM.doctors");
                while (rs.next()) {
          %>
          <option value="<%= rs.getInt("doctor_id") %>"><%= rs.getString("doctor_name") %></option>
          <% 
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
          %>
        </select>
        
        <button type="submit">Book Appointment</button>
      </form>
    </section>


    <section class="admin-login-container">
      <h2>Admin Login</h2>
      <form action="adminLogin.jsp" method="post">
        <label for="adminUsername">Username:</label>
        <input type="text" id="adminUsername" name="adminUsername" required>
        
        <label for="adminPassword">Password:</label>
        <input type="password" id="adminPassword" name="adminPassword" required>
        
        <button type="submit">Login</button>
      </form>
    </section>
  </main>
</body>
</html>
