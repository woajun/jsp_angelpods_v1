<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과 : 성공</title>
</head>
<body>
	"조회하신 기기의 주인을 찾았습니다."
	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<tr>
			<td>기기상태</td>
			<td>${device.dState}</td>
		<tr>
			<td>기종</td>
			<td>${device.dModel}</td>
		</tr>	
		<tr>
			<td>주인id</td>
			<td>${owner.id}</td>
		</tr>	
		<tr>
			<td>닉네임</td>
			<td>${owner.name}</td>
		</tr>	
		<tr>
			<td>메일주소</td>
			<td>${owner.eMail}</td>
		</tr>	
		<tr>
			<td>지역</td>
			<td>${owner.address}</td>
		</tr>
		<tr>
			<td>남기신 말씀</td>
			<td>없음</td>
		</tr>
			<td colspan = "9"><a href="f_search_did_view.do">쪽지보내기</a></td>
	</table>

</body>
</html>