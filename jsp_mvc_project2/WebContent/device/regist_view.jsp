<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action = "regist.do" method = "post">
       	<label>모델명</label>
        <select id="myselection" class="form-control" name = "model">
          <option value="choose">모델 선택</option>
          <option value="Pro">에어팟 프로</optzion>
          <option value="Airpods">에어팟</option>
          <option value="Buds">삼성 버즈</option>
          <option value="Others">기타</option>
        </select>
		<br/>
		본체 일련번호 : <input type = "text" name = "case" size ="20"><br/>
		왼쪽 일련번호 : <input type = "text" name = "left" size = "20"><br/>
		오른쪽 일련번호 : <input type = "text" name = "right" size ="20"><br/>
		<input type = "submit" value = "등록" >
		&nbsp;&nbsp;&nbsp;
		<a href = "login.jsp">취소</a>
	</form>
	
</body>
</html>