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
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <style>
        .mainpage_wrap * {
            box-sizing:border-box;
        }
        .mainpage_wrap{
            width:1200px;
            margin: 0 auto;
        }
        .swiper{
            width:100%;
            height: 500px;
           
        }
        .swiper-container {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .product_img{
            float:left;
            margin:50px 50px;
            width:300px;
            height:400px;
            border:1px solid black;
            
        }
        .product_img > a > img{
            width:298px;
            height:300px;
        }   
        .product_img > a > p{
            text-align:center;
        } 
        .mainpage_product > .all_view {
            text-align:center;
        }
        #all_view_btn1 {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
        }
        #all_view_btn2 {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
        }
        #all_view_btn3 {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
        }
        #all_view_btn4 {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
        }


    </style>
    <script>
       $(function(){
            $('#all_view_btn1').click(function(){
                location.href='';
            });
            $('#all_view_btn2').click(function(){
                location.href='';
            });
            $('#all_view_btn3').click(function(){
                location.href='';
            });
            $('#all_view_btn4').click(function(){
                location.href='';
            });
        });
    </script>
</head>
<body>
    <div class="mainpage_wrap">
        <div class="swiper">
            <!-- Swiper -->
            <div class="swiper-container mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="/jcappy/img/img1.jpg"></div>
                    <div class="swiper-slide"><img src="/jcappy/img/img2.jpg"></div>
                    <div class="swiper-slide"><img src="/jcappy/img/img3.jpg"></div>
                    <div class="swiper-slide"><img src="/jcappy/img/img4.jpg"></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
    
            <!-- Swiper JS -->
            <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    
            <!-- Initialize Swiper -->
            <script>
                var swiper = new Swiper(".mySwiper", {
                    spaceBetween: 30,
                    centeredSlides: true,
                    autoplay: {
                        delay: 2500,
                        disableOnInteraction: false,
                    },
                    pagination: {
                        el: ".swiper-pagination",
                        clickable: true,
                    },
                    navigation: {
                        nextEl: ".swiper-button-next",
                        prevEl: ".swiper-button-prev",
                    },
                });
            </script>
        </div>
        <div class="mainpage_content">
            <div class="mainpage_product">
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/r1.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/r2.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/r3.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="all_view">
                    <input type="button" id="all_view_btn1" value="all view">
                </div>
            </div>
            <div class="mainpage_product">
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/a1.png"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/a2.png"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/a3.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="all_view">
                    <input type="button" id="all_view_btn2" value="all view">
                </div>
            </div>
            <div class="mainpage_product">
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/t1.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/t2.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/t3.webp"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="all_view">
                    <input type="button" id="all_view_btn3" value="all view">
                </div>
            </div>
            <div class="mainpage_product">
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/w1.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/w2.jpg"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="product_img">
                    <a href=""><img src="/jcappy/img/w3.png"></a>
                    <a href=""><p>상품명</p></a>
                    <a href=""><p>100,000</p></a>
                </div>
                <div class="all_view">
                    <input type="button" id="all_view_btn4" value="all view">
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>