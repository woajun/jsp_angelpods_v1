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

    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>

<script type = "text/javascript" src="find.js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript" src="find.js/find.address.js"></script>

</head>
<body>
	<table width ="500" cellpadding = "0" cellspacing = "0" border = "1">
		<form action = "f_search_list.do" method = "post">
		<tr>
        	<td>조회유형</td>
        	<td>
                  <input type="radio" class="btn-check" name="options" id="option2" autocomplete="off" checked>
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
			<td>fb_num</td>
			<td>userId</td>
			<td>c_num</td>
			<td>cd_num</td>
			<td>thumbnailImage</td>
			<td>timestamp</td>
			<td>addr</td>
			<td>addrDetail</td>
			<td>title</td>
			<td>contents</td>
			<td>sn</td>
			<td>lat</td>
			<td>lon</td>
			<td>hit</td>
			<td>chat_hit</td>
			<td>f_state</td>
		</tr>	

		<c:forEach items = "${list}" var="dto">
		<tr>
			<td><a class = "fbNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.fbNum}</a></td>
			<td><a class = "userId" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.userId}</a></td>
			<td><a class = "cNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.cNum}</a></td>
			<td><a class = "cdNum" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.cdNum}</a></td>
			
			<td><a class = "thumbnailImage" href = "f_content_view.do?fbNum=${dto.fbNum}">
 			<img src = "${directory}${dto.thumbnailImage}" width=73px height=70px></a></td>
			<%-- <img src = "${pageContext.request.contextPath}/IMAGES/${dto.thumbnailImage}" width=73px height=70px></a></td> --%>

			<td><a class = "timestamp" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.timestamp}</a></td>
			<td><a class = "addr" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.addr}</a></td>
			<td><a class = "addrDetail" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.addrDetail}</a></td>
			<td><a class = "title" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.title}</a></td>
			<td><a class = "contents" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.contents}</a></td>
			<td><a class = "sn" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.sn}</a></td>
			<td><input type="hidden" class = "lat" value="${dto.lat}"></input></td>
			<td><input type="hidden" class = "lon" value="${dto.lon}"></input></td>
			<td><a class = "hit" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.hit}</a></td>
			<td><a class = "chatHit" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.chatHit}</a></td>
			<td><a class = "fState" href = "f_content_view.do?fbNum=${dto.fbNum}">${dto.fState}</a></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan = "16">
			<input type = "button" value = "습득물 등록" onclick = "javascript:window.location='../find/write_category_view.jsp'">
			<input type = "button" value = "메인화면" onclick = "javascript:window.location='../member/main.jsp'">
			</td>
		</tr>
	</table>
	
	<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da"></script>
<script type="text/javascript" src="board.js/list_view.js"></script>

</body>
</html>