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

String strSQL = "select pw from zzz where no = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(no));

rs = pstmt.executeQuery();
rs.next();

String goodpw = rs.getString("pw").trim();
if(pw.equals(goodpw)){
	strSQL = "delete from zzz where no=?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(no));
	pstmt.executeUpdate();
	
	strSQL = "update zzz set no = no - 1 where no > ?";
	pstmt = conn.prepareStatement(strSQL);
	pstmt.setInt(1, Integer.parseInt(no));
	pstmt.executeUpdate();
	
	response.sendRedirect("listboard1.jsp");
} else {
	response.sendRedirect("delete_pass1.jsp?no=" + no);
}

rs.close();
pstmt.close();
conn.close();
%>
