<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/jcappy/js/mypage_orderdetail.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_orderdetail.css">
</head>

<body>
    <!-- 헤더 -->
    <div class="header">
        <p>HEADER</p>
    </div>
    <div class="mypage_wrap">
        <!-- 마이페이지 헤더 -->
        <div id="myheader">
            <span class="myinfo">손흥민</span> 회원님의 등급은 <span class='myinfo'>VIP</span>입니다.
        </div>
        <!-- 서브메뉴 -->
        <div id='submenu'>
            <ul>
                <li><a href="mypage_main.do">주문조회</a></li>
                <li><a href="mypage_update_info.do">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="mypage_ordercancel.do">취소/교환/반품</a></li>
                <li><a href="javascript:del();" >회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">주문상세정보</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 주문상세정보 -->
            <div>
                <!-- 주문번호, 주문날짜, 배송상태 -->
                <div>
                    <table class="detailtable_1">
                        <colgroup>
                            <col class="col_color">
                            <col>
                            <col class="col_color">
                            <col>
                            <col class="col_color">
                            <col>
                        </colgroup>
                        <tr>
                            <td>주문번호</td>
                            <td>9999</td>
                            <td>주문날짜</td>
                            <td>2021-05-05</td>
                            <td>배송상태</td>
                            <td><div>상품준비중</div></td>
                        </tr>
                    </table>
                </div>
                <!-- 주문상품 -->
                <div>
                    <table class="detailtable_2">
                        <colgroup>
                            <col>
                            <col class="col_color">
                            <col>
                            <col class="col_color">
                            <col>
                        </colgroup>
                        <tr>
                            <td class="detail_title">상품</td>
                            <td class="detail_title">수량</td>
                            <td class="detail_title">상품금액</td>
                            <td class="detail_title">합계</td>
                        </tr>
                        <tr>
                            <td><a href=""><img src="/jcappy/img/냉장고.jpg"></a>냉장고1</td>
                            <td>1</td>
                            <td>1,000,000</td>
                            <td>1,000,000</td>
                            <td><a href=""><div class="mypage_order_review col_color">리뷰작성</div></a></td>
                        </tr>
                        <tr>
                            <td><a href=""><img src="/jcappy/img/냉장고.jpg"></a>에어컨1</td>
                            <td>2</td>
                            <td>1,000,000</td>
                            <td>2,000,000</td>
                            <td><a href=""><div class="mypage_order_review col_color">리뷰작성</div></a></td>
                        </tr>
                        <tr>
                            <td><a href=""><img src="/jcappy/img/냉장고.jpg"></a>세탁기1</td>
                            <td>2</td>
                            <td>1,000,000</td>
                            <td>2,000,000</td>
                            <td><a href=""><div class="mypage_order_review col_color">리뷰작성</div></a></td>
                        </tr>
                    </table>
                </div>
                <!-- 배송지 정보 -->
                <div>
                    <table class="detailtable_3">
                        <colgroup>
                            <col class="col_color">
                            <col>
                        </colgroup>
                        <tr>
                            <td colspan="2">배송지 정보</td>
                        </tr>
                        <tr>
                            <td>받는사람</td>
                            <td>이강인</td>
                        </tr>
                        <tr>
                            <td>연락처</td>
                            <td>123-456-789</td>
                        </tr>
                        <tr>
                            <td>받는주소</td>
                            <td>경기도 고양시 일산서구</td>
                        </tr>
                        <tr>
                            <td>배송메시지</td>
                            <td>빠른 배송 희망</td>
                        </tr>
                    </table>
                </div>
                <!-- 결제 정보 -->
                <div>
                    <table class="detailtable_4">
                        <colgroup>
                            <col class="col_color">
                            <col>
                        </colgroup>
                        <tr>
                            <td colspan="2">결제정보</td>
                        </tr>
                        <tr>
                            <td>결제수단</td>
                            <td>신용카드</td>
                        </tr>
                        <tr>
                            <td>총 결제금액</td>
                            <td>5,000,000</td>
                        </tr>
                    </table>
                </div>
                <!-- 취소/교환/반품 요청 -->
                <div>
                    <div class="detailtable_5 col_color" onclick="order_cancel();">취소/교환/반품 요청</div>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터 -->
    <div class="footer">
        <p>FOOTER</p>
    </div>
</body>

</html>