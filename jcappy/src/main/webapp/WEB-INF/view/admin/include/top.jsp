<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>
<script>
$(window).load(function(){
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});

function checkAuth(servletPath) {
	if (servletPath == '/admin/product/list' && ${adminInfo.authList[0] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/order/list' && ${adminInfo.authList[1] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/members/list' && ${adminInfo.authList[2] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/board/review/list' && ${adminInfo.authList[3] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/board/qna/list' && ${adminInfo.authList[3] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/board/notice/list' && ${adminInfo.authList[3] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/add/index' && ${adminInfo.authList[4] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/sales/index' && ${adminInfo.authList[5] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else if (servletPath == '/admin/auth/list' && ${adminInfo.authList[6] eq 1}) {
		location.href='<%=request.getContextPath()%>' + servletPath;
		return;
	} else {
		alert('접근 권한이 없습니다.');
		return;
	}
}

</script>
<div id="header">
	<div class="header_inner">
		<a href="/jcappy/admin/main">
			<h1 id="top_title">
				JCAPPY <span>MANAGEMENT</span>
			</h1>
		</a>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
<%-- 				<li class="frist"><a href="<%=request.getContextPath()%>/admin/index.do" onclick="">Home</a></li> --%>
				<li><a href="<%=request.getContextPath()%>/admin/logout">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="#" onClick="checkAuth('/admin/product/list');" class="parent"><span>상품관리</span></a></li>
				<li><a href="#" onClick="checkAuth('/admin/order/list');" class="parent"><span>주문관리</span></a></li>
				<li><a href="#" onClick="checkAuth('/admin/members/list');" class="parent"><span>회원관리</span></a></li>
				<li><a href="#" onClick="checkAuth('/admin/board/review/list');" class="parent"><span>게시판관리</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="#" onClick="checkAuth('/admin/board/review/list');"><span>리뷰게시판</span></a></li>
						<li><a href="#" onClick="checkAuth('/admin/board/qna/list');"><span>문의게시판</span></a></li>
						<li><a href="#" onClick="checkAuth('/admin/board/notice/list');"><span>공지사항</span></a></li>
					</ul>
					</div>
				</li>
				<li><a href="#" onClick="checkAuth('/admin/add/index');" class="parent"><span>부가기능</span></a></li>
				<li><a href="#" onClick="checkAuth('/admin/sales/index');" class="parent"><span>매출조회</span></a></li>
				<li><a href="#" onClick="checkAuth('/admin/auth/list');" class="parent"><span>관리자계정</span></a></li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->