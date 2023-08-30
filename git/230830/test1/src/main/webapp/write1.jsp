<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>게시판 글쓰기</TITLE>

<SCRIPT language="JavaScript">
	function Check() {
		if (write1.pw.value.length < 1) {
			alert("비밀번호를 입력하세요.");
			write1.pw.focus();
			return false;
		}
		if (write1.email.value.length < 1) {
			alert("이메일을 입력하세요.");
			write1.email.focus();
			return false;
		}
		//이메일 형식 검사 (알파벳 대, 소문자+숫자+특수기호)@(알파벳 대, 소문자+숫자+특수기호) . (알파벳 대, 소문자)
		var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		var emailValue = write1.email.value;
		if (!emailValue.match(emailRegex)) {
			alert("올바른 이메일 형식이 아닙니다.");
			write1.email.focus();
			return false;
		}
		if (write1.title.value.length < 1) {
			alert("글제목을 입력하세요.");
			write1.title.focus();
			return false;
		}
		if (write1.contents.value.length < 1) {
			alert("글내용을 입력하세요.");
			write1.content.focus();
			return false;
		}
		write1.submit();
	}
</SCRIPT>
</HEAD>
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
<BODY>

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

		<FORM Name='write1' Action='write_input1.jsp' Method='POST'
			OnSubmit='return Check();'>

			<TABLE border='2' width='600' cellpadding='5' cellspacing='0'>
				<TR>
					<TD width='100' bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>비밀번호</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'>
						<p>
							<input type='password' size='12' name='pw'><font
								color='323232' size='2'>&nbsp;* 필수 (게시물 수정 삭제시 필요합니다.)</font>
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
								color='323232' size='2'></font> </select>
					</TD>
				</TR>
				<TR>
					<TD width='100' bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>글 제목</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'>
						<p>
							<font size='2'> <input type='text' size='50'
								maxlength='50' name='title'></font>
					</TD>
					</p>
				</TR>

				<TR>
					<TD bgcolor='ffffff'><font color='323232' size='2'><center>
								<b>글 내용</b>
							</center></font></TD>
					<TD width='500' bgcolor='ffffff'><font size='2'> <textarea
								cols='60' rows='15' wrap='virtual' name='content'></textarea>
					</font></TD>
				</TR>
			</table>
			<table border='0' width='600' cellpadding='0' cellspacing='0'>
				<TR>
					<TD bgcolor='ffffff' colspan='2'>
						<hr size='1' noshade>
					</TD>
				</TR>
			</table>

			<TABLE>
				<TR>
					<TD width='200' align='center'><input Type='Submit' Value='등록'
						onclick='Check();'> <input type='button' value='뒤로가기'
						onclick="history.back()"></TD>
				</TR>
			</TABLE>
		</FORM>
</BODY>
</HTML>

