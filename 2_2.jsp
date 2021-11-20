<%@ page language="java" contentType="text/html; carset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿼리 2-2</title>
</head>
<body>
<%
   String serverIP = "localhost";
   String strSID = "orcl";
   String porthum = "1521";
   String user = "university";
   String pass = "comp322";
   String url = "jdbc:oracle:thin:@" + serverIP + ":" + porthum + ":" + strSID;
   
   Connection conn = null;
   PreparedStatement pstmt;
   ResultSet rs = null;
   int cnt = 0;
   int i = 0;
   ResultSetMetaData rsmd = null;
   
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection(url, user, pass);
   String query = null;
   
   query = "(select Title, Pyear from Book, Publishment, Publisher where Bcode = bc and Pcode = Pc and Pname = '"
		         + request.getParameter("Q2_2Publisher") + "')";
   
   pstmt = conn.prepareStatement(query);
   rs = pstmt.executeQuery();
   
   out.println("<table border=\"1\">");
   rsmd = rs.getMetaData();
   cnt = rsmd.getColumnCount();
   
   for(i = 1; i <= cnt; i++) {
       out.println("<th>" + rsmd.getColumnName(i) + "</th>");
   }
   
   while(rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("</tr>");
		}

   out.println("</table>");
%>
   

</body>
</html>