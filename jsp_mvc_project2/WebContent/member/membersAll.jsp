<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일</td>
			<td>주소</td>
		</tr>	

		<c:forEach items = "${mList}" var="dto">
		<tr>
			<td>${dto.id}</td>
			<td>${dto.pw}</td>
			<td>${dto.name}</td>
			<td>${dto.eMail}</td>
			<td>${dto.rDate}</td>
			<td>${dto.address}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "6"><a href="main.jsp">돌아가기</a></td>
		</tr>
	</table>
	
</body>
</html>