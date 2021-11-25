<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response</title>
</head>
<body>
<h1>Lab #9: Repeating Lab #5-3 via JSP</h1>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "BDM";
	String pass = "bdm";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	ResultSetMetaData rsmd;
	int cnt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
%>

<h4>----------Q4 Result----------</h4>
<%
String BT1 = request.getParameter("Booktitle");
String query4_1 = "select Cname from Customer where Cid = (select Ci from Rating, Book where Ci = Cid and Bc = Bcode and Title = '" + BT1 + "')";
pstmt = conn.prepareStatement(query4_1);
rs = pstmt.executeQuery();

out.println("<table border=\"1\">");
rsmd = rs.getMetaData();
cnt = rsmd.getColumnCount();
for(int i=1; i<=cnt; i++){
	out.println("<th>" + rsmd.getColumnName(i)+ "</th>");
}

while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("</tr>");
}
out.println("</table>");


String SN = request.getParameter("Seriesname");
String query4_2 = "select Title, Price from Book where Bcode = (select Bc from Series where Bc = Bcode and Sname = '" + SN + "')";
pstmt = conn.prepareStatement(query4_2);
rs = pstmt.executeQuery();

out.println("<table border=\"1\">");
rsmd = rs.getMetaData();
cnt = rsmd.getColumnCount();
for(int i=1; i<=cnt; i++){
	out.println("<th>" + rsmd.getColumnName(i)+ "</th>");
}

while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("</tr>");
}
out.println("</table>");
%>


<h4>----------Q5 Result----------</h4>
<%
String GN = request.getParameter("Genre1");
out.println(GN);
String query5_1 = "select Title from Book where exists ( select * from Genre, OF_Genre where Bc = Bcode and Gc = '" + GN + "') order by Title ASC";
pstmt = conn.prepareStatement(query5_1);
rs = pstmt.executeQuery();

out.println("<table border=\"1\">");
rsmd = rs.getMetaData();
cnt = rsmd.getColumnCount();
for(int i=1; i<=cnt; i++){
	out.println("<th>" + rsmd.getColumnName(i)+ "</th>");
}

while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("</tr>");
}
out.println("</table>");


String NVB = request.getParameter("notvaluedbook");
out.println(NVB);
if(NVB.equals("yes"))
{
	String query5_2 = "select Title from Book where not exists ( select * from Rating where Bc = Bcode )";
	pstmt = conn.prepareStatement(query5_2);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
	for(int i=1; i<=cnt; i++){
		out.println("<th>" + rsmd.getColumnName(i)+ "</th>");
	}

	while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
}

%>


</body>
</html>