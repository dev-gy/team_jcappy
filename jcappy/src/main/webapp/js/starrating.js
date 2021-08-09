$(function() {
	// fn=대상 함수에 현재 함수를 상속 시킨다. ($ 에 generateStars 라는 함수를 추가 및 기능 구현, 삽입)
	$.fn.generateStars = function() {
		// 호출대상 요소 안에 요소의 텍스트(점수)*16(width 총길이가 80px 이기때문에 80/별갯수 해준 값)길이의 span 을 추가  
		// 호출대상은 회색 별 배경을 지니고 자식요소는 노란 별 배경을 지니며 반복이미지 길이로 별점을 출력한다.
	    return $(this).html($('<span/>').width($($(this)).text()*16));
	};
	
	// 숫자 평점을 별로 변환하도록 호출하는 함수
	$(".review_score").each(function(index, item) {
		$(item).generateStars();
	});
});