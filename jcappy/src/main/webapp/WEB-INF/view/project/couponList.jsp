<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>쿠폰 리스트</title>
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
            table {
            margin-left:auto; 
            margin-right:auto;
            width: 1200px;
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
    <body>
        <div  class="wrap">
            <div class="coupon">적용 가능 쿠폰 리스트</div><br>
            <div class="a">
                <p>해당 상품에 적용 가능한 쿠폰 입니다. 쿠폰을 선택해주세요.</p><br>
                <table id="coupon">
                    <thead>
                        <tr>
                            <th>쿠폰명</th>
                            <th>할인 금액</th> 
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>생일축하합니다!!</td>
                            <td>10,000</td>
                            <td><input type="checkbox"></td>
                        </tr> 
                        <tr>
                            <td>5월 개근상!!</td>
                            <td>5,000</td>
                            <td><input type="checkbox"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
                <input type="button" value="쿠폰 적용" onClick="location.href='payment.html'">
        </div>
    </body>
</html>