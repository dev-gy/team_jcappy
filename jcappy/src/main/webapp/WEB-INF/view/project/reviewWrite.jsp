<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/jcappy/css/reset.css"/>
    <link rel="stylesheet" href="/jcappy/css/reviewWrite.css"/>
    <script src="/jcappy/js/reviewWrite.js"></script>
    
    
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