<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <link rel="stylesheet" href="/jcappy/css/notice.css">
<!--     <script> -->
<!--         $(function() { -->
<!--             $("#header").load("/header.html"); -->
<!--             $("#footer").load("/footer.html"); -->
<!--         }); -->
<!--     </script> -->
    
</head>

<body>
    <div class="wrap">
        <!-- 헤더 -->
<!--         <div id="header"></div> -->
        <div class="header">
            <p>HEADER</p>
        </div>
       
        <!-- 본문 -->
        <div id="content">
            <!-- 메뉴 타이틀 -->
            <div class="subheader">
                <p class="notice_title">공지사항</p>
                <form id="search" method="GET">
                    <a class="ico_search" href="javascript:void(0);" onclick="$('#search').submit()">검색</a>
                    <input class="input_search" type="text" placeholder="search">
                </form>
            </div>
            <!-- 메뉴 본문 -->
            <div>
                <table class="notice_table">
                    <colgroup>
                        <col width="80px">
                    </colgroup>
                    <thead>
                        <tr>
                            <td scope="col" class="notice_header_content td_center">NO</td>
                            <td scope="col" class="notice_header_content td_center">제목</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="notice_item">
                            <td class="notice_item_no td_center">2</td>
                            <td class="notice_item_title"><a href="">공사중입니다</a></td>
                            
                        </tr>
                        <tr class="notice_item">
                            <td class="notice_item_no td_center">1</td>
                            <td class="notice_item_title"><a href="">안녕하세요</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
<!--         <div id="footer"></div> -->
        <div class="footer">
            <p>FOOTER</p>
        </div>
    </div>
</body>

</html>