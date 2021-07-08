<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>결제완료</title>
    <link rel="stylesheet" href="/jcappy/css/reset.css"/>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .wrap{
            width: 1200px;
            margin: 0 auto;
        }
        .pay {
            margin: 150px;
            font-weight: bold;
            font-size: 32px;
            text-align: center;
        }
        p {
            font-size: 16px;
            text-align: center;
            height: 100px;
        }
        #cb1 {
            width: 75px;
            height: 25px;
            margin-left: 510px;
            background-color: gold;
        }
        #cb2 {
            width: 50px;
            height: 25px;
            margin-left: 50px; 
            background-color: gray;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <div class="pay">결제완료</div><br>
        <p>신용카드로 결제가 완료되었습니다!</p><br>
            <input id="cb1" type="button" value="주문내역">
            <input id="cb2" type="button" value="닫기">
    </div>
</body>
</html>