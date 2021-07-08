$(function() {
	$('#checkAll').click(function() {
		if ($('#checkAll').prop('checked')) {
			$('#termsOfService').prop('checked', true);
			$('#privacyPolicy').prop('checked', true);
			$('#continue').attr('disabled', false);
			$("#continue").css("background-color", "white");
		} else {
			$('#termsOfService').prop('checked', false);
			$('#privacyPolicy').prop('checked', false);
			$('#continue').attr('disabled', true);
			$("#continue").css("background-color", "#999");
		}
	})
	$('#termsOfService').click(function() {
		if ($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')) {
			$('#checkAll').prop('checked', true);
			$('#continue').attr('disabled', false);
			$("#continue").css("background-color", "white");
		} else {
			$('#checkAll').prop('checked', false);
			$('#continue').attr('disabled', true);
			$("#continue").css("background-color", "#999");
		}
	})
	$('#privacyPolicy').click(function() {
		if ($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')) {
			$('#checkAll').prop('checked', true);
			$('#continue').attr('disabled', false);
			$("#continue").css("background-color", "white");
		} else {
			$('#checkAll').prop('checked', false);
			$('#continue').attr('disabled', true);
			$("#continue").css("background-color", "#999");
		}
	})

});