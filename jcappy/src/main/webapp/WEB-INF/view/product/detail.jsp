<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<style>
.itemInfo_content { width: auto; height: auto; position:relative; box-sizing: border-box; border-collapse: collapse; }
.itemInfo_left { width: 50%; height: 100%; border }
</style>
</head>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<div class="itemInfo_content">
				<div class="itemInfo_left">
					<div class="itemInfo_major_img" style="background-image: url('/jcappy/img/상세 이미지1.jpg');">
					<div class="itemInfo_size2">
						<div class="itemInfo_minor_img" id="minor_img1" style="background-image: url('/jcappy/img/상세 이미지1.jpg');">
							<div class="itemInfo_minor_img" id="minor_img2" style="background-image: url('/jcappy/img/상세 이미지2.jpg');">
							<div class="itemInfo_minor_img" id="minor_img3" style="background-image: url('/jcappy/img/상세 이미지3.jpg');">
						</div>
					</div>
				</div>
			</div>
				<div class="itemInfo_content_detail">
					<p class="itemInfo_name">삼성전자 RF85A9103AP 비스포크 냉장고 875L 21년 신모델 AC21585500</p>
					<p class="itemInfo_price">100,000,000원</p>
					<hr>
					<p class="itemInfo_delivery">
						배송 방법 - 택배<br> 배송비 무료
					</p>
					<hr>
					<p class="itemInfo_count">
						수량 선택 <br> <br> <img src="/jcappy/img/아이콘 -.jpg" style="width: 20px; height: 20px;">
							<input type="number" style="width: 80px;">
							<img src="/jcappy/img/아이콘 +.jpg" style="width: 20px; height: 20px;">
					</p>
					<p class="itemInfo_final_price">
						총 상품 금액<span>100,000,000원</span>
					</p>
					<button class="itemInfo_button" type="button"
						onclick="location.href=''" style="border: 1px solid black;">장바구니</button>
					<button class="itemInfo_button" type="button"
						onclick="location.href=''" style="border: 1px solid black;">주문하기</button>
				</div>

				<div class="itemInfo_info">
					<div class="itemInfo_board_area">
						<div class="itemInfo_board_title on">상품 상세</div>
						<div class="itemInfo_board_title">리뷰</div>
						<div class="itemInfo_board_content" id="board_notice">
							<ul>
								<img class="itemInfo_info_img" src="/jcappy/img/상세 설명 이미지1.jpg">
								<img class="itemInfo_info_img" src="/jcappy/img/상세 설명 이미지2.jpg">
							</ul>
						</div>
						<div class="itemInfo_board_content" id="board_data">
							<ul>
								<li>
									<div class="itemInfo_reviw_button_size">
										<button class="itemInfo_reviw_button" type="button" onclick="location.href=''" style="border: 1px solid black;">리뷰 작성</button>
									</div>
								</li>
								<li>별점 ***** <span>작성자 아이디<br>작성일
								</span><br> 빠른 배송과 포장 과정 영상 링크에 만족했습니다.정품 이라는것이 큰 장점인거 같아요.선물용으로
									좋습니다. <br>
								<br>
								<img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
								</li>
								<li>별점 ***** <span>작성자 아이디<br>작성일
								</span><br> 첨엔 꽂을 때 잘 안들어가고 귀가 너무 아팠는데 약간 꺾어서 넣어주니까 잘 들어가더라구요.
									쓰다보면 터득하는 노하우랄까.. 가끔씩 끊기는데 (어쩔땐 너무하다 싶을 때도 있고. 이동중 아닐 땐 안끊겨요)
									무선 처음 써봐서 비교할 ...... <br>
								<br>
								<img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
								<img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
								</li>
								<li>별점 ***** <span>작성자 아이디<br>작성일
								</span><br> 모양도 이쁘고 사용도 편합니다
								</li>
								<li>별점 ***** <span>작성자 아이디<br>작성일
								</span><br> 음질 좋습니다~~~
								</li>
								<li>별점 ***** <span>작성자 아이디<br>작성일
								</span><br> 음질도 디자인도 괜찮은듯해요 <br>
								<br>
								<img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
								</li>
							</ul>
							<p style="text-align: center;">
								페이징 <br> 12345
							</p>
						</div>
					</div>
				</div>
				<hr>
				<div class="itemInfo_recommend">
					<p class="itemInfo_recommend_title">추천 상품</p>
					<div class="itemInfo_size">
						<a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300"
							height="300"><br>
							<P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
							<br>
						<br> 100,000,000,000원</a>
					</div>
					<div class="itemInfo_size">
						<a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300"
							height="300"><br>
							<P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
							<br>
						<br> 100,000,000,000원</a>
					</div>
					<div class="itemInfo_size">
						<a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300"
							height="300"><br>
							<P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P>
							<br>
						<br> 100,000,000,000원</a>
					</div>
				</div>
			</div>
		</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>