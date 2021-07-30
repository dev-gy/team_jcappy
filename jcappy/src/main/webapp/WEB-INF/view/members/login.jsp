<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>로그인</title> -->
<%-- <%@ include file="/WEB-INF/view/include/head.jsp"%> --%>
<!-- </head> -->
<!-- <body> -->
<!--     <div id="wrap"> -->
<%--         <%@ include file="/WEB-INF/view/include/top.jsp" %> --%>
<!--         <div id="container"> -->
<!--             <div class="login_content"> -->
<!--                 <div class="title"> -->
<!--                     <h1 class="cstyle_h1">Login</h1> -->
<!--                 </div> -->
<!--                 <form action="login" method="post" class="login_form"> -->
<%--                     <input type="text" class="login_input" name="memail" id="memail" placeholder="이메일" required="required" value="${membersVo.memail }"/><br> --%>
<!--                     <input type="password" class="login_input" name="mpwd" id="mpwd" placeholder="비밀번호" required="required"/><br> -->
<!--                     <div class="login_checkbox"> -->
<%--                         <input type="checkbox" name="checkEmail" value="check"<c:if test="${!empty membersVo.memail}"> checked</c:if>> 이메일 저장 --%>
<!--                     </div> -->
<!--                     <input class="cstyle_btn ex" type="submit" id="submit" value="로그인" alt="로그인" onclick=""/> -->
<!--                 </form> -->
<!--                 <div class="login_link"> -->
<!--                     <a href="/jcappy/policy/agreement.do" id="join">회원가입</a> -->
<!--                     <a href="/jcappy/findEmail" id="find">아이디·비밀번호 찾기</a> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->
<%--         <%@ include file="/WEB-INF/view/include/bottom.jsp" %> --%>
<!--     </div> -->
<!-- </body> -->
<!-- </html> -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>로그인</title>
    <%@ include file="/WEB-INF/view/include/head.jsp" %>
    
    <script>
    	function loginCheck(){
    		if($("#id").val().trim() == ''){
    			alert("아이디를 입력해주세요.")
    			$("#id").focus();
    			 return false;
    		};
    		if($("#pwd").val().trim() == ''){
    			alert("비밀번호를 입력해주세요.")
    			$("#pwd").focus();
    			 return false;
    		};
    	}
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <form action="login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    
                    <div class="member">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="id" name="memail" placeholder="아이디" value="${membersVo.memail }"></li>
                                    <li><input type="password" id="pwd" name="mpwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="checkId" id="reg1" value="check" <c:if test="${!empty membersVo.memail}"> checked</c:if>/>아이디 저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                                <div>
                                    <a href="join.do" class="btn">회원가입</a> 
                                    <a href="searchId.do" class="btn">이메일/비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
            </form>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>