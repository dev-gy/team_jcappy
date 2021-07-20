<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<link rel="stylesheet" href="/jcappy/css/findacountpwd.css">
	<script>
		$(function(){
		    $(".find_tab_btn1").addClass("tab_on");
		    $(".findpwd_area").hide();		
		    $(".cstyle_tab").on("click", function() {
			$(".cstyle_tab").removeClass("tab_on");
			$(this).addClass("tab_on");
		    });
		
		    $(".find_tab_btn1").on("click", function() {
			$(".findpwd_area").hide();
			$(".findid_area").show();
		    });
		    $(".find_tab_btn2").on("click", function() {
			$(".findid_area").hide();
			$(".findpwd_area").show();
		    });
		    
		});
	</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="find_content">
                <div class="title">
                    <h1 class="cstyle_h1">이메일·비밀번호 찾기</h1>
                </div>
                <table class="table">
                    <tr>
                        <td class="find_tab_btn1 cstyle_tab">이메일 찾기</td>
                        <td class="find_tab_btn2 cstyle_tab">비밀번호 찾기</td>
                    </tr>
                    <tr>
                        <td class="findid_area tab_find" colspan="2">
                            <form action="" method="post" class="findid_form">
                                <input type="text" class="find_input" name="name" placeholder="이름" required="required"/><br>                               
                                <input type="text" class="find_input" name="email" placeholder="연락처" required="required"/><br>
                                <input class="cstyle_btn ex" type="submit" id="submit" value="이메일 찾기"/>  
                            </form>                             
                        </td>
                        <td class="findpwd_area tab_find" colspan="2">
                            <form action="" method="post" class="findpwd_form">
                                <input type="text" class="find_input" name="id" placeholder="이름" required="required"/><br>
                                <input type="text" class="find_input" name="email" placeholder="이메일" required="required"/><br>
                                <input class="cstyle_btn ex" type="submit" id="submit" value="비밀번호 찾기"/>   
                            </form>
                        </td>
                </table>   
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>