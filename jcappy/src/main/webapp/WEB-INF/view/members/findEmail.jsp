<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
	function findEmail(){
   		$.ajax({
   			url:'findEmail',
   			method:'post',
   			data:{
   				mname:$("#mname").val(),
   				mphone:$("#mphone").val()
   			},
   			success:function(res){
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
            <div class="findEmail_content">
                <div class="title">
                    <h1 class="cstyle_h1">계정 찾기</h1>
                </div>
                <table class="table">
                    <tr>
                        <td class="find cstyle_tab email" onclick="location.href='/jcappy/findEmail'">이메일 찾기</td>
                        <td class="find cstyle_tab pwd" onclick="location.href='/jcappy/findPwd'">비밀번호 찾기</td>
                    </tr>
                    <tr>
                        <td class="findEmail_area" colspan="2">
                            <form action="" method="post" class="findEmail_form" onsubmit="return findEmail();">
                                <input type="text" class="find_input" name="mname" id="mname" placeholder="이름" required="required"/><br>                               
                                <input type="text" class="find_input" name="mphone" id="mphone" placeholder="연락처" required="required"/><br>
                                <input class="cstyle_btn ex" type="submit" id="submit" value="이메일 찾기" alt="이메일 찾기"/>  
                            </form>                             
                        </td>
                </table>   
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>