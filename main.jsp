<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response</title>
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
	
%>

<h4>----------Result----------</h4>
<%
String sq = request.getParameter("selectq");
switch(sq){
case "q1_1": 
	String query1_1 = null;

	query1_1 = "(select Title, Price from Book where Price = '" + request.getParameter("Q1_1Price") + "')";

	pstmt = conn.prepareStatement(query1_1);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}
	out.println("</table>");
	break;
case "q1_2": 
	String query1_2 = null;

	query1_2 = "(select Pcode, Pname, Founder, Fyear from Publisher where Pcode = '"
			          + request.getParameter("Q1_2Publisher") + "')";

	pstmt = conn.prepareStatement(query1_2);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}

	out.println("</table>");
	break;
case "q2_1": 
	String query2_1 = null;

	query2_1 = "(select Title, Score from Book, Rating, Customer where Bcode = bc and Cid = ci and Cname = '"
			         +request.getParameter("Q2_1Customer") + "')";

	pstmt = conn.prepareStatement(query2_1);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}
	out.println("</table>");
	break;
case "q2_2": 
	String query2_2 = null;

	query2_2 = "(select Title, Pyear from Book, Publishment, Publisher where Bcode = bc and Pcode = Pc and Pcode = '"
			         + request.getParameter("Q2_2Publisher") + "')";

	pstmt = conn.prepareStatement(query2_2);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}
	out.println("</table>");
	break;
case "q3_1": 
	String query3_1 = null;

	String SA = request.getParameter("ScoreAverage");

	if(SA != null && SA.equals("yes")) {
	query3_1 = "(select Wname, ROUND(AVG(Score), 0) as Average from Writer, Book, Rating where Bcode = Bc and Wcode = Wc group by Wname)";

	pstmt = conn.prepareStatement(query3_1);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}
	out.println("</table>");
	}

	break;
case "q3_2": 
	String query3_2 = null;

	query3_2 = "(select Pname, COUNT(*) as Count_Book from Book, Publisher, Publishment where Bcode = Bc and Pcode = Pc group by Pname having COUNT(*) >= "
			   + request.getParameter("Q3_2Count") + ")";

	pstmt = conn.prepareStatement(query3_2);
	rs = pstmt.executeQuery();

	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();

	for(int i = 1; i <= cnt; i++) {
	    out.println("<th>" + rsmd.getColumnName(i) + "</th>");
	}

	while(rs.next()) {
				out.println("<tr>");
				out.println("<td>" + rs.getString(1) + "</td>");
				out.println("<td>" + rs.getString(2) + "</td>");
				out.println("</tr>");
			}
	out.println("</table>");
	break;
case "q4_1": 
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
	break;
case "q4_2": 
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
	break;
case "q5_1": 
	String GN = request.getParameter("Genre1");
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
	break;
case "q5_2": 
	String NVB = request.getParameter("notvaluedbook");
	if(NVB != null && NVB.equals("yes"))
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
	break;
case "q6_1": 
	String query6_1 = "select Title from Book where Wc in (select Wcode from Writer where Wname = '"
			+ request.getParameter("Q6-1Write")
			+ "')";

	pstmt = conn.prepareStatement(query6_1);
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
		out.println("</tr>");
	}
	
	out.println("</table>");
	break;
case "q6_2": 
	String query6_2 = "select Title from Book where Ai in (select Aid from Administer where Aname = '"
			+ request.getParameter("Q6-2Administer")
			+ "')";

	pstmt = conn.prepareStatement(query6_2);
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
		out.println("</tr>");
	}
	
	out.println("</table>");
	break;
case "q7_1": 
	String query7_1 = "with SOMEBOOKS as (select Bcode from Book, Genre, OF_Genre where Bcode = Bc and Gcode = Gc and Gcode = '"
			+ request.getParameter("Q7-1Genre")
			+ "') select b1.Title, b1.Price from Book b1, SOMEBOOKS b2 where Price > "
			+ request.getParameter("Q7-1Price")
			+ " and b1.Bcode = b2.Bcode";

	pstmt = conn.prepareStatement(query7_1);
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
	break;
case "q7_2": 
	out.println(request.getParameter("Q7-2Date"));
	out.println(request.getParameter("Q7-2Price"));
	String query7_2 = "with SOMEBOOKS as (select bcode from Book, Publishment, Publisher where Bc = Bcode and Pc = Pcode and Pyear >= '"
			+ request.getParameter("Q7-2Date")
			+ "') select b1.Title, b1.Price from Book b1, SOMEBOOKS b2 where Price <= "
			+ request.getParameter("Q7-2Price")
			+ " and b1.Bcode = b2.Bcode";

	pstmt = conn.prepareStatement(query7_2);
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
	break;
case "q8_1": 
	String query8_1 = "select Title, Price from Book, Writer where Wc = Wcode and Wname = '"
			+ request.getParameter("Q8-1Writer")
			+ "' order by Price "
			+ request.getParameter("Q8-1Sort");

	pstmt = conn.prepareStatement(query8_1);
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
	break;
case "q8_2": 
	String query8_2 = "select Title, price, Pname, Pyear from Book, Publishment, Publisher where Bc = Bcode and Pc = Pcode order by Pyear " + request.getParameter("Q8-2Sort");

	pstmt = conn.prepareStatement(query8_2);
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
		out.println("<td>" + rs.getString(3) + "</td>");
		out.println("<td>" + rs.getString(4) + "</td>");
		out.println("</tr>");
	}
	
	out.println("</table>");
	break;
case "q9_1": 
	String query9_1 = "select Wname, Count( * ) as Count_Book from Writer, Book where Wcode = Wc group by Wname order by Count_Book "
			+ request.getParameter("Q9-1Sort");

	pstmt = conn.prepareStatement(query9_1);
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
	break;
case "q9_2": 
	String query9_2 = "select Title, ROUND(AVG(Score), 0) as AVERAGE_SCORE from Book, Rating where Bc = Bcode group by Title order by AVERAGE_SCORE "
			+ request.getParameter("Q9-2Sort");

	pstmt = conn.prepareStatement(query9_2);
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
	break;
case "q10_1": 
	String query10_1 = "(select Bcode, Title from Book, Series where Bcode = Bc) intersect (select Bcode, Title from Book, Genre, OF_Genre where Bcode = Bc and Gcode = Gc and Gcode = '"
			+ request.getParameter("Q10-1Genre") + "')";
		
	pstmt = conn.prepareStatement(query10_1);
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
	break;
case "q10_2": 
	String query10_2 = "(select Bcode, Title from Book, Publisher, Publishment where Bcode = Bc and Pcode = Pc and Pcode = '"
			+ request.getParameter("Q10-2PUBLISHER") + "')"
			+ "minus (select Bcode, Title from Book, Genre, OF_Genre where Bcode = Bc and Gcode = Gc and Gcode = '"
			+ request.getParameter("Q10-2Genre") + "')";

	pstmt = conn.prepareStatement(query10_2);
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
	break;
	
	
case "dbm":
	String inputsql = request.getParameter("dbsql");
	String[] inputsplit = inputsql.split("\n");
	StringBuilder sb = new StringBuilder();
	char semi = ';';//명령문 끝을 확인
	int lensb = 0;//문자 길이
	int linenum = 1;//입력 줄 개수
	int k=0;
	while(k<inputsplit.length) {
		// >> : 문장 시작 부분,  숫자 : 뒤에 이어지는 line number
		if(linenum == 1) {
			out.print(">>");
		}
		else {
			out.print(linenum + " ");
		}
		
		sb.append(inputsplit[k]);
		
		if(sb.length() == lensb) {//아무것도 입력하지 않은 경우(이전 문자열 길이가 유지된 경우)
			if(sb.length() > 0) {
				sb.delete(0, sb.toString().length());
				lensb = 0;
			}
			linenum = 1;
			continue;
		}
		
		//주석
		if(sb.toString().strip().substring(0,2).equals("--")) {
			sb.delete(0, sb.toString().length());
			continue;
		}
		
		if(Character.compare(sb.toString().charAt(sb.toString().length() - 1), semi) == 0) { //문자열 끝이 ;으로 끝난 경우
			
			//연결해제하기
			if(sb.toString().strip().equals("exit;") || sb.toString().strip().equals("EXIT;")) {
				break;
			}

			//if select  else if  create, drop, insert, delete, update, with
			if( sb.toString().strip().substring(0,4).equals("with") || sb.toString().strip().substring(0,4).equals("WITH") || sb.toString().strip().substring(0,6).equals("select") || sb.toString().strip().substring(0,6).equals("SELECT") || sb.toString().strip().substring(0,7).equals("(select") || sb.toString().strip().substring(0,7).equals("(SELECT") || sb.toString().strip().substring(0,8).equals("( select") || sb.toString().strip().substring(0,8).equals("( SELECT")) {
				
				try {
					conn.setAutoCommit(false);
					pstmt = conn.prepareStatement(sb.toString().substring(0, sb.toString().length() - 1));
					rs = pstmt.executeQuery();
					rsmd = rs.getMetaData();
					cnt = rsmd.getColumnCount();//칼럼 개수
					
					ArrayList<String> queryrs = new ArrayList<String>();
					int counttuple = 0;
					
					//select 결과 저장
					while(rs.next()) {
						for(int i = 1; i <= cnt; i++) {
							queryrs.add(rs.getString(i));
						}
					}
					
					out.println("<table border=\"1\">");
					
					//결과 출력 컬럼 네임
					for(int i=1; i <= cnt; i++) {
						out.println("<th>" + rsmd.getColumnName(i) + "</th>");
					}
					System.out.println("\n----------------------------------------------");
					
					//결과 출력
					out.println("<tr>");
					for(int i=1; i<=queryrs.size(); i++) {
						out.print("<td>" + queryrs.get(i - 1) + "</td>");
						if(i % cnt == 0) {
							out.println("</tr>");
							out.println("<tr>");
							counttuple++;
						}
					}
					out.println("</tr>");
					
					out.println(counttuple + "개가 나왔습니다.");
					
					//리스트 비우기
					queryrs.clear();
					rs.close();
					out.println("Execute select");
				}catch(SQLException ex2) {
					out.println("sql error = " + ex2.getMessage() + "\n");
				}
			}
			else {
				try {
					conn.setAutoCommit(false);
					Statement stmt = conn.createStatement();
					int res = stmt.executeUpdate(sb.toString().substring(0, sb.toString().length() - 1));
					out.println("Execute command");
				}catch(SQLException ex2) {
					out.println("\nsql error = " + ex2.getMessage() + "\n");
				}
			}
			sb.delete(0, sb.toString().length());
			lensb = 0;
			linenum = 1;
		}
		else {
			sb.append(" ");
			lensb = sb.length();
			linenum++;
		}
		
		k++;
	}

	break;

}
%>

<br><br><button onclick="history.back()">확인</button><br><br>

</body>
</html>