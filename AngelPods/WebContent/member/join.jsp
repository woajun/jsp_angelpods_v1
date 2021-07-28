<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src="../find/find.js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="../find/find.js/find.address.js"></script>
<script type = "text/JavaScript" src = "members.js"></script>

</head>
<body>
	<form action = "join.do" method = "post" name = "reg_frm">
		아이디 : <input type = "text" name = "id" size = "20"><br/>
		비밀번호 : <input type = "password" name = "pw" size ="20"><br/>
		비밀번호 확인 : <input type = "password" name = "pw_check" size = "20"><br/>
		닉네임 : <input type = "text" name = "name" size ="20"><br/>
		메일 : <input tpye = "text" name = "eMail" size = "20"><br/>
		주소 :	<select name="sido" class ="form-select"></select>
           	 	<select name="gugun" class ="form-select mt-1"></select><br/>
		연락처 : <input type = "text" name = "phone" size = "20"><br/>
		<input type = "button" value = "회원가입" onclick = "infoConfirm()">
		&nbsp;&nbsp;&nbsp;
		<a href = "login.jsp">취소</a>
	</form>
</body>
</html>