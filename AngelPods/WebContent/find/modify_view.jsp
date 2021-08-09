<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src="find.js/modify_view.js"></script>
</head>
<body>


	<form action = "f_modify.do" method = "post" enctype = "multipart/form-data">
		<table width="500" cellpadding="0" cellspacing ="0" border="1">
		
			<tr><td>fb_num</td><td>${fbDto.fbNum}</div></td></tr>
			<input type = "hidden" name = "fbNum" value = "${fbDto.fbNum}">
			<tr><td>userId</td><td>${fbDto.userId}</div></td></tr>
			<tr><td>timestamp</td><td>${fbDto.timestamp}</div></td></tr>
			<tr><td>c_num</td><td>
				<select name = "cNum" value="${fbDto.cNum}">
		          <option value="0">${fbDto.cNum}</option>
				</select></td></tr>
			<tr><td>cd_num</td><td>
				<select name = "cdNum" value="${fbDto.cdNum}">
		          <option value="0">${fbDto.cdNum}</option>
				</select></td></tr>
			<tr><td>sn</td><td><input name = "sn" value="${fbDto.sn}"></td></tr>
			
			<tr><td>thumbnailImage</td><td><div>
			<img src = "${directory}${fbDto.thumbnailImage}" width=73px height=70px><br/>
			<input type="file" name = "image" id="image" accept="image/*" onchange="image_preview(event)"/>
			</div></td></tr>
			
			<tr><td colspan="2">
				<table width="500" cellpadding="0" cellspacing ="0" border="1">
					<tr><td>addr</td><td><input name = "addr" value="${fbDto.addr}"></input></td></tr>
					<tr><td>addrDetail</td><td><input name = "addrDetail" value="${fbDto.addrDetail}"></td></tr>
					<tr><td>lat</td><td><input type="hidden" name = "lat" value="${fbDto.lat}"></td></tr>
					<tr><td>lon</td><td><input type="hidden" name = "lon" value="${fbDto.lon}"></td></tr>
				</table>
			</td></tr>
			<tr><td>title</td><td><input name = "title" value="${fbDto.title}"></input></td></tr>
			<tr><td>contents</td><td><input name = "contents" value="${fbDto.contents}"></input></td></tr>
			
			<tr><td>hit</td><td>${fbDto.hit}</td></tr>
			<tr><td>chat_hit</td><td>${fbDto.chatHit}</td></tr>
			<tr><td>f_state</td><td>${fbDto.fState}</td></tr>
			
			<tr><td colspan="2">
				<input type = "submit" value ="수정" onclick="info_confirm()">
				<a href = "f_list.do">취소</a>
			</td></tr>
		</table>
	</form>
</body>
</html>