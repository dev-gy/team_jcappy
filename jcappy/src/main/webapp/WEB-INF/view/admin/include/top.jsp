<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>
<script>
$(window).load(function(){
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1 id="top_title">JCAPPY_MANAGEMENT</h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
<%-- 				<li class="frist"><a href="<%=request.getContextPath()%>/admin/index.do" onclick="">Home</a></li> --%>
				<li><a href="<%=request.getContextPath()%>/admin/logout.do">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="<%=request.getContextPath()%>/admin/product/list" class="parent"><span>상품관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/order/list" class="parent"><span>주문관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/user/list" class="parent"><span>회원관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/board/review/list" class="parent"><span>게시판관리</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/admin/board/review/list"><span>리뷰게시판</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/board/qna/list"><span>문의게시판</span></a></li>
						<li><a href="<%=request.getContextPath()%>/admin/board/notice/list"><span>공지사항</span></a></li>
					</ul>
					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/admin/add/index" class="parent"><span>부가기능</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/account/index" class="parent"><span>매출조회</span></a></li>
				<li><a href="<%=request.getContextPath()%>/admin/auth/list" class="parent"><span>관리자계정</span></a></li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->