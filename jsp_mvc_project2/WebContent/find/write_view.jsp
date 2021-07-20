<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${name}님 안녕하세요.</h1>
	<table width = "500" cellpadding = "0" cellspacing = "0" border ="1">
		<form action = "f_write.do" method = "post">
			<tr>
				<td>사진</td>
				<td><input type = "image" name = "bName" size= "50"></td>
			</tr>
			<tr>
				<td>모델</td>
				<td>
			        <select id="myselection" class="form-control" name = "model">
			          <option value="choose">모델 선택</option>
			          <option value="Pro">에어팟 프로</optzion>
			          <option value="Airpods">에어팟</option>
			          <option value="Buds">삼성 버즈</option>
			          <option value="Others">기타</option>
			        </select>
				</td>
			</tr>
			<tr>
				<td>일련번호</td>
				<td>${dId}</td>
			</tr>
			<tr>
				<td>지역</td>
				<td><textarea name = "area" rows = "10"></textarea></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><textarea name = "title" rows = "10"></textarea></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name = "contents" rows = "10"></textarea></td>
			</tr>
			<tr>
				<td colspan = "5"><input type = "submit" value="입력">
				&nbsp;&nbsp;
				<a href = "f_list.do">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>