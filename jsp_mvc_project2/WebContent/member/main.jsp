<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("ValidMem") == null){
%>
	<<jsp:forward page = "login.jsp"/>
<%
	}

	String name = (String)session.getAttribute("name");
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1><%= name %>님 안녕하세요.</h1>
	<form action = "logout.jsp" method = "post">
		<input type = "submit" value = "로그아웃">&nbsp;&nbsp;&nbsp;
		<input type = "button" value = "정보수정" onclick = "javascript:window.location='modify.jsp'">
		<input type = "button" value = "정보보기" onclick = "javascript:window.location='membersAll.jsp'">
	</form>
	
</body>
</html>