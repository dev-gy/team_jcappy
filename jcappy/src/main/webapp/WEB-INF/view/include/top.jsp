<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="css/reset.css">

<script>
     $(function(){
        $(".depth1 > li").mouseover(function(){
            $(this).find('.depth2').stop().slideDown(300);
        }).mouseleave(function(){
            $(this).find('.depth2').stop().slideUp(300);
        });
    });
</script>

<style>
/*---------------------------------아래부터 헤더 메뉴바--------------------------------------------*/
.header {
    text-align: center;
    padding: 30px;

}
.menu {
    background-color: dimgray;
    height: 60px;
    position: relative;
   text-align: center;

}

.wrap > menu {
    width: auto;
    margin: 0 auto;
}
.mato {
    width: 1200px;
    margin: 0 auto;
}

.login_menu {
   
    float: right;
    position: relative;
   
}

/*---------------------------------아래부터 메뉴바--------------------------------------------*/
     
.depth1 > li {
   
    width: 240px;
    height: 60px;
    text-align: center;
    line-height: 60px;
    float: left;
    background-color: dimgray;
    font-size: 20px;
    margin: 0 auto;
   
}

.depth1>li>a {
    display: block;
    color: rgb(0, 0, 0); 
}

.depth1 {
    text-align: center;
    width: 1200px;
    position: relative;
    margin: 0px auto;
    display: block;
        }

.menu {
    text-align: center;
}

.depth2 > li {
    list-style: none;
    
}
.depth2{
  
  display: none;
}

a{
    color: black;
    text-decoration: none;
    
} 

.depth2 > li > a {
    background-color: rgb(255, 255, 255);
    border:1px solid black;
    display: block;
    
}
</style>

<div class="header">
	<div class="mato">
		<div class="size">
			<div>
				<p style="font-size: 280%;">
					<a href="">TEAM JCAPPY</a>
				</p>
			</div>
		</div>
		<div class="login_menu">
			<a href="">장바구니</a> | <a href="">로그인</a> | <a href="">회원가입</a>
		</div>
	</div>
</div>


<div class="menu">

	<ul class="depth1">
		<li><a href="">냉장고</a></li>

		<li><a href="">에어컨</a></li>

		<li><a href="">TV</a></li>

		<li><a href="">세탁기</a></li>

		<li><a href="">SERVICE</a>
			<ul class="depth2">
				<li><a href="">리뷰게시판</a>
				<li><a href="">공지사항</a>
				<li><a href="">회사소개</a>
			</ul>
		</li>
	</ul>
</div>