<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Processing Appointment</title>
</head>
<body>
<%

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String date = request.getParameter("date");
    String doctorId = request.getParameter("doctor");

 
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    PreparedStatement checkStmt = null;
    Connection conn = null;

    try {
   
        Class.forName("oracle.jdbc.driver.OracleDriver");

   
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##SOHAM", "root");

 
        String checkQuery = "SELECT COUNT(*) FROM C##SOHAM.appointments " +
                            "WHERE appointment_date = TO_DATE(?, 'YYYY-MM-DD') " +
                            "AND doctor_id = ?";
        
        checkStmt = conn.prepareStatement(checkQuery);
        checkStmt.setString(1, date);
        checkStmt.setString(2, doctorId);
        
        rs = checkStmt.executeQuery();
        
        if (rs.next() && rs.getInt(1) >= 5) {
      
            out.println("<p style='color: red;'>Error: The doctor already has 5 appointments on this date. Please choose another date.</p>");
        } else {
         
            String query = "INSERT INTO C##SOHAM.appointments (appointment_id, patient_name, patient_email, appointment_date, doctor_id) " +
                           "VALUES (C##SOHAM.appointments_seq.NEXTVAL, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, date);
            pstmt.setString(4, doctorId);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
               
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("date", date);
                request.setAttribute("doctorId", doctorId);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                out.println("<p style='color: red;'>Error: Appointment could not be booked. Please try again.</p>");
            }
        }

    } catch (SQLIntegrityConstraintViolationException e) {
       
        out.println("<p style='color: red;'>Error: Appointment conflict detected. Please select another time or doctor.</p>");
    } catch (SQLException e) {
        if (e.getErrorCode() == -20001) { 
          
            out.println("<p style='color: red;'>Error: Doctor already has 5 appointments for the selected date.</p>");
        } else if (e.getErrorCode() == -20002) { 
          
            out.println("<p style='color: red;'>Error: Cannot book an appointment for a past date.</p>");
        } else {
            e.printStackTrace();
            out.println("<p style='color: red;'>Database Error: " + e.getMessage() + "</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Unexpected Error: " + e.getMessage() + "</p>");
    } finally {
      
        try {
            if (rs != null) rs.close();
            if (checkStmt != null) checkStmt.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
