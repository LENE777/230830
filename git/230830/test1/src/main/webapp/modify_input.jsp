<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
String no = request.getParameter("no");
String pw = request.getParameter("pw");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521/xe";
Class.forName(driver);
Connection conn = DriverManager.getConnection(url, "system", "0000");

PreparedStatement pstmt = null;
ResultSet rs = null;

String strSQL = "SELECT pw FROM zzz WHERE no = " + no + "";
pstmt = conn.prepareStatement(strSQL);

rs = pstmt.executeQuery();
rs.next();

String goodpw = rs.getString("pw").trim();
if (pw.equals(goodpw)) {
	response.sendRedirect("modify.jsp?no=" + no);
} else {
	response.sendRedirect("modify_pass.jsp?no=" + no);
}

rs.close();
pstmt.close();
conn.close();
%>
