<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src = "members.js"></script>
</head>
<body>
	<form action = "member_modify.do" method = "post" name = "reg_frm">
		아이디 : ${mdto.id}<br/>
		비밀번호 : <input type = "password" name = "pw" size = "20"><br/>
		비밀번호 확인 : <input type = "password" name = "pw_check" size = "20"><br/>
		이름 : ${mdto.name}<br/>
		메일 : <input type = "text" name = "eMail" size = "20" value = "${mdto.eMail}"><br/>
		주소 : <input type = "text" name = "address" size = "50" value = "${mdto.address}"><br/>
		<input type = "button" value = "수정" onclick="updateInfoConfirm()">
		&nbsp;&nbsp;&nbsp;
		<input type = "reset" value = "취소" onclick = "javascript:window.location ='login.jsp'">
	</form>
</body>
</html>