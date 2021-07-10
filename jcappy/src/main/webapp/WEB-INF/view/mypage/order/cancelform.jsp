<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/jcappy/js/mypage_ordercancel_form.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_ordercancel_form.css">
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
                <p class="subtitle">취소/교환/반품</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 취소/교환/반품 사유 작성 -->
            <div>
                <div class="order_cancel">
                    <form action="" method="POST">
                        <div>
                            <div>취소/교환/반품 사유</div>
                            <div>
                                <select>
                                    <option name="cancel_type" value="0" selected>선택해주세요.</option>
                                    <option name="cancel_type" value="1">취소</option>
                                    <option name="cancel_type" value="2">교환</option>
                                    <option name="cancel_type" value="3">반품</option>
                                </select>
                            </div>
                            <div><textarea name="cancel_content" class="cancel_content" placeholder="취소/교환/반품을 요청하는 간단한 사유를 작성해주세요."></textarea></div>
                        </div>
                        <div>
                            <table class="order_canceltable">
                                <tr>
                                    <td><div onclick="cancel_back();">취소</div></td>
                                    <td><div onclick="cancel_submit();">작성</div></td>
                                </tr>
                            </table>
                        </div>
                    </form>
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