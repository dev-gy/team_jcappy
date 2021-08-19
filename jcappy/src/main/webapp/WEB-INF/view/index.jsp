<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="banner">
                <div class="swiper-container swiper">
                    <div class="swiper-wrapper swiper_area">
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img1-1.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img2-1.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img3-1.jpg)" ></div>
                        <div class="swiper-slide" style="background-image: url(/jcappy/img/img4-1.jpg)" ></div>
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
                        <a href="/jcappy/product/detail/${vo.pno }">
                            <span class="image" style="background-image: url('${vo.pimg1_real }');"></span>
                            <span class="name">${vo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>

                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href='/jcappy/product/refrigerator'">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">에어컨</h1>
                </div>
                <div class="flex">
                <c:forEach var="vo" items="${aList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail/${vo.pno }">
                            <span class="image" style="background-image: url('${vo.pimg1_real }');"></span>
                            <span class="name">${vo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href='/jcappy/product/airconditioner'">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">TV</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${tList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail/${vo.pno }">
                            <span class="image" style="background-image: url('${vo.pimg1_real }');"></span>
                            <span class="name">${vo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href='/jcappy/product/tv'">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1 class="cstyle_h1">세탁기</h1>
                </div>
                <div class=" flex">
                <c:forEach var="vo" items="${wList }">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail/${vo.pno }">
                            <span class="image" style="background-image: url('${vo.pimg1_real }');"></span>
                            <span class="name">${vo.pname }</span>
                            <span class="price"><fmt:formatNumber maxFractionDigits="3" type="number" value="${vo.pprice }"/>원</span>
                        </a>
                    </div>
                </c:forEach>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href='/jcappy/product/washer'">all view</button>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>