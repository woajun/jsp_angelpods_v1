<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src="../find/find.js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="../find/find.js/find.address.js"></script>
<script language = "JavaScript" src = "members.js"></script>
</head>
<body>
	<form action = "member_modify.do" method = "post" name = "reg_frm">
		아이디 : ${mdto.id}<br/>
		비밀번호 : <input type = "password" name = "pw" size = "20"><br/>
		비밀번호 확인 : <input type = "password" name = "pw_check" size = "20"><br/>
		닉네임 : <input type = "text" name = "name" size = "20" value = "${mdto.name}"><br/>
		메일 : <input type = "text" name = "eMail" size = "20" value = "${mdto.eMail}"><br/>
		주소 : 
		<input type = "text" name = "sido" value = "${mdto.sido}" > 
		<input type = "text" name = "gugun" value = "${mdto.gugun}" ><br/> 
        <select name="sido2" class ="form-select"></select>
        <select name="gugun2" class ="form-select mt-1"></select>
		<input type = "button" value = "주소변경" onclick = "updateAddress()"><br/>
		연락처 : <input type = "text" name = "phone" size = "20" value = "${mdto.phone}"><br/>
		<input type = "button" value = "수정" onclick="updateInfoConfirm()">
		&nbsp;&nbsp;&nbsp;
		<input type = "reset" value = "취소" onclick = "javascript:window.location ='login.jsp'">
	</form>
</body>
</html>