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
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/r1.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/r2.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/r3.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <h1 class="cstyle_h1">에어컨</h1>
                <div class="flex">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/a1.png">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/a2.png">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/a3.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <div class="title">
                    <h1>TV</h1>
                </div>
                <div class="flex">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/t1.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/t2.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/t3.webp">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="all_view_btn cstyle_btn" onclick="location.href'/jcappy/product/index.do">all view</button>
                </div>
            </div>

            <div class="main_content">
                <h1 class="cstyle_h1">세탁기</h1>
                <div class="flex">
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/w1.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/w2.jpg">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
                    <div class="item cstyle_border_gray">
                        <a href="/jcappy/product/detail.do">
                            <img src="/jcappy/img/w3.png">
                            <span>상품명</span>
                            <span>100,000</span>
                        </a>
                    </div>
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