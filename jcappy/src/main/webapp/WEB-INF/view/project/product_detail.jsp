<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세페이지</title>
    <link rel="stylesheet" href="/jcappy/css/reset.css">

    <style>
         .itemInfo_wrap {
            width: 1200px; /*넓이*/
            margin: 0 auto; /*가운데 정렬*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .header{
            border: 1px solid #000000;
            padding: 50px;
            text-align: center;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_size1{
            width: 50%; 
            float: left;
            height: 660px; 
            border: 1px solid black;
            text-align: center;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail{
            width: 50%; 
            float: left;
            height: 660px; 
            text-align: center;
            border: 1px solid black;
            padding: 20px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_size1 > .itemInfo_major_img{
            width: 500px;
            height: 500px;
            border: 1px solid #999;
            margin: 20px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_size1 >.itemInfo_size2 > .itemInfo_minor_img{
            width: 100px;
            height: 100px;
            margin: 0px 5px 20px 5px;
            border: 1px solid #999;
            cursor: pointer;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_name{
            font-size: 30px;
            font-weight: bold;
            padding: 10px;
            text-align: left;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_price{
            font-size: 20px;
            text-align: left;
            padding: 20px 10px;
            font-weight: 500;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_delivery{
            font-size: 15px;
            text-align: left;
            padding: 30px 10px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_count{
            font-size: 15px;
            text-align: left;
            padding: 30px 10px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_final_price{
            font-size: 20px;
            text-align: left;
            padding: 10px 10px 30px 10px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_final_price > span {
            float: right;
            box-sizing: border-box;
            border-collapse : collapse;            
        }
        .itemInfo_content > .itemInfo_content_detail > .itemInfo_button{
            height: 25px;
            margin: 10px;
            width: 200px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info{
            border: 1px solid black;
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > .itemInfo_board_title {
            line-height: 40px;
            float: left;
            width: 50%;
            text-align: center;
            cursor: pointer;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > .itemInfo_board_title.on { /*보드타이틀이면서 on인 것*/
            background-color: #d3d3d3;
            color: white;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > .itemInfo_board_content > ul {
            clear: both;
            border-top: 1px solid #999;
            text-align: center;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > .itemInfo_board_content > ul > li {
            padding: 20px;
            border-bottom: 1px solid #999;
            text-align: left;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > .itemInfo_board_content > ul > li > span{
            float: right;
            top: 0;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > #board_data {
            display: none;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area > ul > .info_img{
            height: auto;
            width: auto;
            padding: 10px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area >.itemInfo_board_content > ul > li > .itemInfo_reviw_button_size{
            text-align: left;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area >.itemInfo_board_content > ul > li > .itemInfo_reviw_button_size > .itemInfo_reviw_button{
            text-align: center;
            height: 25px;
            margin: 10px;
            width: 200px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content > .itemInfo_info > .itemInfo_board_area >.itemInfo_board_content > ul > li > .itemInfo_reviw_img{
            /* float: left; */
            height: 70px;
            width: 70px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content >.itemInfo_recommend_title{
            text-align: left;
            font-size: 20px;
            font-weight: bold;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content >.itemInfo_recommend > .itemInfo_size{
            float: left;
            /* width: 33.3333%; */
            border: 1px solid #999;
            /* overflow: hidden; */
            /* padding: 30px; */
            margin: 42.33px;
            text-align: center;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemInfo_content >.itemInfo_recommend > .itemInfo_size > .itemInfo_p_item{
            font-weight: bold;
            display: inline-block; 
            width: 250px; 
            white-space: normal; /*줄바꿈*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        footer{
            border: 1px solid #000000;
            padding: 50px;
            text-align: center;
            clear: both;
            box-sizing: border-box;
            border-collapse : collapse;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--제이쿼리 스크립트-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--제이쿼리 ui-->
    
    <script>
        $(function(){
            $(".itemInfo_board_title").click(function(){ //상품상세 카테고리 변경
            $('.itemInfo_board_title').removeClass('on');
            $(this).addClass('on');
            // console.log($(this).text());
            if ($(this).text() == '상품 상세'){
                $('#board_notice').show();
                $('#board_data').hide();
            } else {
                $('#board_notice').hide();
                $('#board_data').show();
            }
            });
            $(".itemInfo_minor_img").click(function(){ //이미지 변경
                console.log($(this));
                var imgSrc = $(this).attr('src');
                $('.itemInfo_major_img').attr('src',imgSrc);
            });
        });
    </script>
</head>

<body>
    <div class="itemInfo_wrap">
        <div class="header">
            HEADER
        </div>

        <div class="itemInfo_content">
            <div class="itemInfo_size1">
                <img class="itemInfo_major_img" src="/jcappy/img/상세 이미지1.jpg">
                <div class="itemInfo_size2">
                    <img class="itemInfo_minor_img" id="minor_img1" src="/jcappy/img/상세 이미지1.jpg">
                    <img class="itemInfo_minor_img" id="minor_img2" src="/jcappy/img/상세 이미지2.jpg">
                    <img class="itemInfo_minor_img" id="minor_img3" src="/jcappy/img/상세 이미지3.jpg">
                </div>
            </div>
            <div class="itemInfo_content_detail">
                <p class="itemInfo_name">
                    삼성전자 RF85A9103AP 비스포크 냉장고 875L 21년 신모델 AC21585500
                </p>
                <p class="itemInfo_price">
                    100,000,000원
                </p>
                <hr>
                <p class="itemInfo_delivery">
                    배송 방법 - 택배<br>
                    배송비 무료
                </p>
                <hr>
                <p class="itemInfo_count">
                    수량 선택
                    <br>
                    <br>
                    <img src="/jcappy/img/아이콘 -.jpg" style="width: 20px; height: 20px;"><input type="number" style="width: 80px;"><img src="/jcappy/img/아이콘 +.jpg" style="width: 20px; height: 20px;">
                </p>
                <p class="itemInfo_final_price">
                    총 상품 금액<span>100,000,000원</span>
                </p>
                <button class="itemInfo_button" type="button" onclick="location.href=''" style="border: 1px solid black;">장바구니</button>
                <button class="itemInfo_button" type="button" onclick="location.href=''" style="border: 1px solid black;">주문하기</button>
            </div>

            <div class="itemInfo_info">
                <div class="itemInfo_board_area">
                    <div class="itemInfo_board_title on">상품 상세</div>
                    <div class="itemInfo_board_title">리뷰</div>
                    <div class="itemInfo_board_content" id="board_notice">
                        <ul>
                           <img class="itemInfo_info_img" src="/jcappy/img/상세 설명 이미지1.jpg">
                           <img class="itemInfo_info_img" src="/jcappy/img/상세 설명 이미지2.jpg">
                        </ul>
                    </div>
                    <div class="itemInfo_board_content" id="board_data">
                        <ul>
                            <li>
                                <div class="itemInfo_reviw_button_size">
                                    <button class="itemInfo_reviw_button" type="button" onclick="location.href=''" style="border: 1px solid black;">리뷰 작성</button>
                                </div>
                            </li>
                            <li>별점 ***** <span>작성자 아이디<br>작성일</span><br> 
                                빠른 배송과 포장 과정 영상 링크에 만족했습니다.정품 이라는것이 큰 장점인거 같아요.선물용으로 좋습니다.
                                <br><br><img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
                            </li>
                            <li>별점 ***** <span>작성자 아이디<br>작성일</span><br> 
                                첨엔 꽂을 때 잘 안들어가고 귀가 너무 아팠는데 약간 꺾어서 넣어주니까 잘 들어가더라구요. 쓰다보면 터득하는 노하우랄까.. 가끔씩 끊기는데 (어쩔땐 너무하다 싶을 때도 있고. 이동중 아닐 땐 안끊겨요) 무선 처음 써봐서 비교할 ......
                                <br><br><img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
                                <img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
                            </li>
                            <li>별점 ***** <span>작성자 아이디<br>작성일</span><br> 
                                모양도 이쁘고 사용도 편합니다
                            </li>
                            <li>별점 ***** <span>작성자 아이디<br>작성일</span><br> 
                                음질 좋습니다~~~
                            </li>
                            <li>별점 ***** <span>작성자 아이디<br>작성일</span><br> 
                                음질도 디자인도 괜찮은듯해요
                                <br><br><img class="itemInfo_reviw_img" src="/jcappy/img/리뷰 이미지.jpg">
                            </li>
                        </ul>
                        <p style="text-align: center;"> 페이징 <br> 12345</p>
                    </div>
                </div>
            </div>
            <hr>
            <div class="itemInfo_recommend">
                <p class="itemInfo_recommend_title">
                    추천 상품
                </p>
                <div class="itemInfo_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemInfo_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemInfo_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemInfo_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
            </div>
        </div>

        <div class="footer">
            FOOTER
        </div>
    </div>
    
</body>
</html>