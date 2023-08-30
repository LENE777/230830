<%@page	import="org.apache.catalina.filters.ExpiresFilter.XServletOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판</title>
<style type='text/css'>
<!--
a:link {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:visited {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:hover {
	font-family: "";
	color: black;
	text-decoration: underline;
}
-->
</style>
</head>

<body>
	<%
	
	int lastRow = 0;
	int i = 0;
	int no[] = { 0 };
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/zxc";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root", "0000");

	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM zzz ORDER BY no DESC";
	ResultSet rs = stmt.executeQuery(strSQL);

	while (rs.next()) {
		no[i] = rs.getInt("no");
	}
	lastRow = no[0];
	%>

	<center>

		<table bgcolor=ffffff width='600' cellpadding=3 cellspacing=3>
			<tr>
				<td align="center"><font color='323232' size='5'><b>
							게시판 </b></font></td>
			</tr>
		</table>



		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding='0'
			cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border='0' cellspacing=1 cellpadding=2
			width='600'>

			<TR bgcolor='ffffff'>
				<TD><font color='323232' size=2><center>
							<b>번호</b>
						</center></font></TD>
				<TD><font color='323232' size=2><center>
							<b>글 제목</b>
						</center></font></TD>
				<TD><font color='323232' size=2><center>
							<b>E-mail</b>
						</center></font></TD>
				<TD><font color='323232' size=2><center>
							<b>작성일</b>
						</center></font></TD>
				<TD><font color='323232' size=2><center>
							<b>조회</b>
						</center></font></TD>
			</TR>

			<%
			if (lastRow > 0) {
				strSQL = "select * from zzz order by no desc";//"select * from zzz where no between " + startRow + " and " + endRow;
				rs = stmt.executeQuery(strSQL);

			
					while(rs.next()) {

				int listno = rs.getInt("no");
				String email = rs.getString("email");
				String title = rs.getString("title");
				String date = rs.getString("date");
				int count = rs.getInt("count");
			%>

			<%!
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
	}
	%>

			<TR bgcolor='ededed'>
				<TD align=center><font size=2 color='black'><%=listno%></font></TD>
				<TD align=left><a href="write_output1.jsp?no=<%=listno%>"><font
						size=2 color="black"><%=title%></font></a></TD>
				<TD align=center><a href="write_output1.jsp?no=<%=listno%>"><font
						size=2 color="black"><%=maskEmail(email)%></font></TD>
				<TD align=center><a href="write_output1.jsp?no=<%=listno%>"><font
						size=2><%=date%></font></TD>
				<TD align=center><font size=2><%=count%></font></TD>
			</TR>

			<%
			}
			}
			%>
		</TABLE>
		<%
		rs.close();
		stmt.close();
		conn.close();
			
		/*
		if (lastRow > 0) {
		int setPage = 1;
		int lastPage = 0;
		if (lastPage % listSize == 0)
			lastPage = lastRow / listSize;
		else
			lastPage = lastRow / listSize + 1;

		if (currentPage > 1) {
			*/
		%>
		<%--<a href="listboard1.jsp?pageno=<%=currentPage - 1%>">[이전]</a>
		<%
		}
		while (setPage <= lastPage) {
		%>
		<a href="listboard1.jsp?pageno=<%=setPage%>">[<%=setPage%>]
		</a>
		<%
		setPage = setPage + 1;
		}
		if (lastPage > currentPage) {
		%>
		<a href="listboard1.jsp?pageno=<%=currentPage + 1%>">[다음]</a>
		
		<%
		}
		}
		%>--%>
		<TABLE bgcolor='ffffff' border='0' width='600' cellpadding='0'
			cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
		<TABLE bgcolor='ffffff' border=0 width=600 cellpadding=5 cellspacing=0>
			<tr>
				<td align=left></td>
				<TD align='right'><input type='button'
					onclick="location.href='write1.jsp'" value='글쓰기'></TD>
			</TR>
		</TABLE>

	</center>
</body>
</html>


