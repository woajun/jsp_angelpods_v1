<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type = "text/javascript" src="find.js/content_view.js"></script>

	<form action = "f_delete.do" method = "post" name="del_frm">
		<input type = "hidden" name="fbNum" value="${fbDto.fbNum }">


		<table width="500" cellpadding="0" cellspacing ="0" border="1">
		
			<tr><td>fb_num</td><td><div class = "fbNum" >${fbDto.fbNum}</div></td></tr>
			<tr><td>userId</td><td><div class = "userId" >${fbDto.userId}</div></td></tr>
			<tr><td>c_num</td><td><div class = "cNum" >${fbDto.cNum}</div></td></tr>
			<tr><td>cd_num</td><td><div class = "cdNum" >${fbDto.cdNum}</div></td></tr>
			
			<tr><td>thumbnailImage</td><td><div class = "thumbnailImage" >
			<img src = "${directory}${fbDto.thumbnailImage}" width=73px height=70px></div></td></tr>
			
			<tr><td>timestamp</td><td><div class = "timestamp" >${fbDto.timestamp}</div></td></tr>
			<tr><td>addr</td><td><div class = "addr" >${fbDto.addr}</div></td></tr>
			<tr><td>addrDetail</td><td><div class = "addrDetail" >${fbDto.addrDetail}</div></td></tr>
			<tr><td>title</td><td><div class = "title" >${fbDto.title}</div></td></tr>
			<tr><td>contents</td><td><div class = "contents" >${fbDto.contents}</div></td></tr>
			<tr><td>sn</td><td><div class = "sn" >${fbDto.sn}</div></td></tr>
			<tr><td>lat</td><td><input type="hidden" class = "lat" value="${fbDto.lat}"></input></td></tr>
			<tr><td>lon</td><td><input type="hidden" class = "lon" value="${fbDto.lon}"></input></td></tr>
			<tr><td>hit</td><td><div class = "hit" >${fbDto.hit}</div></td></tr>
			<tr><td>chat_hit</td><td><div class = "chatHit" >${fbDto.chatHit}</div></td></tr>
			<tr><td>f_state</td><td><div class = "fState" >${fbDto.fState}</div></td></tr>
			
			<tr><td colspan="2">
				<input type = "submit" value ="삭제" onclick="deleteFb()">
				<a href = "f_modify_view.do?fbNum=${fbDto.fbNum}">수정</a>
				<a href = "f_list.do">목록보기</a>
				<a href = "">채팅으로 대화하기</a>
			</td></tr>
		</table>
	</form>
</body>
</html>