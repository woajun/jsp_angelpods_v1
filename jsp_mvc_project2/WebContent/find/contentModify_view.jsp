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
		<form action = "f_modify.do" method = "post">
			
			<tr><td>번호</td><td>${content_view.num}</td></tr>
			<tr><td>이미지</td><td>${content_view.image}</td></tr>
			<tr><td>모델</td><td>${content_view.model}</td></tr>		
			<tr><td>등록일</td><td>${content_view.rdate}</td></tr>		
			<tr><td>지역</td><td>${content_view.area}</td></tr>		
			<tr>
				<td>제목</td>
				<td>
					<textarea name = "title" >
						${content_view.title}
					</textarea>
				</td>
			</tr>		
			<tr>
				<td>내용</td>
				<td>
					<textarea name = "contents" rows ="5">
						${content_view.contents}
					</textarea>
				</td>
			</tr>		
			<tr><td>찾았는지 여부</td><td>${content_view.findornot}</td></tr>		
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				&nbsp;&nbsp;
				<a href = "f_list.do">취소</a>
			</tr>
		</form>
	</table>
</body>
</html>