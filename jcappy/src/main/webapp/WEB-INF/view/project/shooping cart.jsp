<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/jcappy/css/reset.css"/>
    <title>장바구니</title>
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
          .header {
              text-align: center; 
              font-size: 40px;
              font-weight: bold;
              padding: 30px;
              background-color: #d8d8d8;
          }
          .t {
              margin-left:auto; 
              margin-right:auto;
              border:1px; 
              text-align: center;
          } 
  
          .t1{
              background-color: honeydew;
          }
          .t > thead > tr >th {
              border-collapse : collapse;
              border : 1px solid black;
          }
          .t2 > tr > td {
              border-collapse : collapse;
              border : 1px solid black;
          }
          input[type=button] {
              background-color: silver;
          }
          #b1 {
              width:100pt;
              height:60pt;
              background-color: gold;
          }
          #b2 {
              width:100pt;
              height:60pt;
              background-color: gray;
          }
          #bb {
              width: 40px;
              height: 22px;
          }
          #moins {
              width: 22px;
              height: 22px;
          }
          #plus {
              width: 22px;
              height: 22px;
          }
          .p1 {
              float: left;
          }
          .p2 {
              padding: 50px;
              text-align: center;
          }
          .footer {
              text-align: center;
              font-size: 40px;
              font-weight: bold;
              padding: 30px;
              background-color: #d8d8d8;
              clear: both;
          }
  </style>
    <script>
        function plus(){
            alert('숫자는 커지고 커진만큼 금액도 바꿔!!')
        }
        function minus(){
            alert('숫자는 작아지고 작아진만큼 금액도 바꿔!!')
        }
   </script>
    </head>
<body>
    <div class="wrap">
        <div class="header">
            HEADER
        </div>
            <table class="t">
                <caption>장바구니</caption> 
                <thead class="t1">
                    <tr>
                        <th>전체선택</th>
                        <th>날짜</th>
                        <th>상품명</th> 
                        <th>판매가</th>
                        <th>배송비</th>
                        <th>수량</th>
                        <th>주문금액</th>
                        <th>주문관리</th>
                    </tr>
                </thead>
                <tbody class="t2">
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>2021.02.30</td>
                        <td>냉장고101</td>
                        <td>1,000,000</td>
                        <td>무료</td>
                        <td><div id="input_div">
                            <input type="button" value="-" id="moins" onclick="minus()">
                            <input type="text" size="1" value="1" id="count">
                            <input type="button" value="+" id="plus" onclick="plus()">
                        </div>
                        </td>
                        <td>1,000,000</td>
                        <td><div id="input_div">
                            <input type="button" id="bb" value="삭제">
                        </div></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>2021.05.05</td>
                        <td>세탁기302</td>
                        <td>1,600,000</td>
                        <td>무료</td>
                        <td><div id="input_div">
                            <input type="button" value="-" id="moins" onclick="minus()">
                            <input type="text" size="1" value="1" id="count">
                            <input type="button" value="+" id="plus" onclick="plus()">
                        </div>
                        </td>
                        <td>3,200,000</td>
                        <td><div id="input_div">
                            <input type="button" id="bb" value="삭제">
                        </div></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>2021.05.25</td>
                        <td>에어컨211</td>
                        <td>2,000,000</td>
                        <td>무료</td>
                        <td><div id="input_div">
                            <input type="button" value="-" id="moins" onclick="minus()">
                            <input type="text" size="1" value="1" id="count">
                            <input type="button" value="+" id="plus" onclick="plus()">
                        </div>
                        </td>
                        <td>2,000,000</td>
                        <td><div id="input_div">
                            <input type="button" id="bb" value="삭제">
                        </div></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>2021.06.22</td>
                        <td>냉장고105</td>
                        <td>3,500,000</td>
                        <td>무료</td>
                        <td><div id="input_div">
                            <input type="button" value="-" id="moins" onclick="minus()">
                            <input type="text" size="1" value="1" id="count">
                            <input type="button" value="+" id="plus" onclick="plus()">
                        </div>
                        </td>
                        <td>3,500,000</td>
                        <td><div id="input_div">
                            <input type="button" id="bb" value="삭제">
                        </div></td>
                    </tr>
                </tbody>
            </table><br>
            <div class="p1">
                <p>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</p>
                <p>JCAPPY는 기본적으로 전 상품 무료 배송입니다.</p>
                <p>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</p>
                <p>2개 이상 브랜드를 주문하신 경우, 각각 개별 배송됩니다.</p>
                <p>장바구니에 담은 시점과 현재의 판매 가격이 달라질 수 있습니다.</p>
                <p> 결제 시 각종 할인 적용이 달라질 수 있습니다.</p>
                <p>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존 주문 합산)</p>
            </div>
            <div class="p2">
                <input id="b1" type=button value="계속 쇼핑하기">
                <input id="b2" type=button onclick="location.href='payment.html';" value="주문하기">
            </div>
        <div class="footer">
            FOOTER
        </div>
    </div>
</body>
</html>