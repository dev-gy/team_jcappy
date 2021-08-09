<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script type="text/javascript" src="/jcappy/js/starrating.js"></script>
<link rel="stylesheet" type="text/css" href="/jcappy/css/starrating.css" />
<style type="text/css">
	
</style>
<script type="text/javascript">
$(function() {
	$(".rstar_area").on("click", function() {
		$("#rstar").val($(this).index()+1);
		$(".review_score").text($("#rstar").val());
		$(".review_score").generateStars();
		
	});
})

 
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<%@ include file="/WEB-INF/view/include/mypage/sidebar.jsp"%>
			<%@ include file="/WEB-INF/view/include/mypage/userinfo.jsp"%>
			<!-- 마이페이지 공통 컨텐츠 -->
			<div class="mypage_content">
				<!-- 마이페이지 공통 서브타이틀 -->
				<div class="mypage_subtitle">
					<h2>리뷰 작성</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="review_write_content">
					<form action="/jcappy/mypage/review/insert" method="post" enctype="multipart/form-data">
						<table class="cstyle_table">
							<tbody>
								<tr>
									<td><span class="item_image" style="background-image: url('${pVo.pimg1_org }');"></span> ${pVo.pname }</td>
								</tr>
								<tr>
									<td>
										별점
										<span class="review_score_area">
											<span class="review_score" id="review_score">5</span>
											<img usemap="#rstarmap">
											<map name="rstarmap">
												<area class="rstar_area" shape="rect" coords="0, 0, 16, 16">
												<area class="rstar_area" shape="rect" coords="16, 0, 32, 16">
												<area class="rstar_area" shape="rect" coords="32, 0, 48, 16">
												<area class="rstar_area" shape="rect" coords="48, 0, 64, 16">
												<area class="rstar_area" shape="rect" coords="64, 0, 80, 16">
											</map>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<input class="review_title" name="rtitle" placeholder="제목을 입력해주세요"></input>
										<textarea class="review_content" name="rcontent" maxlength="200" placeholder="내용을 입력해주세요 (최대 200글자)"></textarea>
						                <p>사진 첨부</p>
						                <div class="review_write_picture_file"><input type="file" name="file" accept="image/*"></div>
									</td>
								</tr>
							</tbody>
						</table>
						<input id="rstar" type="hidden" name="rstar" value="5">
						<input type="hidden" name="ono" value="${ono }">
						<input type="hidden" name="pno" value="${pVo.pno }">
						<input class="cstyle_btn insert_btn" type="submit" value="작성">
					</form>
	    		</div>  
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>