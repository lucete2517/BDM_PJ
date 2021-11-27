<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중</title>
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
	PreparedStatement pstmt;
	ResultSet rs;
	ResultSetMetaData rsmd;
	int cnt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	String loginid = request.getParameter("loginid");
	String loginpw = request.getParameter("loginpw");
	String booladmin = request.getParameter("booladmin");
	
	String sqlidpw;
	if(booladmin != null){
		sqlidpw = "select Aid, Aname from ADMINISTER where Aid = ? and PW = ?";
	}
	else{
		sqlidpw = "select Cid, Cname from CUSTOMER where Cid = ? and PW = ?";
	}
	
	
	pstmt = conn.prepareStatement(sqlidpw);
	pstmt.setString(1, loginid);
	pstmt.setString(2, loginpw);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){//로그인성공
		session.setAttribute("user", loginid);
		if(booladmin != null){
			session.setAttribute("username", rs.getString(2));
			response.sendRedirect("mainq.html");
		}
		else{
			session.setAttribute("username", rs.getString(2));
			response.sendRedirect("cusmain.jsp");
		}
	}
	else{//로그인실패
		response.sendRedirect("loginfail.html");
	}

%>
</body>
</html>