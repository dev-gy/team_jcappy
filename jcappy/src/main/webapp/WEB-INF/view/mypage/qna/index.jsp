<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/mypage_qna.css">
</head>

<body>
    <div class="wrap">
        <!-- 헤더 -->
        <div class="header">
            <p>HEADER</p>
        </div>
        <!-- 마이페이지 헤더 -->
        <div id="myheader">
            <span class="myinfo">손흥민</span> 회원님의 등급은 <span class='myinfo'>VIP</span>입니다.
        </div>
        <!-- 서브메뉴 -->
        <div id='submenu'>
            <ul>
                <li><a href="">주문조회</a></li>
                <li><a href="">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="">취소, 반품</a></li>
                <li><a href="">회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 서브메뉴 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">1:1 문의내역</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <div>
                <table class="qna_table">
                    <colgroup>
                        <col width="80px">
                        <col width="500px">
                        <col width="120px">
                        <col width="100px">
                    </colgroup>
                    <thead>
                        <tr>
                            <td scope="col" class="qna_header_content td_center">번호</td>
                            <td scope="col" class="qna_header_content td_center">제목</td>
                            <td scope="col" class="qna_header_content td_center">날짜</td>
                            <td scope="col" class="qna_header_content td_center">처리상태</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="qna_item">
                            <td class="qna_item_no td_center">2</td>
                            <td class="qna_item_title"><a href="">회원정보수정요청</a></td>
                            <td class="qna_item_cre_date td_center">2021-05-27 16:00</td>
                            <td class="td_center">
                                <div class="qna_item_state">처리완료</div>
                                <div><a href="">수정</a> / <a href="">삭제</a><div>
                                </td>
                                
                            </tr>
                            <tr class="qna_item">
                            <td class="qna_item_no td_center">1</td>
                            <td class="qna_item_title"><a href="">회원정보수정요청</a></td>
                            <td class="qna_item_cre_date td_center">2021-05-27 16:00</td>
                            <td class="td_center">
                                <div class="qna_item_state">접수대기</div>
                                <a href="">수정</a> / <a href="">삭제</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <input class="qna_write_btn" type="button" value="문의작성">
                </div>
            </div>
        </div>
        <div class="footer">
            <p>FOOTER</p>
        </div>
    </div>
</body>

</html>