<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
String email = request.getParameter("email");
String pw = request.getParameter("pw");
String title = request.getParameter("title");
String content = request.getParameter("content");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521/xe";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, "system", "0000");

PreparedStatement pstmt1, pstmt2 = null;

//작성 년,월,일,시간,분 으로 표시
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE));

String strSQL = "INSERT INTO zzz(email, pw, date1, title, content, count) VALUES (?,?,?,?,?,?)";
pstmt2 = conn.prepareStatement(strSQL);
pstmt2.setString(1, email);
pstmt2.setString(2, pw);
pstmt2.setString(3, indate);
pstmt2.setString(4, title);
pstmt2.setString(5, content);
pstmt2.setString(6, "0");
pstmt2.executeUpdate();

pstmt2.close();
conn.close();

response.sendRedirect("listboard1.jsp");
%>

