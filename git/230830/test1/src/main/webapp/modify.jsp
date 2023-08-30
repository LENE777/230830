<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="oracle.jdbc.driver.OracleDriver"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<head>
<title>게시판 수정</title>

<SCRIPT language="JavaScript">
	function Check() {
		if (Modify.pw.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			Modify.pw.focus();
			return false;
		}
		if (Modify.email.value.length < 1) {
			alert("이메일을 입력하세요.");
			Modify.email.focus();
			return false;
		}
		//이메일 형식 검사 (알파벳 대, 소문자+숫자+특수기호)@(알파벳 대, 소문자+숫자+특수기호) . (알파벳 대, 소문자)
		var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		var emailValue = Modify.email.value;
		if (!emailValue.match(emailRegex)) {
			alert("올바른 이메일 형식이 아닙니다.");
			Modify.email.focus();
			return false;
		}
		if (Modify.title.value.length < 1) {
			alert("글제목을 입력하세요.");
			Modify.title.focus();
			return false;
		}
		if (Modify.contents.value.length < 1) {
			alert("글내용을 입력하세요.");
			Modify.content.focus();
			return false;
		}
		Modify.submit();
	}

	function list() {
		location.href = "listboard1.jsp";
	}
</SCRIPT>
</head>

<body>

	<%
	String no = request.getParameter("no");

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521/xe";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "system", "0000");

		String strSQL = "select * from zzz where no = ?";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setInt(1, Integer.parseInt(no));

		rs = pstmt.executeQuery();
		rs.next();

		String pw = rs.getString("pw");
		String title = rs.getString("title");
		String content = rs.getString("content").trim();
	%>

	<center>

		<table border=0 width=600 cellpadding=0 cellspacing=0>
			<tr>
				<td align=center bgcolor='ffffff'><font color='323232' size='3'><b>게시판
							글쓰기</b></font></td>
			</tr>
		</table>
		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD bgcolor='ffffff'><hr size='1' noshade></TD>
			</TR>
		</TABLE>

		<form Name='Modify' Action='modify_output.jsp' Method='POST'
			OnSubmit='return Check()'>
			<input type='hidden' name='no' value='<%=no%>'>

			<TABLE border='2' width='600' cellpadding='5' cellspacing='0'>
				<TR>
					<TD width='100' bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>비밀번호</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'>
						<p>
							<input type='password' size='12' name='pw'><font
								color='323232' size='2'>&nbsp;* 필수 </font>
						</p>
					</TD>
				</TR>
				<TR>
					<TD width='100' bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>E-mail</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'>
						<p>
							<input type='text' size='25' name='email'><font
								color='323232' size='2'></font>
						</p>
					</TD>
				</TR>
				<TR>
					<TD width='100' bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>글 제목</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'>
						<p>
							<font size='2'> <input type='text' size='50'
								maxlength='50' name='title' value="<%=title%>"></font>
					</TD>
					</p>
				</TR>

				<TR>
					<TD bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>글 내용</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'><font size='2'> <textarea
								cols='60' rows='15' wrap='virtual' name='content'><%=content%></textarea>
					</font></TD>
				</TR>
			</table>
			<table border='0' width='600' cellpadding='0' cellspacing='0'>
				<TR>
					<TD bgcolor='ffffff' colspan='2'>
						<hr size='1' noshade>
					</TD>
				</TR>
				<tr>
					<td align='center' colspan='2' width='100%'>
						<table>
							<tr>
								<td width='200' align='center'><input type='Reset'
									value='다시 작성'></td>
								<td width='200' align='center'><input type='Submit'
									value='수정완료' onclick='Check();'></td>
								<td width='200' align='center'><input type='Button'
									value='목록' name='Page' onClick='location.href = "listboard1.jsp"'></td>
							</tr>
						</table>
					</td>
				</tr>

			</table>

			<%
			} catch (SQLException e) {
			e.printStackTrace();
			} catch (Exception ex) {
			ex.printStackTrace();
			} finally {
				rs.close();
				pstmt.close();
				conn.close();
			}
			%>
		
</body>
</html>