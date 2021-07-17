<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>

<style>
 .cva {
            margin: 0 auto;
            width: 1200px;
            overflow: hidden;
        }
        .left1 {
            width: 360px;
            float: left;
            margin-left: 250px;
        }
        .right1 {
            width: 250px;
            float: right;     
            margin-right: 250px;    
            margin-top: 200px;
        }
        img {
            width: 50px;
            height: 50px;   
            vertical-align: middle ;
        }
        .product {
            text-align: center;
        }
        .pay{
                padding: 30px;
                font-weight: bolder;
                font-size: 32px;
                text-align: center;
            }
            .shop {
                font-size: 20px;
                font-weight: bolder;
            }
            .shop2 {
                font-size: 20px;
                font-weight: bolder;
            }
            .couname {
                font-size: 20px;
                font-weight: bolder;
            }
            table {
                width: 100%;
            }
            table, th, td {
                border: 1px solid #bcbcbc;
                text-align: left;
            }
            input[type=text]{
                color: rgb(94, 94, 94);
            }
            #wid {
                width: 300px;
            }
            .co1{
                text-align: left;
            }
            #cash {
                font-size:16px;
                text-align: left;
            }
            #cash1 {
                font-size:16px;
                right: 20px;
                text-align: right;
            }
            .payment {
                text-align: center;
            }
            #ppay {
                width:100px;
                height:50px;
                font-size:18px; 
            }
</style>

</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">

			<div class="cva">
		        <div class="pay">결제하기</div><br>
		        <div class="left1">
		        <div class="shop">주문상품 정보</div><br>
		        <img src="/jcappy/img/fridge.jpg">
		        <span class="product">냉장고 101
		            <div><br></div>
		            <span>1,000,000원</span>
		            <div><br></div>
		        </span>
		        <img src="/jcappy/img/laun.jsp.jpg">
		        <span class="product">세탁기 302
		            <div><br></div>
		            <span>1,600,000원</span>
		            <div><br></div>
		        </span>
		        <div class="shop">주문자 정보</div><br>
		            <div class="co1">
		            <p>홍길동</p>
		            <p>010-1234-5678</p>
		            <p>hong.gmail.com</p>
		            </div><br>
		            <div class="shop">배송 정보<br><br>
		                <input type="text" value="이름을 입력해주세요">
		                <input type="text" value="전화번호를 입력해주세요"><br><br>
		                <input type="text" value="주소를 입력해주세요">
		                <input type=button value="주소 찾기"><br>
		                <input type="text" id="wid" value="주소를 입력해주세요"><br>
		                <input type="text" id="wid"><br>  
		            </div><br>
		            <div class="couname">쿠폰</div><br>
		            <div class="coupon">
		                <table>
		                    <thead>
		                    </thead>
		                    <tbody>
		                        <tr>
		                        <th>상품 할인</th>
		                        <td>0원</td>
		                        </tr>
		                        <tr>
		                        <th>회원 할인</th>
		                        <td>18000원</td>
		                        </tr>
		                        <tr>
		                        <th>쿠폰 할인</th>
		                        <td><input type="button" value="쿠폰적용" onClick="location.href=/project/couponList.do"></td>
		                        </tr>
		                        <tr>
		                            <th>할인 합계</th>
		                            <td>18000원</td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		        <div class="right1">
		            <div class="size">
		                <div class="shop2">최종 결제금액</div><br>
		                <span id="cash">상품 가격</span> <span id="cash1">2,600,000원</span><br><br>
		                <span id="cash">배송비</span> <span id="cash1">0원</span><br><br><hr><br>
		                <span id="cash">최종 결제 금액</span> <span id="cash1">2,600,000원</span><br>
		            </div>
		            <div class="size"><br>
		                <form name="form">
		                    <div class="shop2">결제 방법</div><br><br>
		                        <div class="payment">
		                            <input type=radio name="money" checked>신용카드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                            <input type=radio name="money">계좌이체<br><br><br>
		                            <input type="checkbox" name="agree" onClick="agreeCheck(this.form)"> 구매조건 확인 및 결제 진행에 동의<br><br><br>
		                            <input type="button" name="checkButton" value="결제하기" onClick="location.href='paycomplete.html'" disabled>
		                        </div>
		                    </form> 
		                </div>
		            </div>
		        </div>

        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>