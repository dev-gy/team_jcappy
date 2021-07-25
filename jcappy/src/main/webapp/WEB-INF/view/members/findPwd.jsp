<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 찾기</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
function findPwd(){
	$.ajax({
		url:'findPwd',
		data:{
			mname:$("#mname").val(),
			memail:$("#memail").val()
		},
		method:"post",
		success:function(res){
			if (res.trim()=='ok'){
				alert('임시 비밀번호를 이메일로 발송하였습니다. 이메일을 확인해 주세요.');
			} else{
				alert('아이디 / 이메일이 올바르지 않습니다.');
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
            <div class="findPwd_content">
                <div class="title">
                    <h1 class="cstyle_h1">계정 찾기</h1>
                </div>
                <table class="table">
                    <tr>
                        <td class="find cstyle_tab email" onclick="location.href='/jcappy/findEmail'">이메일 찾기</td>
                        <td class="find cstyle_tab pwd" onclick="location.href='/jcappy/findPwd'">비밀번호 찾기</td>
                    </tr>
                    <tr>
                        <td class="findPwd_area" colspan="2">
                            <form action="" method="post" class="findPwd_form" onsubmit="return findPwd();">
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