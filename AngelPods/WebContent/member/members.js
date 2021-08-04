

function updateAddress(){
	reg_frm.sido.value = reg_frm.sido2.value;
	reg_frm.gugun.value = reg_frm.gugun2.value;
	document.getElementById('sido_view').innerHTML = reg_frm.sido2.value;
	document.getElementById('gugun_view').innerHTML = reg_frm.gugun2.value;
}