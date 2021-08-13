<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
<script type = "text/javascript" src="member.js/join.js"></script>

</head>
<body>
	<form action = "join.do" method = "post" name = "reg_frm">
		아이디 : <input type = "text" name = "userId" size = "20"><br/>
		비밀번호 : <input type = "password" name = "pw" size ="20"><br/>
		비밀번호 확인 : <input type = "password" name = "pw_check" size = "20"><br/>
		닉네임 : <input type = "text" name = "name" size ="20"><br/>
		메일 : <input type = "text" name = "eMail" size = "20"><br/>
		<input type="checkbox" name="" />위치정보제공동의<br/>
		동네 : <input type = "text" id ="addr" name = "addr" />
		<input type = "button" value="동네확인" onclick="addrbtn()"><br/>
		위도<input type = "text" id ="lat" name = "lat" /><br/>
		경도<input type = "text" id ="lon" name = "lon" /><br/>
			
		<input type = "button" value = "회원가입" onclick = "infoConfirm()">
		&nbsp;&nbsp;&nbsp;
		<a href = "login.jsp">취소</a>
	</form>
</body>
</html> --%>