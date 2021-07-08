<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <title>상품목록</title>
        <link rel="stylesheet" href="/jcappy/css/reset.css">
        <style>
        .itemList_wrap a { /*링크 밑줄 제거*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap{
            width: 1200px;
            margin: 0 auto; /* 가운데 정렬 */
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
        .footer{
            border: 1px solid #000000;
            padding: 50px;
            text-align: center;
            clear: both;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_menu{
            height: 40px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_menu > .itemList_cate1{
            border-right: 1px solid black;
            border-left: 1px solid black;
            text-align: center;
            width: 100%;
            height: 40px;
            line-height: 40px; /*글씨가 있는 영역에 같은 값을 넣으면 가운데로 정렬됨*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_menu > .itemList_cate2{
            border: 1px solid black;
            text-align: center;
            width: 400px;
            float: left; /*배럭 띄워서 왼쪽으로 차례대로 붙임*/
            height: 40px;
            line-height: 40px; /*글씨가 있는 영역에 같은 값을 넣으면 가운데로 정렬됨*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_main_img{
            border-right: 1px solid black;
            border-left: 1px solid black;
            border-bottom: 1px solid black; ;
            overflow: hidden;
            width: 1200px;
            height: 225px;
            height: 200px;
            line-height: 200px;
            font-size: 50px;
            font-weight: 200px;
            text-align: center;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content{
            border-right: 1px solid black;
            border-left: 1px solid black;
            padding: 30px 0px;
            text-align: center;
            float: left;
            width: 100%;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_content_menu{
            padding: 0px 20px 30px 20px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_content_menu > .itemList_count{
            text-align: left;
            float: left;
            font-weight: bold;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_content_menu > .itemList_search{
            text-align: right;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_container{
            overflow: hidden;
            height: auto;
            width: 1200px;
            padding: 20px;
            margin: 0 auto;
            padding-left: 25px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_container > .itemList_size{
            float: left;
            /* width: 33.3333%; */
            border: 1px solid #999;
            /* overflow: hidden; */
            /* padding: 30px; */
            margin: 3.333333%;
            box-sizing: border-box;
            border-collapse : collapse;
        }

        .itemList_wrap > .itemList_content > .itemList_container > .itemList_size > .itemList_p_item{
            font-weight: bold;
            display: inline-block; 
            width: 250px; 
            white-space: normal; /*줄바꿈*/
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .itemList_wrap > .itemList_content > .itemList_pageing{
            text-align: center;
            padding: 30px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
    </style>
</head>

<body>
    <div class="itemList_wrap">
        <div class="header">HEADER</div>
        
        <div class="itemList_main_img" style="background-image: url('/jcappy/img/냉장고 대표.jpg');">
            냉장고
        </div>
        <div class="itemList_menu">
            <div class="itemList_cate1" style=" cursor: pointer;" onclick="location.href='';">냉장고</div>
            <div class="itemList_cate2" style=" cursor: pointer;" onclick="location.href='';">일반형</div>
            <div class="itemList_cate2" style=" cursor: pointer;" onclick="location.href='';">양문형</div>
            <div class="itemList_cate2" style=" cursor: pointer;" onclick="location.href='';">업소형</div>
        </div>

        <div class="itemList_content">
            <div class="itemList_content_menu">
                <p class="itemList_count">냉장고 32(총 개수)</p>
                <div class="itemList_search">
                    <input type="text" placeholder="검색어를 입력해주세요.">
                    <button>&nbsp검색&nbsp</button>
                    <select>
                        <option value="1" selected>인기순</option>
                        <option value="2">가격 높은순</option>
                        <option value="3">가격 낮은순</option>
                    </select>
                </div>
            </div>
            <div class="itemList_container">
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지1.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지2.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
                <div class="itemList_size">
                    <a href=""><img src="/jcappy/img/상품 이미지3.jpg" width="300" height="300"><br>
                    <P class="itemList_p_item">삼성전자 양문형 냉장고 RS82M6000S8 815L 방문설치</P><br><br>
                    100,000,000,000원</a>
                </div>
            
            </div>
            <div class="itemList_pageing">
                페이징 처리<br>
                12345
            </div>
        </div>
        
    
        <div class="footer">FOOTER</div>
    </div>
</body>
</html>