<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/jcappy/js/mypage_main.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_main.css">
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
                <p class="subtitle">주문내역조회</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 주문조회 -->
            <div>
                <table class="ordertable">
                    <colgroup>
                        <col>
                        <col class="col_color">
                        <col>
                        <col class="col_color">
                        <col>
                    </colgroup>
                    <tr>
                        <td>주문번호</td>
                        <td>주문상품</td>
                        <td>총주문금액</td>
                        <td>주문날짜</td>
                        <td>배송상태</td>
                    </tr>
                    <tr>
                        <td><a href="mypage_orderdetail.do"><div>9999</div></a></td>
                        <td>냉장고 외1건</td>
                        <td>10,000,000원</td>
                        <td>2021-05-05</td>
                        <td>상품준비중</td>
                    </tr>
                    <tr>
                        <td><a href=""><div>8888</div></a></td>
                        <td>세탁기 외2건</td>
                        <td>10,000,000원</td>
                        <td>2021-05-05</td>
                        <td>배송준비중</td>
                    </tr>
                    <tr>
                        <td><a href=""><div>7777</div></a></td>
                        <td>에어컨</td>
                        <td>1,000,000원</td>
                        <td>2021-05-05</td>
                        <td>배송완료</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- 푸터 -->
    <div class="footer">
        <p>FOOTER</p>
    </div>
</body>

</html>