<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
    function move() {
    	<c:if test="${!empty membersInfo}">
    	location.href='/mypage/qna/write';
    	</c:if>
    	<c:if test="${empty membersInfo}">
    	alert('로그인 후 사용가능합니다.');
    	</c:if>
    }  
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
					<h2>1:1 문의내역</h2>
				</div>

				<!-- 현재 페이지 컨텐츠 구현부 -->
				<div class="qna_content">
					<table class="cstyle_table">
					 <p style="text-align:right"><span><strong>총 ${qnaVo.totCount }개</strong>  |  ${qnaVo.reqPage}/${qnaVo.totPage }페이지</span></p>
						<colgroup>
							<col width="100px">
							<col width="*" />
							<col width="120px">
							<col width="120px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="first">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
		                           <tr>
		                               <td class="first" colspan="4">등록된 글이 없습니다.</td>
		                           </tr>
		                       </c:if>
		                       <c:forEach var="vo" items="${list}" varStatus="status">
		                       	<tr>
		                       		<td>${(qnaVo.totCount-status.index)-((qnaVo.reqPage-1)*qnaVo.pageRow)}</td>
		                       		<td class="title">
		                       			<a href="detail?qno=${vo.qno}&reqPage=${qnaVo.reqPage}&stype=${param.stype}&sval=${param.sval}">
		                       				<c:forEach begin="1" end="${vo.q_nested}">&nbsp;&nbsp;&nbsp;</c:forEach>
		                                   	<c:if test="${vo.q_nested > 0}"><img src="/jcappy/img/admin/answer_icon.gif"></c:if>
											${vo.qtitle} 
										</a>
									</td>
									<td><fmt:formatDate value="${vo.qregdate }" pattern="yyyy-MM-dd"/></td>
									<td>
										<div class="item_state">접수대기</div>
									</td>
		                       </c:forEach>
						</tbody>
					</table>
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
					<br>
					<!-- //페이징 처리 -->
					<form name="searchForm" id="searchForm" action="list"  method="post">
						<div class="search">
							<select name="stype" title="검색을 선택해주세요">
								<option value="all">전체</option>
								<option value="qtitle" <c:if test="${param.stype=='qtitle'}">selected</c:if>>제목</option>
								<option value="qcontent" <c:if test="${param.stype=='qcontent'}">selected</c:if>>내용</option>
							</select>
							<input type="text" name="sval" value="${param.sval }"  title="검색할 내용을 입력해주세요" />
							<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" onclick="$('#searchForm').submit();" />
						</div>
					</form>
					<div>
						<button class="qna_write_btn cstyle_btn" onclick="location.href='/jcappy/mypage/qna/write'">문의작성</button>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>