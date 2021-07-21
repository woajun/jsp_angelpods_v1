<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing ="0" border="1">
		<form action = "modify.do" method = "post">
			
			<tr><td>번호</td><td>${content_view.num}</td></tr>		
			<tr><td>이미지</td><td>${content_view.image}</td></tr>		
			<tr><td>모델</td><td>${content_view.model}</td></tr>		
			<tr><td>등록일</td><td>${content_view.rdate}</td></tr>		
			<tr><td>지역</td><td>${content_view.area}</td></tr>		
			<tr><td>제목</td><td>${content_view.title}</td></tr>		
			<tr><td>내용</td><td>${content_view.contents}</td></tr>		
			<tr><td>찾았는지 여부</td><td>${content_view.findornot}</td></tr>		
			<tr><td>댓글</td>
				<td>
					<table width = "400" callpadding = "0" cellspacing = "0" border = "1">
						<tr>
							<td>아이디</td>
							<td>여기에 입력하세요</td>
						</tr>
						<tr><td>홍당무</td><td>아 이거 제꺼 같은데 ㅜㅜ</td></tr>
						<tr><td>토르</td><td>뮬니르!</td></tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				&nbsp;&nbsp;
				<a href = "f_list.do">목록보기</a>
			</tr>
		</form>
	</table>
</body>
</html>