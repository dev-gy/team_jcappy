$(function() {
	$(".itemInfo_board_title").click(function() { //상품상세 카테고리 변경
		$('.itemInfo_board_title').removeClass('on');
		$(this).addClass('on');
		// console.log($(this).text());
		if ($(this).text() == '상품 상세') {
			$('#board_notice').show();
			$('#board_data').hide();
		} else {
			$('#board_notice').hide();
			$('#board_data').show();
		}
	});
	$(".itemInfo_minor_img").click(function() { //이미지 변경
		console.log($(this));
		var imgSrc = $(this).attr('src');
		$('.itemInfo_major_img').attr('src', imgSrc);
	});
});