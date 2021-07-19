<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	int ri= Integer.parseInt(request.getAttribute("ri").toString()); 
	if(ri == 1) {
%>
	<script language = "javascript">
		alert("주인을 찾았습니다! 주인은 ${owner.id}입니다!");
		history.back();
	</script>
	
<% } else if(ri == 0){ %>

   	<script language = "javascript">
   		alert("해당 일련번호(${dId})로 등록된 기기가 없습니다. 게시글 등록 부탁드립니다.");
   		document.location.href="write_view.jsp";
   	</script>
    	
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