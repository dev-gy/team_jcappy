<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>쿠폰목록</title>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        /* 마이페이지 기본 틀 */
        .mypage_wrap * {box-sizing: border-box; color: rgb(48, 48, 48);}

        /* 전체, 헤더 푸터 */
        .mypage_wrap {width: 1200px; margin: 0 auto;}
        .header {text-align: center; font-size: 40px; font-weight: bold; padding: 30px; background-color: #d8d8d8;}
        .footer {text-align: center; font-size: 40px; font-weight: bold; padding: 30px; background-color: #d8d8d8; clear: both;}
        
        /* 고객이름, 등급출력 부분 */
        #myheader {font-size: 40px; font-weight: bold; text-align: center; padding: 30px;}
        .myinfo {font-size: 50px;}
        
        /* 왼쪽 메뉴 */
        #submenu {font-weight: bold; width: 20%; height: 100%; font-size: 30px; padding: 15px; float: left; border: 1px solid black; border-radius: 30px; margin-bottom: 135px;}
        #submenu li {width: 100%; text-align: center; padding-top: 15px; padding-bottom: 15px;}
        #content {width: 80%; padding: 30px; float: left;}
        
        /* 왼쪽 메뉴 타이틀 */
        .subtitle {font-size: 30px; font-weight: bold; margin-bottom: 120px;}

        /* 테이블 컬럼 컬러 */
        .col_color {background-color: #eeeeee;}
        
        /* 마이페이지 주문조회 */
        .ordertable {margin-top: 50px; width: 100%; text-align: center; table-layout: fixed; white-space: nomypage_wrap;}
        .ordertable td {padding: 5px; font-size: 15px; overflow: hidden; text-overflow: ellipsis;}
        .ordertable tr {border-bottom: 1px solid #2a2a2a; }
        .ordertable tr:first-child {border-bottom: 2px solid #2a2a2a;}
        .ordertable tr:last-child {border-bottom: none;}
        .ordertable tr:nth-child(1) td {font-size: 23px; font-weight: bold;}
        .ordertable tr:nth-child(1) td:nth-child(1) {width: 15%;}
        .ordertable tr:nth-child(1) td:nth-child(2) {width: 30%;}
        .ordertable tr:nth-child(1) td:nth-child(3) {width: 25%;}
        .ordertable tr:nth-child(1) td:nth-child(4) {width: 15%;}
        .ordertable tr:nth-child(1) td:nth-child(5) {width: 15%;}

        table {
            margin-left:auto; 
            margin-right:auto;
            width: 100%;
        }
        
        table, td, th {
            border-collapse : collapse;
            border : 1px solid black;
        }
        .coupon {
            font-weight: bold;
            font-size: 32px;
            height: 100px;
            
        }
        .a {
            height: 200px;
        }
        #coupon {
            border:1px;
            text-align: center;
        }
        input[type=button] {
            text-align: center;
            width: 100px;
            height: 30px;
            margin-left: 550px;
            background-color: gold;
        }
    </style>

    <script>
        function del() {
            if (confirm('정말 탈퇴 하시겠습니까?\n고객님의 아이디, 비밀번호, 구매내역 등\n모든 정보가 사라집니다.')) {
                location.href="";
            }
        }
    </script>
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
                <li><a href="mypage_main.html">주문조회</a></li>
                <li><a href="mypage_update_info.html">정보수정</a></li>
                <li><a href="">쿠폰함</a></li>
                <li><a href="">1:1문의</a></li>
                <li><a href="mypage_ordercancel.html">취소/교환/반품</a></li>
                <li><a href="javascript:del();" >회원탈퇴</a></li>
            </ul>
        </div>
        <!-- 본문 -->
        <div id="content">
            <!-- 서브메뉴 타이틀 -->
            <div class="subheader">
                <p class="subtitle">쿠폰함</p>
            </div>
            <!-- 서브메뉴 본문 -->
            <!-- 주문조회 -->
            <div>
                <table id="coupon">
                    <thead>
                        <tr>
                            <th>쿠폰명</th>
                            <th>할인 금액</th> 
                            <th>유효기간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>생일축하합니다!!</td>
                            <td>10,000</td>
                            <td>~2021-08-31</td>
                        </tr> 
                        <tr>
                            <td>5월 개근상!!</td>
                            <td>5,000</td>
                            <td>~2021-07-30</td>
                        </tr>
                    </tbody>
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