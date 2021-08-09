<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
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
					<h2>리뷰 등록 / 수정</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="review_write_wrap">
			        
			        <div class="review_write_product">
			            <a href=""><img src="/jcappy/img/t1.jpg"></a>
			            <a href=""><p>상품명</p></a>
			        </div>
			        <div class="review_write_star">
			            <p>별점</p>
			            <img src="/jcappy/img/star1.png">
			        </div>
			        <div class="review_write_content">
			            <p>상품평</p>
			            <div class="review_write_textarea">
			                <textarea style="height:500px; width:700px" ></textarea>
			            </div>
			            <div class="review_write_picture"> 
			                <div class="review_write_picture_description">*총 5장까지 첨부할 수 있습니다.</div>
			                <p>사진 첨부</p>
			                <div class="review_write_picture_file"><input type="file"></div>
			            </div>
			            <div class="review_write_button">
			                <div class="review_write_submit"><button class="cstyle_btn">등록</button></div>
			                <div class="review_write_cancle"><button class="cstyle_btn">취소</button></div>
			            </div>
			        </div>
	        
	    		</div>  
				
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>