<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${name}님 안녕하세요.</h1>
	<table width = "500" cellpadding = "0" cellspacing = "0" border ="1">
		<form action = "f_write_view.do" method = "post">
			<tr>
				일련번호로 찾기
			</tr>
			<tr>
				<td>일련번호</td>
				<td><input type = "text" name = "dId" size = "50"></td>
			</tr>
			<tr>
				<td colspan = "5"><input type = "submit" value="조회">
				&nbsp;&nbsp;
				<a href = "">일련번호 확인 방법</a>
				&nbsp;&nbsp;
				<a href = "">취소</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>