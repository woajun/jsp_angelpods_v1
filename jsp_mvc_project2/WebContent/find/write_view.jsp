<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src="find.js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="find.js/find.address.js"></script>

</head>
<body>
	<table width = "500" cellpadding = "0" cellspacing = "0" border ="1">
		<form action = "f_write.do" method = "post">
			<tr>
				<td>사진</td>
				<td><input type = "file" name = "image" size= "50"></td>
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
				<td>
					${dId}
					<input type = "hidden" name = "deviceId" value = "${dId}">
				</td>
			</tr>
			<tr>
				<td>습득장소</td>
				<td>
					습득장소를 지도에서 선택해주세요.<br/>
					<input type = "button" value = "주소검색" onclick = "javascript:window.location='selectAddress_view.jsp'">
					
                  <select name="sido" class ="form-select"></select>
                  <select name="gugun" class ="form-select mt-1"></select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><textarea name = "title" ></textarea></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name = "contents" rows = "5"></textarea></td>
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