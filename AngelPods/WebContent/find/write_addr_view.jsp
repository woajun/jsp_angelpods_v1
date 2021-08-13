<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
    <style>
    .map_wrap {position:relative;width:50%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	</style>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div class="hAddr">
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    </div>
</div>
<form action = "write_view.jsp" method = "post">
	습득하신 장소를 알려주세요<br/>
	선택된 주소 : <span id = "address2" >지도를 클릭하세요.</span><br/>
	상세 장소 : <input type = "text" name = "addrDetail" placeholder = "예)공원입구 벤치 아래 "></input>
	<input type = "hidden" id = "latitude" name = "latitude"></input>
	<input type = "hidden" id = "longitude" name = "longitude" value="aa"></input>
	<input type = "hidden" id = "address" name = "addr" ></input>
	<input type = "hidden" name = "cNum" value = "${cNum}">
	<input type = "hidden" name = "cdNum" value = "${cdNum}">
	<input type = "hidden" name = "sn" value = "${sn}">
	<br/>
	<input type = "submit" value = "입력" >
	<input type = "button" value = "취소" onclick = "javascript:window.location='list_view.jsp'">
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6980627efdafc9b33ee3f2e602c8f9da&libraries=services"></script>
<script type="text/javascript" src="find.js/write_addr_view.js"></script>


</body>
</html>