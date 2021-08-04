<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <script type = "text/javascript" src="find.js/content_view.js"></script> -->
fbDto:${fbDto}<br/>
directory:${directory}<br/>
param.directory:${param.directory}<br/>
requestScope.directory:${requestScope.directory}<br/>
request.directory:${request.directory}<br/>
pageScope.directory:${pageScope.directory}<br/>


	<form action = "f_delete.do" method = "post">
		<table width="500" cellpadding="0" cellspacing ="0" border="1">
		
			못바꿈<tr><td>fb_num</td><td><div class = "fbNum" >${fbDto.fbNum}</div></td></tr>
			못바꿈<tr><td>userId</td><td><div class = "userId" >${fbDto.userId}</div></td></tr>
			못바꿈<tr><td>timestamp</td><td><div class = "timestamp" >${fbDto.timestamp}</div></td></tr>
			<tr><td>c_num</td><td>
				<select class = "cNum" value="${fbDto.cNum}">
		          <option value="0">${fbDto.cNum}</option>
				</select></td></tr>
			<tr><td>cd_num</td><td>
				<select class = "cdNum" value="${fbDto.cdNum}">
		          <option value="0">${fbDto.cdNum}</option>
				</select></td></tr>
			<tr><td>sn</td><td><input class = "sn" value="${fbDto.sn}"></td></tr>
			
			<tr><td>thumbnailImage</td><td><div class = "thumbnailImage" >
			<img src = "${directory}${fbDto.thumbnailImage}" width=73px height=70px></div></td></tr>
			
			<tr><td colspan="2">
				<table width="500" cellpadding="0" cellspacing ="0" border="1">
					<tr><td>addr</td><td><div class = "addr" >${fbDto.addr}</div></td></tr>
					<tr><td>addrDetail</td><td><input class = "addrDetail" value="${fbDto.addrDetail}"></td></tr>
					<tr><td>lat</td><td><input type="hidden" class = "lat" value="${fbDto.lat}"></td></tr>
					<tr><td>lon</td><td><input type="hidden" class = "lon" value="${fbDto.lon}"></td></tr>
				</table>
			</td></tr>
			제목<tr><td>title</td><td><input class = "title" value="${fbDto.title}"></input></td></tr>
			내용<tr><td>contents</td><td><input class = "contents" value="${fbDto.contents}"></input></td></tr>
			못바꿈<tr><td>hit</td><td><div class = "hit" >${fbDto.hit}</div></td></tr>
			못바꿈<tr><td>chat_hit</td><td><div class = "chatHit" >${fbDto.chatHit}</div></td></tr>
			못바꿈<tr><td>f_state</td><td><div class = "fState" >${fbDto.fState}</div></td></tr>
			
			<tr><td colspan="2">
				<input type = "submit" value ="수정" onclick="deleteFb()">
				<a href = "f_list.do">취소</a>
			</td></tr>
		</table>
	</form>
</body>
</html>