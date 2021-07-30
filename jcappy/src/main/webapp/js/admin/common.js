/*======================================
일괄선택, 일괄삭제
========================================*/
function checkDelete(name) {

	var count = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked"))
		count++;
	}

	if (count == 0) {
		alert('체크된 항목이 없습니다.');
		return false;
	} else {
		if (confirm('총 ' + count + '건을 삭제하시겠습니까?')) {
			$('#frm').submit();
		}
	}
}

function checkAll(name) {

	if ($('#allChk').prop("checked")) {
		$('input[name="' + name + '"]').prop("checked", true);
	} else {
		$('input[name="' + name + '"]').prop("checked", false);
	}
}

function checkOne(name) {
	
	var count = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked"))
		count++;
	}
	
	if (count == $('input[name="' + name + '"]').length) {
		$('#allChk').prop("checked", true);
	} else {
		$('#allChk').prop("checked", false);
	}
}