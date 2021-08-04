function infoConfirm() {
	if(document.reg_frm.userId.value.length == 0) {
		alert("아이디는 필수사항 입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.userId.value.length < 4) {
	alert("아이디는 4자 이상 입력하세요..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.pw.value.length == 0) {
		alert("패스워드는 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("패스워드가 일치하지 않습니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.name.value.length == 0) {
		alert("이름은 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일은 필수사항입니다..");
		reg_frm.userId.focus();
		return;
	}
	
	document.reg_frm.submit();
}

function updateInfoConfirm(){
	if(document.reg_frm.pw.value == ""){
		alert("패스워드를 입력하세요.");
		document.reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value){
		alert("패스워드가 일치하지 않습니다..");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0){
		alert("메일은 필수 사항입니다.");
		reg_frm.eMail.focus();
		return;
	}
	
	document.reg_frm.submit();
	
}

//------------------------------------
function func1(){
	var tag1 = "aaa";
	document.getElementById("area").innerHTML = tag1;
}
	
//	var geocoder = new kakao.maps.services.Geocoder();
//// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
//if (navigator.geolocation) {
//    
//    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
//    navigator.geolocation.getCurrentPosition(function(position) {
//        
//        var lat = position.coords.latitude; // 위도
//        var lon = position.coords.longitude; // 경도
//        
//        alert(lat);
//      });
//    
//} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
//    
//	alert('현재 위치 정보를 찾을 수 없습니다.');
//}
//
//

