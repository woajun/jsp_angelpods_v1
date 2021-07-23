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

			<td>번호</td>
			<td>이미지</td>
			<td>모델</td>
			<td>등록일</td>
			<td>지역</td>
			<td>제목</td>
			<td>내용</td>
			<td>찾았는지여부</td>
		</tr>	

		<c:forEach items = "${list}" var="dto">
		<tr>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.num}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.image}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.model}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.rdate}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.area}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.title}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.contents}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.findornot}</a></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "9"><a href="f_search_view.do">주인 찾아주기</a></td>
		</tr>
	</table>
	
</body>
</html>