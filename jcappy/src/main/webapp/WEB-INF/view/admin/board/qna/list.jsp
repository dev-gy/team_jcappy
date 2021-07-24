<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<h2>문의게시판 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${qnaVo.totCount}개</strong>  |   ${qnaVo.reqPage}/${qnaVo.totPage }</span></p>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="" />
									<col class="w6" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list }">
			                            <tr>
			                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
									<c:forEach var="vo" items="${list}" varStatus="status">
									<tr>
										<td class="first">${(qnaVo.totCount-status.index)-((qnaVo.reqPage-1)*qnaVo.pageRow)}</td>
										<!-- 상세페이지 링크  -->
										<td class="title"><a href="detail?qno=${vo.qno}&reqPage=${qnaVo.reqPage}&stype=${param.stype}&sval=${param.sval}">
										<c:forEach begin="1" end="${vo.q_nested}">&nbsp;&nbsp;&nbsp;</c:forEach>
                                    	<c:if test="${vo.q_nested > 0}"><img src="/jcappy/img/admin/answer_icon.gif"></c:if>
										${vo.qtitle} </a></td>
										<td>${vo.mname }</td>
										<td><fmt:formatDate value="${vo.qregdate }" pattern="yyyy-MM-dd"/> </td> <!-- 년월일 포맷 폼 -->
									</tr>
									</c:forEach>
								</tbody>
							</table>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<div class='page'>
		                        <c:if test="${qnaVo.startPage > qnaVo.pageRange}">
		                        	<span><a href="list?reqPage=${qnaVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}"><</a></span>
		                        </c:if>
		                        <c:forEach var="rp" begin="${qnaVo.startPage}" end="${qnaVo.endPage }">
		                        <c:if test="${qnaVo.reqPage == rp }">
									<span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}'><strong>${rp }</strong></a></span>
		                        </c:if>
		                        <c:if test="${qnaVo.reqPage != rp }">
		                            <span><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}'>${rp }</a></span>
		                        </c:if>
		                        </c:forEach>
		                        <c:if test="${qnaVo.totPage > qnaVo.endPage}">
		                        	<span><a href="list?reqPage=${qnaVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}">></a></span>
		                        </c:if>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="list"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="qtitle" <c:if test="${param.stype=='qtitle'}">selected</c:if>>제목</option>
										<option value="qcontent" <c:if test="${param.stype=='qcontent'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="sval" value="${param.sval}" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();"/>
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