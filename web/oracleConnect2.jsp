<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Oracle XE Database Connection</title>
</head>
<body>

<h2>Data from Oracle XE Database</h2>

<%
  
    String url = "jdbc:oracle:thin:@localhost:1521:XE";  
    String username = "sys as sysdba";                 
    String password = "root";                          

    // JDBC objects
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
      
        Class.forName("oracle.jdbc.OracleDriver");

       
        conn = DriverManager.getConnection(url, username, password);

       
        stmt = conn.createStatement();

      
        String sql = "SELECT ID, NAME, JOB, SALARY FROM employees";
        rs = stmt.executeQuery(sql);

      
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Job</th><th>Salary</th></tr>");
        
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("ID") + "</td>");
            out.println("<td>" + rs.getString("NAME") + "</td>");
            out.println("<td>" + rs.getString("JOB") + "</td>");
            out.println("<td>" + rs.getDouble("SALARY") + "</td>");
            out.println("</tr>");
        }

        out.println("</table>");
    } catch (ClassNotFoundException e) {
        out.println("<p>Error: JDBC Driver not found. Ensure ojdbc8.jar is added to the project.</p>");
    } catch (SQLException e) {
        out.println("<p>Database Error: " + e.getMessage() + "</p>");
    }
    
    finally {
     
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
