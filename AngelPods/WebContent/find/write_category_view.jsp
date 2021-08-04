<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width = "500" cellpadding = "0" cellspacing = "0" border ="1">
		<form action = "f_write_category_action.do" method = "post">
			<tr>
				<td colspan="2">
					어떤 물건을 습득하셨습니까?
				</td>
			</tr>
			<tr>
				<td colspan="2">
			        <select id="cNum" name = "cNum">
			          <option value="0">분류 선택</option>
			          <option value="1">무선이어폰</option>
			          <option value="2">지갑</option>
			          <option value="3">카드</option>
			          <option value="4">애완동물</option>
			        </select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
			        <select id="cdNum" name = "cdNum">
			          <option value="0">분류 상세</option>
			          <option value="1">애플-에어팟1,2세대</option>
			          <option value="2">애플-에어팟 프로</option>
			          <option value="3">삼성-버즈</option>
			        </select>
				</td>
			</tr>
			<tr>
				<td>일련번호</td>
				<td><input type = "text" name = "sn" size = "50"><br/>
   				<a href = "">일련번호 확인 방법</a>
				</td>
			</tr>
			<tr>
				<td colspan = "5"><input type = "submit" value="확인">
				&nbsp;&nbsp;
				<a href = "../board/list_view.jsp">취소</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>