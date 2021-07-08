<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <style>
        .review_detail_wrap *{
            box-sizing: border-box;
        }
        .review_detail_wrap{
            width:1200px;
            margin:0 auto;
        }
        .review_detail_link{
            margin:100px 0 0 0;
            font-size: 20px;
        }
        .review_detail_title {
            font-size: 40px;
            font-weight: bold;
        }
        .review_detail_id {
            margin:50px 0 0 0;
            font-size: 25px;
        }
        .review_detail_day {
            font-size:20px;
        }
        .review_detail_product {
            width:400px;
            height:100px;
            margin: 50px 0 0 0;
        }
        .product_img {
            float:left;
            width:100px;
            height:100px;
        }
        .product_img > a > img {
            width:100px;
            height:100px;
        }
        .product_name {
            float:left;
            width:300px;
            font-size:20px;
            display: block;
        }
        .review_detail_star{
            float: left;
            display: block;
            width:300px;
            height:70px;
        }
        .review_detail_star > img {
            width:300px;
            height:70px;
        }
        .review_detail_content > .review_detail_img {
            margin: 0 auto;
           
        }
        .review_detail_content > .review_detail_img > img{
            width:900px; 
            height:500px;
           
        }
        .list_button {
            margin:50px 0 0 0;
        }
        #list_btn {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
        }
    </style>
    <script>
        $(function(){
            $('#btn').click(function(){
                
                location.href="";
                
            });
        });
    </script>
</head>
<body>
    <div class="review_detail_wrap">
        <div class="review_detail_link">
            <a href="">home</a>-<a href="">review</a>
        </div>
        <div class="review_detail_title">Review</div>
        <div class="review_detail_id">회원아이디</div>
        <div class="review_detail_day">작성일(2021-7-1)</div>
        <div class="review_detail_product">
            <div class="product_img"><a href=""><img src="/jcappy/img/w1.jpg"></a></div>
            <a href=""><div class="product_name">상품명</div></a>
            <div class="review_detail_star"><img src="/jcappy/img/star1.png"></div>
        </div>
        <div class="review_detail_content">
            <div class="review_detail_img">
                <img src="/jcappy/img/r1.jpg">
                <img src="/jcappy/img/r2.jpg">
            </div>
            <div class="review_content">상품 잘 받았습니다. 배송도 빨라서 좋았어요</div>
            
        </div>
        <div class="list_button">
            <input type="button" value="목록" id="list_btn"> 
        </div>
    </div>
</body>
</html>