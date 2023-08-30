<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
int no = Integer.parseInt(request.getParameter("no"));
String email = request.getParameter("email");
String pw = request.getParameter("pw");
String title = request.getParameter("title");
String content = request.getParameter("content");

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521/xe";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, "system", "0000");

PreparedStatement pstmt = null;

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE));

pstmt = conn.prepareStatement("update zzz set email=?, pw=?, title=?, content=?, date1=? where no=?");
pstmt.setString(1, email);
pstmt.setString(2, pw);
pstmt.setString(3, title);
pstmt.setString(4, content);
pstmt.setString(5, indate);
pstmt.setInt(6, no);
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("listboard1.jsp");
%>
