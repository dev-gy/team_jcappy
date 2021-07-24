<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
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
	
	function findId(){
   		$.ajax({
   			url:'findId',
   			method:'post',
   			data:{
   				mname:$("#mname").val(),
   				mphone:$("#mphone").val()
   			},
   			success:function(res){
   				console.log(1);
   				if (res.trim() == ''){
   					alert('이메일이 존재하지 않습니다.');
   				} else{
   					alert('이메일은 "'+res.trim()+'" 입니다.');
   				}
   			}
   		})
   		return false;
   	}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="findAccount_content">
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
                            <form action="" method="post" class="findid_form" onsubmit="return findId();">
                                <input type="text" class="find_input" name="mname" id="mname" placeholder="이름" required="required"/><br>                               
                                <input type="text" class="find_input" name="mphone" id="mphone" placeholder="연락처" required="required"/><br>
                                <input class="cstyle_btn ex" type="submit" id="submit" value="이메일 찾기" alt="이메일 찾기"/>  
                            </form>                             
                        </td>
                        <td class="findpwd_area tab_find" colspan="2">
                            <form action="" method="post" class="findpwd_form">
                                <input type="text" class="find_input" name="mname" id="mname" placeholder="이름" required="required"/><br>
                                <input type="text" class="find_input" name="memail" id="memail" placeholder="이메일" required="required"/><br>
                                <input class="cstyle_btn ex" type="submit" id="submit" value="비밀번호 찾기" alt="비밀번호 찾기"/>   
                            </form>
                        </td>
                </table>   
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>