<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src="find.js/write_view.js"></script>

</head>
<body>
	<table width = "500" cellpadding = "0" cellspacing = "0" border ="1">
		<form action = "f_write_action.do" method = "post" enctype = "multipart/form-data">
			<tr>
				<td>습득장소</td>
				<td>
					위도: ${param.latitude}<br/>
					경도:${param.longitude}<br/>
					${param.addr}<br/>
					${param.addrDetail}<br/>
					<input type = "hidden" name = "latitude" value = "${param.latitude}">
					<input type = "hidden" name = "longitude" value = "${param.longitude}">
					<input type = "hidden" name = "addr" value = "${param.addr}">
					<input type = "hidden" name = "addrDetail" value = "${param.addrDetail}">
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					대분류:${param.cNum}<br/>
					소분류:${param.cdNum}<br/>
					${param.sn}<br/>
					<input type = "hidden" name = "cNum" value = "${param.cNum}">
					<input type = "hidden" name = "cdNum" value = "${param.cdNum}">
					<input type = "hidden" name = "sn" value = "${param.sn}">
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name = "image" id="image" accept="image/*" onchange="image_preview(event)"/> 
				<div id="image_container"></div></td>
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