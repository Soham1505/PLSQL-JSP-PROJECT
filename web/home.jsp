<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Appointment Search</title>
  <link rel="stylesheet" href="home.css">
</head>
<body>
  <header>
    <h1>Appointment Search</h1>
  </header>
  <main>
    <section class="search-container">
      <h2>Check Appointments for a Specific Day</h2>
      <!-- Form to search for appointments by date -->
      <form action="home.jsp" method="post">
        <label for="date">Enter Date:</label>
        <input type="date" id="date" name="date" required>
        <button type="submit">Search</button>
      </form>
    </section>

    <section class="results-container">
      <h2>Appointments on Selected Date</h2>
      <%
        String date = request.getParameter("date");

        if (date != null && !date.isEmpty()) {
            try {
             
                Class.forName("oracle.jdbc.driver.OracleDriver");

                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##SOHAM", "root");

                String query = "SELECT appointment_id, patient_name, patient_email, appointment_date, doctor_name "
                             + "FROM appointments_overview "
                             + "WHERE appointment_date = TO_DATE(?, 'YYYY-MM-DD')";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, date);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    out.println("<table>");
                    out.println("<tr><th>Patient Name</th><th>Email</th><th>Appointment Date</th><th>Doctor</th><th>Action</th></tr>");

                    do {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("patient_name") + "</td>");
                        out.println("<td>" + rs.getString("patient_email") + "</td>");
                        out.println("<td>" + rs.getDate("appointment_date") + "</td>");
                        out.println("<td>" + rs.getString("doctor_name") + "</td>");
                        out.println("<td>");
                        out.println("<form action='cancelAppointment.jsp' method='post'>");
                        out.println("<input type='hidden' name='appointment_id' value='" + rs.getInt("appointment_id") + "'>");
                        out.println("<button type='submit' class='cancel-btn'>Cancel</button>");
                        out.println("</form>");
                        out.println("</td>");
                        out.println("</tr>");
                    } while (rs.next());
                    out.println("</table>");
                } else {
                    out.println("<p>No appointments found for the selected date.</p>");
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        }
      %>
    </section>

    <section class="doctor-details">
      <h2>Doctor's Information</h2>
      <div class="doctor-info">
        <div class="details">
          <p><strong>Doctor Name:</strong>Dr Soham </p>
          <p><strong>Specialty:</strong> Cardiologist</p>
          <p><strong>Address:</strong> Swami Samartha Hospital Navi Mumbai</p>
          <p><strong>Contact Info:</strong> +91 8767564387</p>
        </div>
        <div class="photo">
          <img src="drpng.webp" alt="Doctor's Photo" width="400" height="300" />
        </div>
      </div>
    </section>

    <section class="buttons-container">
      <button onclick="window.location.reload();">Back</button>
      <button onclick="window.location.href='index.jsp';">Logout</button>
    </section>
  </main>
</body>
</html>
