<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <style>
        .signIn_wrap{
            width: 1200px;
            margin: 0 auto; /* 가운데 정렬 */
            box-sizing: border-box;  
            border-collapse : collapse;
        }
        .header{
            border: 1px solid #000000;
            padding: 50px;
            text-align: center;
            box-sizing: border-box;  
            border-collapse : collapse;
        }
        .signIn_wrap > .signIn_content{
            border-right: 1px solid black;
            border-left: 1px solid black;
            padding: 100px;
            text-align: center;
            float: left;
            width: 100%;
            box-sizing: border-box;  
            border-collapse : collapse;
        }
        .signIn_wrap > .signIn_content > .signIn_p{
            padding: 30px;
            font-size: 25px;
            font-weight: bold;
            box-sizing: border-box;  
            border-collapse : collapse;
        }
        .signIn_wrap > .signIn_content > .signIn_form > .signIn_button{
            height: 25px;
            background-color: white;
            border: 1px solid black;
            width: 200px;
            box-sizing: border-box;  
            border-collapse : collapse;

        }
        .footer{
            border: 1px solid #000000;
            padding: 50px;
            text-align: center;
            clear: both;
            box-sizing: border-box;  
            border-collapse : collapse;
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--제이쿼리 스크립트-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--제이쿼리 ui-->

    <script> 
        $(function(){ 
            $("#alert-success").hide(); 
            $("#alert-danger").hide(); 
            $("input").keyup(function(){ 
                var pwd1=$("#pwd1").val(); 
                var pwd2=$("#pwd2").val(); 
            if(pwd1 != "" || pwd2 != ""){ 
                if(pwd1 == pwd2){ 
                    $("#alert-success").show(); 
                    $("#alert-danger").hide(); 
                    $("#submit").removeAttr("disabled"); 
                    $("#submit").css("background-color","white");
                } else{ $("#alert-success").hide(); 
                        $("#alert-danger").show(); 
                        $("#submit").attr("disabled", "disabled"); 
                        $("#submit").css("background-color","#999");
                    } 
                }    
            }); 
        }); 
    </script>



</head>
<body>
    <div class="signIn_wrap">
        <div class="header">HEADER</div>
        <div class="signIn_content">
            <p class="signIn_p">Sign In</p>
            <form action="메인페이지.html" method="post" class="signIn_form">
                <input type="text" name="id" placeholder="이메일" required="required" style="height: 30px;" width="30px"/><br>
                <input type="password" id="pwd1" placeholder="비밀번호" required="required" style="height: 30px;" width="30px"/><br>
                <input type="password" id="pwd2" placeholder="비밀번호 확인" required="required" style="height: 30px;" width="30px"/><br><br>
                <div class="signIn_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
                <div class="signIn_alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div><br>
                <input type="text" name="name" placeholder="이름을(를) 입력하세요" required="required" style="height: 30px;" width="30px"/><br>
                <input type="text" name="telNumber" placeholder="연락처" required="required" style="height: 30px;" width="30px"/><br><br>
                <input type="text" name="address1" placeholder="주소" required="required" style="height: 30px;" width="30px"/><br>
                <input type="text" name="address2" placeholder="상세주소" required="required" style="height: 30px;" width="30px"/><br><br>
                <input class="signIn_button" type="submit" id="submit" style="background-color: #999;" value="가입하기"/>
            </form>
        </div>
        <div class="footer">FOOTER</div>
    </div>
</body>
</html>