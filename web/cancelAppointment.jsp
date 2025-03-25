<%@ page import="java.sql.*" %>

<%
   
    String appointmentId = request.getParameter("appointment_id");

    if (appointmentId != null && !appointmentId.isEmpty()) {
        try {
           
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "C##SOHAM", "root");

          
            String query = "{ ? = CALL cancel_appointment(?) }";
            CallableStatement cstmt = conn.prepareCall(query);
            
            cstmt.registerOutParameter(1, Types.VARCHAR);
            cstmt.setString(2, appointmentId);

            cstmt.execute();
            
           
            String resultMessage = cstmt.getString(1);
            out.println("<p>" + resultMessage + "</p>");

            conn.close();

            if (resultMessage.contains("successfully")) {
                response.sendRedirect("home.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>No appointment ID provided.</p>");
    }
%>
