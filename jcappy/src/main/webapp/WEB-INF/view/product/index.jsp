<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>

<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<div class="menu_content">
				<div class="itemList_thema" style="background-image: url('/jcappy/img/냉장고 대표.jpg');">
					<a href="/jcappy/product/${type }">${vo.fval }</a>
				</div>
				<div class="cate_menu">
					<div class="cstyle_btn"><a href="/jcappy/product/${type }/a">${vo.pcate }</a></div>
					<div class="cstyle_btn"><a href="/jcappy/product/${type }/b">${vo.pcate }</a></div>
					<div class="cstyle_btn"><a href="/jcappy/product/${type }/c">${vo.pcate }</a></div>
				</div>
			</div>
			<form id="searchForm" method="POST" action="/jcappy/product/${type }">
				<p class="itemList_count">냉장고 32(총 개수)</p>
				<div class="itemList_search">
					<select name="orderby" onchange="$('#searchForm').submit();">
						<option value="popular" <c:if test="${vo.orderby == 'popular' && vo.direct == 'DESC' }">selected</c:if>>인기순</option>
						<option value="pprice" <c:if test="${vo.orderby == 'pprice' && vo.direct == 'DESC' }">selected</c:if>>가격 높은순</option>
						<option value="pprice" <c:if test="${vo.orderby == 'pprice' && vo.direct == 'ASC' }">selected</c:if>>가격 낮은순</option>
					</select>
					<input type="hidden" name="direct" value="${vo.direct }">
					
					<input type="text" name="sval" value="${vo.sval }" placeholder="검색어를 입력해주세요.">
					<input type="hidden" name="fval" value="${vo.fval }">
					<button class="cstyle_btn" type="submit">검색</button>
				</div>
			</form>
			<div class="product_content">
				<div class="flex">
				<c:forEach var="vo" items="${list }">
					<div class="item cstyle_border_gray">
						<a href="/jcappy/product/detail">
                            <span class="image" style="background-image: url('${vo.pimg1_org }');"></span>
                            <span class="name">${vo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.pprice }"/>원</span>
                        </a>
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="itemList_pageing">
				페이징 처리<br> 12345
			</div>
		</div>

	<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>