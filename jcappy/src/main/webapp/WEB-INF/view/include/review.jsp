<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/jcappy/js/starrating.js"></script>
<link rel="stylesheet" type="text/css" href="/jcappy/css/starrating.css" />
<div>
	<ul>
		<c:forEach var="vo" items="${list }">
			<li>
				<div class="review_content">
					<div class="review_score" id="review_score">${vo.rstar }</div>
					<div class="review_title">${vo.rtitle }</div>
					<div class="review_context">
						${vo.rcontent }
					</div>
					<c:if test="${!empty vo.rfile_org }">
						<div class="review_img" style="background-image: url('${pageContext.servletContext.contextPath }/upload/${vo.rfile_real }');"></div>
					</c:if>
				</div>
				<div class="review_info">
					<div>작성자 ${vo.mname }</div>
					<div>작성일 <fmt:formatDate value="${vo.rregdate }" pattern="yyyy-MM-dd hh:mm:ss"/></div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
<div id="img_detail_area">
	<div class="img_detail"></div>
</div>