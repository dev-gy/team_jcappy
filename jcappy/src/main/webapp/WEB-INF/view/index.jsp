<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script src="/jcappy/js/index.js"></script>
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
            <div class="content">
                <div class="title">
                    <h1>냉장고</h1>
                </div>
                <div class="grid">
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/r1.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/r2.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/r3.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="cstyle_btn">all view</button>
                </div>
            </div>

            <div class="content">
                <div class="title">
                    <h1>에어컨</h1>
                </div>
                <div class="grid">
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/a1.png">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/a2.png">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/a3.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="cstyle_btn">all view</button>
                </div>
            </div>

            <div class="content">
                <div class="title">
                    <h1>TV</h1>
                </div>
                <div class="grid">
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/t1.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/t2.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/t3.webp">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="cstyle_btn">all view</button>
                </div>
            </div>

            <div class="content">
                <div class="title">
                    <h1>세탁기</h1>
                </div>
                <div class="grid">
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/w1.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/w2.jpg">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                    <div class="item">
                        <a href="">
                            <img src="/jcappy/img/w3.png">
                            <p>상품명</p>
                            <p>100,000</p>
                        </a>
                    </div>
                </div>
                <div>
                    <button class="cstyle_btn">all view</button>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>