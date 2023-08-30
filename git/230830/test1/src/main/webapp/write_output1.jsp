<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>게시판</title>
<style type='text/css'>
<!--
a:link {
	font-family: "";
	color: white;
	text-decoration: none;
}

a:visited {
	font-family: "";
	color: white;
	text-decoration: none;
}

a:hover {
	font-family: "";
	color: white;
	text-decoration: underline;
}
-->
</style>

</head>

<body>

	<%
	String no = request.getParameter("no");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521/xe";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "system", "0000");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {

		String strSQL = "SELECT * FROM zzz WHERE no = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(no));

		rs = pstmt.executeQuery();
		rs.next();

		String email = rs.getString("email");
		String title = rs.getString("title");
		String content = rs.getString("content").trim();
		String date = rs.getString("date1");
		int count = rs.getInt("count");
	%>
	<%!
	//게시글 내용에 표시되는 이메일도 @ 앞, 뒤 한글자씩 *표 마스킹
	public String maskEmail(String email) {
		if (email == null || email.isEmpty()) {
			return email;
		}

		int atIndex = email.indexOf('@');
		if (atIndex > 0 && atIndex < email.length() - 1) {
			char[] emailChars = email.toCharArray();
			emailChars[atIndex - 1] = '*';
			emailChars[atIndex + 1] = '*';
			return new String(emailChars);
		}
		return email;
	}%>

	<center>
		
		<TABLE bgcolor='ffffff' border='0' cellspacing=0 cellpadding=0
			width='600'>
			<TR>

				<TD align='center'><font color='323232' size='5'><b><%=title%></font>
				</TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding='0'
			cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding=3
			cellspacing=3>
			<TR>
				<TD align='left'><font color='323232' size='2'>글번호: <%=no%>
						| 작성자 : <%=maskEmail(email)%></font></TD>

				<TD align=right><font color='323232' size='2'>작성일: <%=date%>
						| 조회수: <%=count%></font></TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding='0'
			cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' cellspacing=0 cellpadding=0
			width='600' height=300>
			<TR>
				<TD><font color='323232' size='2' color=''>&nbsp;&nbsp;<%=content%></font>
				</TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding='0'
			cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<TABLE bgcolor='ffffff' border='0' width='600'>
			<TR>
				<td align='left'><input type='Button' value='수정' name='Page'
					onClick="location.href='modify_pass.jsp?no=<%=no%>'"> <input
					type='Button' value='삭제' name='Page'
					onClick="location.href='delete_pass1.jsp?no=<%=no%>'"></td>

				<TD align='right'><input type='Button' value='글쓰기' name='Page'
					onClick="location.href='write1.jsp?no=<%=no%>'"> <input
					type='Button' value='목록보기' name='Page'
					onClick="location.href='listboard1.jsp?no=<%=no%>'"></TD>
			</TR>
		</TABLE>
		<%
		//글 조회수
		strSQL = "UPDATE zzz SET count=count+1 WHERE no = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(no));
		pstmt.executeUpdate();

		} catch (SQLException e) {
		out.print("SQL에러 " + e.toString());
		} catch (Exception ex) {
		out.print("JSP에러 " + ex.toString());
		} finally {
		rs.close();
		pstmt.close();
		conn.close();
		}
		%>
	
</body>
</html>