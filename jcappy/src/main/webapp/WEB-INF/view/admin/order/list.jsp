<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>

function admin_order_list_checkbox_count(name) {
	var count = 0;

	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked"))
		count++;
	}
	return count;
}

function pay_check(name) {
	
	var count1 = admin_order_list_checkbox_count(name);
		
	if (count1 == 0) {
		alert('체크된 항목이 없습니다.');
		return false;
	}
	
	var count2 = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked")) {
			if ($('.order_state').eq(i).text() != '결제대기') {
				$('input[name="' + name + '"]').eq(i).prop("checked", false);
				checkOne(name);
				count2++;
			}
		}
	}
	
	if (count2 > 0) {
		alert("'주문상태'가 '결제대기'인 상품들만 선택해주세요.");
		return false;
	} else {
		if (confirm('총 ' + count1 + '건이 입금확인 됩니다.')) {
			$.ajax({
				url: "/jcappy/admin/order/pay_check",
				method: 'POST',
				data: $('#frm').serialize(),
				success: function(res) {
					if (res.trim() == 'true') {
						alert('총 ' + count1 + '건이 입금확인 되었습니다.');
						location.href="/jcappy/admin/order/list";
					} else {
						alert('오류발생, 입금확인에 실패하였습니다.');
					}
				},
			});
		}
	}
}

function delivery_check(name) {
	
	var count1 = admin_order_list_checkbox_count(name);
		
	if (count1 == 0) {
		alert('체크된 항목이 없습니다.');
		return false;
	}
	
	var count2 = 0;
	
	for (var i = 0; i < $('input[name="' + name + '"]').length; i++) {
		if ($('input[name="' + name + '"]').eq(i).prop("checked")) {
			if ($('.delivery_state').eq(i).text() != '상품준비중') {
				$('input[name="' + name + '"]').eq(i).prop("checked", false);
				checkOne(name);
				count2++;
			}
		}
	}
	
	if (count2 > 0) {
		alert("'배송상태'가 '상품준비중'인 상품들만 선택해주세요.");
		return false;
	} else {
		if (confirm('총 ' + count1 + '건을 출고 처리하시겠습니까?')) {
			$.ajax({
				url: "/jcappy/admin/order/delivery_check",
				method: 'POST',
				data: $('#frm').serialize(),
				success: function(res) {
					if (res.trim() == 'true') {
						alert('총 ' + count1 + '건이 출고 처리되었습니다.');
						location.href="/jcappy/admin/order/list";
					} else {
						alert('오류발생, 출고 처리에 실패하였습니다.');
					}
				},
			});
		}
	}
}
</script>
</head>
<body>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>주문관리 - [목록]</h2>
				</div>
				<div class="con">
					<div id="admin_order_list">
						<div id="bbs">
							<div id="blist">
								<p><span><strong>총 ${orderinfoVo.totCount }개</strong>  |  ${orderinfoVo.reqPage }/${orderinfoVo.totPage }페이지</span></p>
								<form name="frm" id="frm" action="" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주문목록">
										<colgroup>
											<col class="w5" />
											<col class="w7" />
											<col class="w19" />
											<col class="w25" />
											<col class="w14" />
											<col class="w8" />
											<col class="w14" />
											<col class="w8" />
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="checkAll('onos');"/></th>
												<th scope="col">주문번호</th>
												<th scope="col">주문자명</th> 
												<th scope="col">주문상품</th> 
												<th scope="col">주문일</th> 
												<th scope="col">주문상태</th> 
												<th scope="col">주문금액</th> 
												<th scope="col" class="last">배송상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty list }">
													<tr>
														<td class="first" colspan="10">주문이 없습니다.</td>
													</tr>
												</c:when>
												<c:when test="${!empty list }">
													<c:forEach var="vo" items="${list }" varStatus="status">
														<tr>
															<td class="first"><input type="checkbox" name="onos" value="${vo.ono }" onClick="checkOne('onos');"/></td>
															<td>
																<a href="detail?ono=${vo.ono}&orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.reqPage}">
																	${vo.ono }
																</a>
															</td>
															<td>${vo.mname} (${vo.memail})</td>
															<td class="title">${vo.pname }... 외 <strong>${vo.total_pcount - 1}건</strong></td>
															<td><fmt:formatDate value="${vo.odate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
															<td class="order_state">${vo.o_state}</td>
															<td><fmt:formatNumber value="${vo.total_price }" pattern="#,###,###원"/></td>
															<td class="delivery_state">${vo.o_del }</td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="javascript:pay_check('onos');" onclick=""><strong>입금확인</strong></a>
										<a class="btns" href="javascript:delivery_check('onos');" onclick=""><strong>배송처리</strong></a>
									</div>
									<div class="btnRight">
										<a class="wbtn" href="add"><strong>등록</strong> </a>
									</div>
								</div>
								<!--//btn-->
								<!-- 페이징 처리 -->
								<div class='page'>
		                        	<c:if test="${orderinfoVo.endPage > orderinfoVo.pageRange}">
		                        		<a href="index.do?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.startPage - 1 }">이전</a>
		                        	</c:if>
		                        	
		                        	<c:forEach var="page" begin="${orderinfoVo.startPage }" end="${orderinfoVo.endPage }">
		                        	    <c:if test="${orderinfoVo.reqPage == page }">
			                        	    <a href='list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${page}'>
			                        	    	<strong>
				                        	    	${page }
				                        	    </strong>
			                        	    </a>
		                        	    </c:if>
		                        	    <c:if test="${orderinfoVo.reqPage != page }">
			                        	    <a href='list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${page}'>
			                        	    	${page }
			                        	    </a>
		                        	    </c:if>
		                       		</c:forEach>
		                       		
		                       		<c:if test="${orderinfoVo.endPage < orderinfoVo.totPage }">
		                        		<a href="list?orderby=${orderinfoVo.orderby}&direct=${orderinfoVo.direct}&pageRow=${orderinfoVo.pageRow}&stype=${orderinfoVo.stype }&sval=${orderinfoVo.sval }&reqPage=${orderinfoVo.endPage + 1 }">다음</a>
		                        	</c:if>	
								</div>
								<!-- //페이징 처리 -->
								<form name="searchForm" id="searchForm" action="list"  method="post">
									<div class="search">
											<select id="orderby" name="orderby" class="dSelect" title="정렬기준" onchange="$('#searchForm').submit()">
												<option value="odate" <c:if test="${param.orderby == 'odate' }">selected</c:if>>주문일</option>
												<option value="total_price" <c:if test="${param.orderby == 'total_price' }">selected</c:if>>주문금액</option>
												<option value="o_state" <c:if test="${param.orderby == 'o_state' }">selected</c:if>>주문상태</option>
												<option value="o_del" <c:if test="${param.orderby == 'o_del' }">selected</c:if>>배송상태</option>
											</select>
											<select id="direct" name="direct" class="dSelect" title="정렬순서" onchange="$('#searchForm').submit()">
												<option value="DESC" <c:if test="${param.direct== 'DESC' }">selected</c:if>>내림차순</option>
												<option value="ASC" <c:if test="${param.direct == 'ASC' }">selected</c:if>>오름차순</option>
											</select>
											<select id="pageRow" name="pageRow" class="dSelect" title="출력갯수" onchange="$('#searchForm').submit()">
												<option value="10" <c:if test="${param.pageRow == '10' }">selected</c:if>>10</option>
												<option value="20" <c:if test="${param.pageRow == '20' }">selected</c:if>>20</option>
												<option value="30" <c:if test="${param.pageRow == '30' }">selected</c:if>>30</option>
											</select>
											<select id="stype" name="stype" class="dSelect" title="검색분류">
												<option value="all">전체</option>
												<option value="mname" <c:if test="${param.stype == 'mname' }">selected</c:if>>이름</option>
												<option value="memail" <c:if test="${param.stype == 'memail' }">selected</c:if>>이메일</option>
												<option value="o_state" <c:if test="${param.stype == 'o_state' }">selected</c:if>>주문상태</option>
												<option value="o_del" <c:if test="${param.stype == 'o_del' }">selected</c:if>>배송상태</option>
											</select>
										<input type="text" name="sval" value="${param.sval }" title="검색할 내용을 입력해주세요" />
										<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>	
</body>
</html>