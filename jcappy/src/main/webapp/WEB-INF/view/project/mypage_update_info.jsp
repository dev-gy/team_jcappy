<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="/jcappy/js/mypage_update_info.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_update_info.css">
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
                <p class="subtitle">정보수정</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 내정보수정 -->
            <div>
                <div class="updateinfotable">
                    <form action="" method="POST">
                        <div>
                            <table class="updateinfotable_1">
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input class="pwd1" type="password" name="pwd"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호확인</td>
                                    <td><input class="pwd2" type="password" name="pwd"></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="updateinfotable_2">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" name="name" value=""></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="updateinfotable_3">
                                <tr>
                                    <td>연락처</td>
                                    <td><input type="text" name="name" value=""></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="updateinfotable_4">
                                <tr>
                                    <td>주소</td>
                                    <td><input type="text" name="name" value=""></td>
                                </tr>
                                <tr>
                                    <td>상세주소</td>
                                    <td><input type="text" name="name" value=""></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="updateinfotable_5">
                                <tr>
                                    <td><div onclick="back();">취소</div></td>
                                    <td><div class="btn" onclick="submit();">수정</div></td>
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