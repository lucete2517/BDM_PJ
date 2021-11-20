<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		query = "(select Bcode, Title from Book, Publisher, Publishment where Bcode = Bc and Pcode = Pc and Pname = '"
				+ request.getParameter("Q10-2PUBLISHER") + "')"
				+ "minus (select Bcode, Title from Book, Genre, OF_Genre where Bcode = Bc and Gcode = Gc and Gname = '"
				+ request.getParameter("Q10-2Genre") + "')";
	
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