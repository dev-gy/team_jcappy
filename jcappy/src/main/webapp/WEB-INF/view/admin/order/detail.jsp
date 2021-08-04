<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<body>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/admin/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>주문관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="admin_order_detail">
							<form method="post" name="frm" id="frm" action="">
								<input type="hidden" name="mno" value="${vo.mno }">
								<div id="bbs" class="admin_order_detail_info">
									<div id="bread">
										<table>
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="ono">주문번호</label></th>
													<td colspan="10"><input type="text" id="ono" name="ono" class="w100" value="${vo.ono}" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mname">주문자이름</label></th>
													<td colspan="10"><input type="text" id="mname" name="mname" class="w100" value="${vo.mname }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="memail">주문자이메일</label></th>
													<td colspan="10"><input type="text" id="memail" name="memail" class="w100" value="${vo.memail }" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="odate">주문일</label></th>
													<td colspan="10"><input type="text" id="odate" name="odate" class="w100" value="<fmt:formatDate value="${vo.odate }" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled /></td>
												</tr>
												<tr>
													<th scope="row"><label for="o_state">주문상태</label></th>
													<td colspan="10"><input type="text" id="o_state" name="o_state" class="w100" value="${vo.o_state }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="o_del">배송상태</label></th>
													<td colspan="10"><input type="text" id="o_del" name="o_del" class="w100" value="${vo.o_del }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="opay">결제정보</label></th>
													<td colspan="10"><input type="text" id="opay" name="opay" class="w100" value="${vo.opay }" readonly /></td>
												</tr>
											</tbody>
										</table>
										<table>
											<colgroup>
												<col width="30%" />
												<col width="*" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="ono">배송지정보</label></th>
													<td colspan="10">
														<label><input type="radio" name="adds" value="1" />&nbsp;기본배송지</label>&nbsp;
														<label><input type="radio" name="adds" value="2" />&nbsp;최근배송지</label>&nbsp;
														<label><input type="radio" name="adds" value="3" />&nbsp;직접입력</label>
													</td>
												</tr>
												<tr>
													<th scope="row"><label for="oname">수령인</label></th>
													<td colspan="10"><input type="text" id="oname" name="oname" class="w100" value="${vo.oname }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="ophone">연락처</label></th>
													<td colspan="10"><input type="text" id="ophone" name="ophone" class="w100" value="${vo.ophone }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="ozipcode">우편번호</label></th>
													<td colspan="10"><input type="text" id="ozipcode" name="ozipcode" class="w100" value="${vo.ozipcode }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="oaddr">주소</label></th>
													<td colspan="10"><input type="text" id="oaddr" name="oaddr" class="w100" value="${vo.oaddr }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="oaddrde">상세주소</label></th>
													<td colspan="10"><input type="text" id="oaddrde" name="oaddrde" class="w100" value="${vo.oaddrde }" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="orequest">배송메시지</label></th>
													<td colspan="10"><input type="text" id="orequest" name="orequest" class="w100" value="${vo.orequest }" /></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- //bread -->
								</div>
								<div id="bbs" class="admin_order_detail_product">
									<div id="blist">
										<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문상품목록">
											<colgroup>
												<col class="w10" />
												<col class="w30" />
												<col class="w20" />
												<col class="w10" />
												<col class="w30" />
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="first"><strong>주문상품</strong></th>
													<th scope="col">상품명</th>
													<th scope="col">상품금액</th>
													<th scope="col">상품수량</th>
													<th scope="col" class="last">합계</th>
												</tr>
											</thead>
											<tbody>
<%-- 												<c:forEach var="vo" items="${list }" varStatus="status"> --%>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
													<tr>
														<td class="first">${status.index }</td>
														<td>${vo.ol_pname}</td>
														<td>${vo.ol_pprice}</td>
														<td>${vo.ol_pcount}</td>
														<td>${vo.ol_pprice * ol_pcount}</td>
													</tr>
<%-- 												</c:forEach> --%>
													<tr>
														<td class="first" colspan="4">할인금액</td>
														<td>쿠폰금액가져오기</td>
													</tr>
													<tr>
														<td class="first" colspan="4">결제금액</td>
														<td>합계의 합 - 할인금액</td>
													</tr>
											</tbody>
										</table>
										</div>
										<div id="bread">
											<table>
												<colgroup>
													<col width="30%" />
													<col width="*" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label for="oc_reason">취소 / 반품 사유</label></th>
														<td colspan="10">취소사유</td>
													</tr>
												</tbody>
											</table>
										</div>
									<div class="btn">
										<div class="btnLeft">
											<a class="btns" href="#" onClick="history.back();"><strong>목록</strong></a>
											<a class="btns" onclick="updateMembers();"><strong>수정</strong></a>
											<a class="btns" href="#" onClick="history.back();"><strong>입금확인</strong></a>
											<a class="btns" onclick="updateMembers();"><strong>배송처리</strong></a>
										</div>
										<div class="btnRight">
											<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품</strong></a>
											<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품 승인</strong></a>
											<a class="btns" onclick="delMembers(${vo.mno});"><strong>취소 / 반품 거부</strong></a>
										</div>
									</div>
									<!--//btn-->
								</div>
							</form>
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