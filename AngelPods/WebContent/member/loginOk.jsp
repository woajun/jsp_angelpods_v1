<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int ri= Integer.parseInt(request.getAttribute("ri").toString());
	
	if(ri == 1) {
%>
	<script language = "javascript">
		alert("환영합니다!");
		document.location.href="main.jsp";
	</script>
	
<% } else if(ri == 2){ %>

	<script language = "javascript">
		alert("아이디가 없습니다.");
		history.go(-1);
	</script>
	
<% } else if(ri == 3){ %>

	<script language = "javascript">
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>
	
<% } else if(ri == 4){ %>

	<script language = "javascript">
		alert("존재하지 않는 회원입니다.");
		history.go(-1);
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