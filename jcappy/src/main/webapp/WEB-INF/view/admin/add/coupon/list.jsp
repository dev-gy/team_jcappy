<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
function coupon_list_groupDel(name) { // 체크박스에 선택된 쿠폰들 그룹삭제 기능
	var count=0;
	for (var i=0; i<$('input[name="'+name+'"]').length; i++) {
		if ($('input[name="'+name+'"]').eq(i).prop('checked')) {
			count++;
			break;
		}
	}
	if (count == 0) {
		alert('하나 이상 체크해 주세요');
	} else {
		if (confirm('삭제하시겠습니까?')) {
			$("#frm").submit();
		}
	}
}
function coupon_list_check() { // 맨위에 체크박스 선택시 전체선택 다시한번 클릭시 전체 해제 
	if ($("#allChk").prop('checked')) {
		for (var i=0; i<$('input[name="cnos"]').length; i++) {
			$('input[name="cnos"]').eq(i).prop('checked','checked');
		}
	} else {
		for (var i=0; i<$('input[name="cnos"]').length; i++) {
			$('input[name="cnos"]').eq(i).prop('checked','');
		}
	}
}
</script>
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
					<h2>쿠폰관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${couponVo.totCount }개</strong>  | ${couponVo.reqPage}/${couponVo.totPage }페이지</span></p>
							<form name="frm" id="frm" action="groupDelete" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="*" />
									<col class="w10	" />
									<col class="w12" />
									<col class="w10" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="coupon_list_check()"/></th>
										<th scope="col">번호</th>
										<th scope="col">쿠폰코드</th> 
										<th scope="col">할인금액</th> 
										<th scope="col">회원이메일</th>
										<th scope="col" class="last">발급날짜</th>
										<th scope="col">유효기간</th> 
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="7">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
									<c:forEach var="vo" items="${list}" varStatus="status">
									<tr>
										<td class="first"><input type="checkbox" name="cnos" value="${vo.cno}"/></td>
										<td>${(couponVo.totCount-status.index)-((couponVo.reqPage-1)*couponVo.pageRow)}</td>
										<td class="title"><a href="detail?cno=${vo.cno}&reqPage=${couponVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">${vo.ccode} </a></td>
										<td><fmt:formatNumber type="number" value="${vo.cprice}"/>원</td>
										<td>${vo.memail}</td>
										<td><fmt:formatDate value="${vo.cregdate }" pattern="yyyy-MM-dd"/> </td> <!-- 년월일 포맷 폼 -->
										
										<td>${vo.cdate}일 </td>
									</tr>
									</c:forEach>
									
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="coupon_list_groupDel('cnos');"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="create?reqPage=${couponVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
		                        <c:if test="${couponVo.startPage > couponVo.pageRange}">
		                        	<span><a href="list?reqPage=${couponVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a></span>
		                        </c:if>
		                        <c:forEach var="rp" begin="${couponVo.startPage}" end="${couponVo.endPage }">
		                        <c:if test="${couponVo.reqPage == rp }">
									<span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'><strong>${rp }</strong></a></span>
		                        </c:if>
		                        <c:if test="${couponVo.reqPage != rp }">
		                            <span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}'>${rp }</a></span>
		                        </c:if>
		                        </c:forEach>
		                        <c:if test="${couponVo.totPage > couponVo.endPage}">
		                        	<span><a href="list?reqPage=${couponVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a></span>
		                        </c:if>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="list"  method="post">
								<div class="search">
	                                <select id="direct" name="direct" class="dSelect" title="검색분류 선택" onchange="$('#searchForm').submit();">
	                                    <option value="DESC" <c:if test="${param.direct=='DESC'}">selected</c:if>>발급날짜 ↓</option>
	                                    <option value="ASC" <c:if test="${param.direct=='ASC'}">selected</c:if>>발급날짜 ↑</option>
	                                </select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="ccode" <c:if test="${param.stype=='ccode'}">selected</c:if>>쿠폰코드</option>
										<option value="cprice" <c:if test="${param.stype=='cprice'}">selected</c:if>>할인금액</option>
										<option value="memail" <c:if test="${param.stype=='memail'}">selected</c:if>>이메일</option>
									</select>
									<input type="text" name="sval" value="${param.sval }"  title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();" />
								</div>
							</form>
							<!-- //search --> 
						</div>
						<!-- //blist -->
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