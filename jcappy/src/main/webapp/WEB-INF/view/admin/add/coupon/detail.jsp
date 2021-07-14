<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>쿠폰관리 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">번호</label></th>
										<td colspan="10">
											<input type="text" id="coupon_no" name="coupon_no" class="w100" value="1" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">쿠폰이름</label></th>
										<td colspan="10">
											<input type="text" id="coupon_name" name="coupon_name" class="w100" value="여름특가vip쿠폰" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">할인금액</label></th>
										<td colspan="10">
											<input type="text" id="sales_money" name="sales_money" class="w100" value="3000" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">유효기간</label></th>
										<td colspan="10">
											<input type="text" id="validity" name="validity" class="w100" value="2021-7-24" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">사용여부</label></th>
										<td colspan="10">
											<input type="text" id="use" name="use" class="w100" value="Y" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">발급날짜</label></th>
										<td colspan="10">
											<input type="text" id="issue_date" name="issue_date" class="w100" value="2021-6-24" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원이름</label></th>
										<td colspan="10">
											<input type="text" id="member_name" name="member_name" class="w100" value="안두용" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">회원이메일</label></th>
										<td colspan="10">
											<input type="text" id="member_email" name="member_email" class="w100" value="ady4709@naver.com" />
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=request.getContextPath()%>/admin/add_ons/coupon_list.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href=""><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href=""><strong>삭제</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>