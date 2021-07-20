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
	<h1>${name}님 안녕하세요.</h1>
	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>모델</td>
			<td>등록일</td>
			<td>지역</td>
			<td>제목</td>
			<td>내용</td>
			<td>댓글 수</td>
			<td>찾았는지여부</td>
		</tr>	

		<c:forEach items = "${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<td>${dto.image}</td>
			<td>${dto.model}</td>
			<td>${dto.rdate}</td>
			<td>${dto.area}</td>
			<td>${dto.title}</td>
			<td>${dto.contents}</td>
			<td>${dto.comments}</td>
			<td>${dto.findornot}</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "9"><a href="search_dId.jsp">주인 찾아주기</a></td>
		</tr>
	</table>

	
	
</body>
</html>