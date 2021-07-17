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
	<div><a href="/jcappy/mypage/order/index.do">주문조회</a></div>
	<div><a href="/jcappy/mypage/memberedit.do">정보수정</a></div>
	<div><a href="/jcappy/mypage/coupon.do">쿠폰함</a></div>
	<div><a href="/jcappy/mypage/qna/index.do">1:1문의</a></div>
	<div><a href="/jcappy/mypage/order/cancel.do">취소/교환/반품</a></div>
	<div><a href="">회원탈퇴</a></div>
</div>