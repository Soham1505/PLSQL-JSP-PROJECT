<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Appointment Confirmation</title>
  <link rel="stylesheet" href="index.css">
</head>
<body>
  <header>
    <h1>Appointment Confirmation</h1>
  </header>
  <main>
    <section class="confirmation-container">
      <h2>Your Appointment is Confirmed!</h2>
      <p>Here are the details of your appointment:</p>

      <%
        String name = (String) request.getAttribute("name");
        String email = (String) request.getAttribute("email");
        String date = (String) request.getAttribute("date");
        String doctorId = (String) request.getAttribute("doctorId");
        String doctorName = "";
        String clinicAddress = "Swami Smarth Hospital , Navi mumbai";
        String workingHours = "Monday to Saturday / 24/7 hours";

        try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");

         
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##SOHAM", "root");

          
            String query = "SELECT doctor_name FROM C##SOHAM.doctors WHERE doctor_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, doctorId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                doctorName = rs.getString("doctor_name");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving doctor details: " + e.getMessage() + "</p>");
        }
      %>

      <table border="1" cellpadding="10" cellspacing="0" style="margin: 0 auto; width: 80%; text-align: left;">
        <tr>
          <th>Patient Name</th>
          <td><%= name %></td>
        </tr>
        <tr>
          <th>Patient Email</th>
          <td><%= email %></td>
        </tr>
        <tr>
          <th>Appointment Date</th>
          <td><%= date %></td>
        </tr>
        <tr>
          <th>Doctor</th>
          <td><%= doctorName %></td>
        </tr>
        <tr>
          <th>Clinic Address</th>
          <td><%= clinicAddress %></td>
        </tr>
        <tr>
          <th>Working Hours</th>
          <td><%= workingHours %></td>
        </tr>
      </table>

      <button onclick="window.location.href='index.jsp';">Book Another Appointment</button>
    </section>
  </main>
</body>
</html>
