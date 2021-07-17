<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
    $(function(){
        $(".findacountpwd_board_title").click(function(){
            $('.findacountpwd_board_title').removeClass('on');
            $(this).addClass('on');
            console.log($(this).text());
            if ($(this).text()=='아이디 찾기') {
                $('#findacountpwd_board_id').show();
                $('#findacountpwd_board_pwd').hide();
            } else {
                $('#findacountpwd_board_id').hide();
                $('#findacountpwd_board_pwd').show();
            }
        });
    });
    function test1() {
        var p1 = document.getElementById('id').value;
        var p2 = document.getElementById('email').value;
        console.log(p1 + ", " + p2);
        if (p1 != '' && p2 != '') {
            alert("회원님의 아이디는 ㅁㄴㅇㄹ입니다");
        } else {
            alert("입력해주세요")
        }
    }

    </script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
			<div class="findacountpwd_top_subject">
        		<h1 class="cstyle_h1">아이디 비밀번호 찾기</h1>
        	</div>
			<div class="findacountpwd_info">
			    <div class="findacountpwd_content">
			        <div class="findacountpwd_board_area">
			            <div class="findacountpwd_board_title on">아이디 찾기</div>
			            <div class="findacountpwd_board_title">비번 찾기</div>
			            <div class="findacountpwd_board_content" id="findacountpwd_board_id">
			                <form action="findId" class="find_Id" method="POST">
			                <div class="findacountpwd_idf">
			                	<div class="findacountpwd_name">
			                		이름: <input type="text" name="name" id="id" required>
			                	</div>
			                	<div class="findacountpwd_email">
			                		이메일: <input type="email" name="email" id="email" style="height:30px;" required>
			                	</div>
			            		<div>
			            			 <button class="cstyle_btn" style="width:100px;" onclick="test1()">확인</button>
			            		</div>
			            		
			                </div>
			                 </form>
			                
			                
			                    
			                       
			                          
			                          
			                           <!-- alert 창 띄우기 -->
			                       
			                        
			                   
			                    
			                </ul>
			            </div>
			            <form action="findpwd" class="find_pwd" method="POST">
			            <div class="findacountpwd_board_content" id="findacountpwd_board_pwd">
			                <div class="findacountpwd_pwdf">
			                	<div class="findacountpwd_id">
			                		아이디: <input type="text" name="id" required>
			                	</div>
			                	<div class="findacountpwd_btn">
			                		<button class="pwdbtn cstyle_btn" style="width:100px;" onclick="">확인</button> <!-- 비밀번호 재설정 페이지 링크-->
			                	</div>
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