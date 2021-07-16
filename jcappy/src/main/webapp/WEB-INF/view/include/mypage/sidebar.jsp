<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>

	$(function() {
		$(".mypage_sidebar").css("height", $("#footer").offset().top);
// 		$(window).resize(function() {
// 			$(".mypage_sidebar").css("height", $("#footer").offset().top);
// 		});
	});
</script>
<div class="mypage_sidebar">
	<div><h2>주문조회</h2></div>
	<div><h2>정보수정</h2></div>
	<div><h2>쿠폰함</h2></div>
	<div><h2>1:1문의</h2></div>
	<div><h2>취소/교환/반품</h2></div>
	<div><h2>회원탈퇴</h2></div>
</div>