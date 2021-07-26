//위도, 경도 배열
var nums = document.getElementsByClassName("f_num");
var addr = document.getElementsByClassName("f_addr");
var addrDetail = document.getElementsByClassName("f_addrDetail");
var titles = document.getElementsByClassName("f_title");
var contents = document.getElementsByClassName("f_contents");
var latitudes = document.getElementsByClassName("f_latitudes");
var longitudes = document.getElementsByClassName("f_longitudes");

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(latitudes[0].value, longitudes[0].value), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];
var overlays = [];

for (var i = 0; i< latitudes.length;i++){
	 var content = '<div class="wrap">' + 
     '    <div class="info">' + 
     '        <div class="title">' + 
     titles[i].innerHTML +
     '        </div>' + 
     '        <div class="body">' + 
     '            <div class="img">' +
     '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
     '           </div>' + 
     '            <div class="desc">' + 
     '                <div class="ellipsis">'+
     				  addr[i].innerHTML +
     '				  </div>' + 
     '                <div class="jibun ellipsis">'+
     				  addrDetail[i].innerHTML +
     '				  </div>' + 
     '                <div class="jibun ellipsis">'+
     				  contents[i].innerHTML +
     '				  </div>' + 
     '                <div><input type = "button" value = "게시물보기"></input></div>' + 
     '            </div>' + 
     '        </div>' + 
     '    </div>' +    
     '</div>';
		
	positions.push(
	    {content: content, 
        latlng: new kakao.maps.LatLng(latitudes[i].value, longitudes[i].value)}
	);
}
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
    });
    

    // 마커 위에 커스텀 오버레이 생성
    var overlay = new kakao.maps.CustomOverlay({
        position: positions[i].latlng,
        content: positions[i].content,
        map: map
    });
    
    overlay.setMap(null);    

    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, overlay));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(overlay));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, overlay));
    
    overlays.push(overlay);
}

var selectedOverlay = null;

function makeClickListener(map,marker, overlay) {
	return function() {
		for (var i = 0; i < overlays.length; i++) {
			overlays[i].setMap(null);
		}
		selectedOverlay = overlay;
		selectedOverlay.setMap(map);
	}
}

function makeOverListener(map, marker, overlay) {
    return function() {
    	overlay.setMap(map);
    };
}

function makeOutListener(overlay) {
    return function() {
        overlay.setMap(null);
        selectedOverlay.setMap(map);
    };
}

kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
	selectedOverlay.setMap(null);
	selectedOverlay = null;
});

