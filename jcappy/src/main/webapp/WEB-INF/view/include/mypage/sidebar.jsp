<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>

	$(function() {
		$(".mypage_sidebar").css("height", $("#footer").offset().top);
// 		$(window).resize(function() {
// 			$(".mypage_sidebar").css("height", $("#footer").offset().top);
// 		});
	});
	
	function isDel() {
		if (confirm('삭제하시겠습니까?')) {
			$.ajax({
				url:'/jcappy/mypage/delete',
				data:{
					'mno':${vo.mno}
				},
				method:'post',
				success:function(res) {
					console.log(res);
					if (res.trim() == 'true') {
						alert('정상적으로 삭제되었습니다.');
						location.href='index.do';
					} else {
						alert('삭제 실패');
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
	<div><a href="/jcappy/mypage/order/index.do">주문조회</a></div>
	<div><a href="/jcappy/mypage/memberedit.do">정보수정</a></div>
	<div><a href="/jcappy/mypage/coupon.do">쿠폰함</a></div>
	<div><a href="/jcappy/mypage/qna/index.do">1:1문의</a></div>
	<div><a href="/jcappy/mypage/order/cancel.do">취소/교환/반품</a></div>
	<div><a href="javascript:isDel();">회원탈퇴</a></div>
</div>