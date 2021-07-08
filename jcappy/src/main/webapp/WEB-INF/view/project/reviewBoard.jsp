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
        .review_board_wrap *{
            box-sizing: border-box;
        }
        .review_board_wrap{
            
            width:1200px;
            margin:0 auto;
        }
        .review_board_link{
            margin:100px 0 0 0;
            font-size: 20px;
        }
        .review_board_title {
            font-size: 40px;
            font-weight: bold;
        }
        .review_table {
            width:300px;
            height: 400px;
            float:left;
            text-align: center;
            margin:50px 50px;
            border:1px solid black;
        }
        .review_table > a > img {
            width:298px;
            height:250px;
        }
        .review_table > .day {
            text-align: right;
        }
        .product_img  {
            float:left;
        }
        .product_img > a > img {
            width:50px;
            height:75px;
        }
        .review_board_star {
            
            display: block;
        }
        .review_board_star > img {

            width:200px;
            height:50px;
        }
        .review_table_footer > a > p {
            display: block;
            width:350px;
            height:25px;
            text-align:left;
            line-height: 25px;
        }
        .page_navigation{
            text-align:center;
            font-weight: bold;
            font-size:30px;
        }

    </style>
</head>
<body>
    <div class="review_board_wrap">
        <div class="review_board_link">
            <a href="">home</a>-<a href="">review</a>
        </div>
        <div class="review_board_title">Review</div>
        <div class="review_board_content">
            <div class="review_table">
                <a href=""><img src="/jcappy/img/a1.png"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/a1.png"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/a2.png"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/a2.png"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/a3.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/a3.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/r1.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/r1.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/r2.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/r2.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/r3.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/r3.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/t1.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/t1.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/t2.jpg"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/t2.jpg"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
            <div class="review_table">
                <a href=""><img src="/jcappy/img/t3.webp"></a>
                <a href=""><p>리뷰 내용</p></a>
                <p class="day">2021-7-1</p>
                <div class="review_table_footer">
                    <div class="product_img"><a href=""><img src="/jcappy/img/t3.webp"></a></div>
                    <a href=""><p >상품명</p></a>
                    <div class="review_board_star"><img src="/jcappy/img/star1.png"></div>
                </div>
            </div>
        </div>
        <a href=""><div class="page_navigation">< 1 2 3 4 ></div></a>
    </div>
</body>
</html>