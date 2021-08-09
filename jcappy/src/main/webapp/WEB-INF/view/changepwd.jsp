<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script type="text/javascript">
    function test() {
      var p1 = document.getElementById('pwd1').value;
      var p2 = document.getElementById('pwd2').value;
          
          if( p1 != p2 ) {
            alert("비밀번호불일치");
            return false;
          } else{
            alert("비밀번호가 일치합니다");
            document.location.href="" //메엔페이지 링크
            
          }
    }
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
        	<div class="changepwd_top_subject">
        		<h1 class="cstyle_h1">비밀번호 재설정</h1>
        	</div>
			
			<div class="changepwd_info2">
		        <div class="changepwd_content2">
		            <div class="changepwd_board_area2">
		                <div class="changepwd_board_title">비밀번호 재설정</div>
		               
		                <div class="changepwd_board_content2" id="board_rspwd">
		                    
		                  <form action="resetpwd" class="reset_pwd" method="POST">
		                    <div class="changepwd_board_pwd">
		                    	비밀번호: <input type="password" id="pwd1" required>
		                    </div>
		                    <div class="changepwd_board_pwd2">
		                    	비밀번호 확인: <input type="password" id="pwd2"  required>
		                    </div>
		                    <div>
		                    	<button class="cstyle_btn changepwd_btn" type="button" onclick="test()">저장</button> 
		                    </div>
		               
		                   </form> 
		                </div>
		            </div>
		        </div>

        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>