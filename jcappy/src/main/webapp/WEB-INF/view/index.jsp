<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="banner">
                <div class="swiper-container swiper">
                    <div class="swiper-wrapper swiper_area">
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img1.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img2.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img3.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img4.jpg)" ></div>
                    </div>
                    <div class="swiper_content">
                        <div class="btn_area">
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">냉장고</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${rList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <span class="image" style="background-image: url('${productVo.pimg1_org }');"></span>
                            <span class="name">${productVo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${productVo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>

                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">에어컨</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${aList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <span class="image" style="background-image: url('${productVo.pimg1_org }');"></span>
                            <span class="name">${productVo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${productVo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">TV</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${tList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <span class="image" style="background-image: url('${productVo.pimg1_org }');"></span>
                            <span class="name">${productVo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${productVo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">세탁기</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${wList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <span class="image" style="background-image: url('${productVo.pimg1_org }');"></span>
                            <span class="name">${productVo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${productVo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>