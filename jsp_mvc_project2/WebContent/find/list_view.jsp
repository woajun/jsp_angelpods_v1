<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<% 
System.out.println(request.getAttribute("f_list"));
if(request.getAttribute("f_list") == null){ %>
	<jsp:forward page = "f_list.do"/>
<% } %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type = "text/javascript" src="find.js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="find.js/find.address.js"></script>

</head>
<body>
	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<form action = "f_search_list.do" method = "post">
		<tr>
        	<td>조회유형</td>
        	<td>
                  <input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
                  <label class="btn btn-outline-secondary" for="option1">전체</label>
                  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option2">습득물</label>
                  <input type="radio" class="btn-check" name="options" id="option3" autocomplete="off">
                  <label class="btn btn-outline-secondary" for="option3">분실물</label>
			</td>
		</tr>
		<tr>
			<td>모델</td>
			<td>
                <input type="checkbox" class="btn-check" name="model" id="mod1" autocomplete="off" checked>
                <label class="btn btn-outline-secondary" for="mod1">전체</label>
                <input type="checkbox" class="btn-check" name="model" id="mod2" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod2">에어팟</label>
                <input type="checkbox" class="btn-check" name="model" id="mod3" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod3">에어팟 프로</label>
                <input type="checkbox" class="btn-check" name="model" id="mod4" autocomplete="off">
                <label class="btn btn-outline-secondary" for="mod4">갤럭시 버즈</label>
			</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>
                  <select name="sido" id="sido" class ="form-select"></select>
                  <select name="gugun" id="gugun" class ="form-select mt-1"></select>
            </td>
		</tr>
		<tr>
			<td>키워드 검색</td>
			<td>
                  <input type="text" name = "keyword" class="form-control" placeholder="입력" aria-label="Input group example" aria-describedby="basic-addon1">
			</td>
		</tr>
		<tr>
			<td colspan ="2" >
				<input type = "submit" value = "검색" >
			</td>
		</tr>
	</form>
	</table>
	<br/>
	
	<table width ="1000" cellpadding = "0" cellspacing = "0" border = "1">
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>등록일</td>
			<td>글쓴사람</td>
			<td>일련번호</td>
			<td>모델</td>
			<td>지역</td>
			<td>제목</td>
			<td>내용</td>
			<td>찾았는지여부</td>
		</tr>	

		<c:forEach items = "${list}" var="dto">
		<tr>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.num}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.image}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.rdate}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.writerId}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.deviceId}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.model}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.area}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.title}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.contents}</a></td>
			<td><a href = "f_content_view.do?Num=${dto.num}">${dto.findornot}</a></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "10">
			<input type = "button" value = "습득물 등록" onclick = "javascript:window.location='f_search_view.do'">
			<input type = "button" value = "메인화면" onclick = "javascript:window.location='../member/main.jsp'">
			</td>
		</tr>
	</table>
	
</body>
</html>