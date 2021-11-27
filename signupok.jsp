<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
<%
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "BDM";
	String pass = "bdm";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	
	Connection conn = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	
	String ID = request.getParameter("id");
	String PW = request.getParameter("pw");
	String PHONE = request.getParameter("phone1") + "-" +request.getParameter("phone2") + "-" + request.getParameter("phone3");
	String GENDER = request.getParameter("gender");
	String NAME = request.getParameter("name");
	
	
	String insertsql = "insert into CUSTOMER values('" + ID + "', '" + PW + "', '" + NAME + "', '" + GENDER + "', '" + PHONE + "')";
	
	try{
		Statement stmt = conn.createStatement();
		int rs = stmt.executeUpdate(insertsql);
		if(rs == 1){
			conn.commit();
			response.sendRedirect("signupsuccess.html");
		}
		else{
			response.sendRedirect("signupfail.html");	
		}
	}catch(SQLException e){
		out.println("sql error = " + e.getMessage());
		response.sendRedirect("signupfail.html");
	}
%>

</body>
</html>