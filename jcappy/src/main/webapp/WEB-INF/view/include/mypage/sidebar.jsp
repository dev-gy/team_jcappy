<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>

	$(function() {
		$(".mypage_sidebar").css("height", $("#footer").offset().top);
	});
	
	function isDel() {
		if (confirm('탈퇴 하시겠습니까?\n탈퇴한 계정은 복구할 수 없습니다.')) {
			$.ajax({
				url:'/jcappy/mypage/delete',
				data:{
					'mno':${membersInfo.mno}
				},
				method:'post',
				success:function(data) {
					if (data.trim() != 0) {
						alert('정상적으로 탈퇴되었습니다.');
						location.href='/jcappy/index';
					} else {
						alert('탈퇴 실패');
					}
				},
				error : function(res) {
					console.log(res);
				}
			});
		}
	}
	
</script>
<div class="mypage_sidebar">
	<div><a href="/jcappy/mypage/order">주문조회</a></div>
	<div><a href="/jcappy/mypage/memberedit">정보수정</a></div>
	<div><a href="/jcappy/mypage/coupon">쿠폰함</a></div>
	<div><a href="/jcappy/mypage/qna/list">1:1문의</a></div>
	<div><a href="/jcappy/mypage/order/cancel">취소/교환/반품 조회</a></div>
	<div><a href="javascript:isDel();">회원탈퇴</a></div>
</div>