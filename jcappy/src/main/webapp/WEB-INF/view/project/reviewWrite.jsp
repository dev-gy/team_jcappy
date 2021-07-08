<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css"/>
    <style>
        .review_write_wrap *{
            box-sizing: border-box;
        }
        .review_write_wrap{
            width:1200px;
            margin:0 auto;
        }
        .review_add_update{
            font-size: 40px;
            font-weight: bold;
            margin:50px 0 0 0;
        }
        .review_write_product{
            margin: 50px 0 0 0;
        }
        .review_write_product > a > img{
            width:100px;
            height:100px;
            float:left;
        }
        .review_write_product > a > p{
            float:left;
            line-height: 100px;
            font-size:20px;
            margin:0 0 0 20px;
        }
        .review_write_star{
            clear: both;
        }
        .review_write_star > p {
            float:left;
            width:100px;
            height:100px;
            line-height: 100px;
            text-align: center;
            font-size: 20px;
        }
        .review_write_star > img{
            float:left;
            width:200px;
            height:100px;
        }
        .review_write_content{
            clear: both;
        }
        .review_write_content > p{
            width:100px;
            height:500px;
            line-height: 500px;
            float:left;
            text-align: center;
        }
        .review_write_content > .review_write_textarea{
            float:left;
        }
        .picture_description{
            margin : 0 0 0 100px;
        }
        .review_write_picture > p{
            float:left;
            width:100px;
            height:100px;
            text-align: center;
        }
        .review_write_picture > .picture_file{
            float:left;
            width:100px;
            height:100px;
        }
        .review_write_button{
            clear: both;
            width:400px;
            margin: 0 auto;
            
        }
        .review_write_button > .review_write_submit{
            width:100px;
            margin:0 25px;
            float: left;
           
        }
        .review_write_button > .review_write_cancle{
            width:100px;
            margin:0 25px;
            float: left;
        }
        #submit_btn {
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
            border:0;
            
        }   
        #cancle_btn{
            width:100px;
            height:50px;
            background-color: rgb(177, 175, 175);
           
        }


      
    </style>
    <script>
        $(function(){
            $('#cancle_btn').click(function(){
                location.href='';
            });
        });
    </script>
</head>
<body>
    
    <div class="review_write_wrap">
        <div class="review_add_update">
            리뷰 등록 / 수정
        </div>
        <div class="review_write_product">
            <a href=""><img src="/jcappy/img/t1.jpg"></a>
            <a href=""><p>상품명</p></a>
        </div>
        <div class="review_write_star">
            <p>별점</p>
            <img src="/jcappy/img/star1.png">
        </div>
        <div class="review_write_content">
            <p>상품평</p>
            <div class="review_write_textarea">
                <textarea style="height:500px; width:1100px" ></textarea>
            </div>
            <div class="review_write_picture"> 
                <div class="picture_description">*총 5장까지 첨부할 수 있습니다.</div>
                <p>사진 첨부</p>
                <div class="picture_file"><input type="file"></div>
            </div>
            <div class="review_write_button">
                <div class="review_write_submit"><input type="submit" id="submit_btn" value="등록"></div>
                <div class="review_write_cancle"><input type="button" id="cancle_btn" value="취소"></div>
            </div>
        </div>
        
    </div>    
</body>
</html>