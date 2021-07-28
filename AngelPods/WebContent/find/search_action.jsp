<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int ri= Integer.parseInt(request.getAttribute("ri").toString()); 
	if(ri == 1) {
%>

   	<jsp:forward page = "searchResult_view.jsp"/>
	
<% } else if(ri == -1){ %>

   	<jsp:forward page = "selectAddress_view.jsp"/>
   	
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>