<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		ResultSetMetaData rsmd = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		String query = null;
	%>
	
	<%
		query = "with SOMEBOOKS as (select Bcode from Book, Genre, OF_Genre where Bcode = Bc and Gcode = Gc and Gname = '"
				+ request.getParameter("Q7-1Genre")
				+ "') select b1.Title, b1.Price from Book b1, SOMEBOOKS b2 where Price > "
				+ request.getParameter("Q7-1Price")
				+ " and b1.Bcode = b2.Bcode";
	
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		out.println("<table border=\"1\">");
		rsmd = rs.getMetaData();
		cnt = rsmd.getColumnCount();
		
		for(int i=1; i <= cnt; i++) {
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