<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<h1>BDM program</h1>
<h2>로그인</h2>

<form action="loginok.jsp" method="post">
ID : <input type="text" name="loginid"> <input type="checkbox" name="booladmin" value="true">관리자 <br>
PW : <input type="password" name="loginpw"><br>
<input type="submit" value="로그인">   
</form>
<button onclick="location.href='signup.jsp'">회원가입</button>
</body>
</html>