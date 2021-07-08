<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>가입약관</title>
    <link rel="stylesheet" href="/jcappy/css/reset.css">
    <style>
        .policy_wrap{
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
        .policy_wrap > .policy_content{
            text-align: center;
            float: left;
            width: 100%;
            border-right: 1px solid black;
            border-left: 1px solid black;
            padding: 30px 0;
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
        .policy_wrap > .policy_content > ul{
            text-align: left;
            padding: 30px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .policy_wrap > .policy_content > .policy_checkbox{
            text-align: left;
            margin: 0 240px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .policy_wrap > .policy_content > ul > .policy_p{
            font-size: 25px;
            font-weight: bold;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .policy_wrap > .policy_content > .policy_textarea{
            height: 150px;
            width: 60%;
            box-sizing: border-box;
            border-collapse : collapse;
        }
        .policy_wrap > .policy_content > .policy_button{
            height: 25px;
            margin-right: 5px;
            width: 200px;
            box-sizing: border-box;
            border-collapse : collapse;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--제이쿼리 스크립트-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!--제이쿼리 ui-->

    <script>
       $(function(){
        $('#checkAll').click(function(){
            if($('#checkAll').prop('checked')){
                $('#termsOfService').prop('checked', true);
                $('#privacyPolicy').prop('checked', true);
                $('#continue').attr('disabled', false); 
                $("#continue").css("background-color","white");
            } else{
                $('#termsOfService').prop('checked', false);
                $('#privacyPolicy').prop('checked', false);
                $('#continue').attr('disabled', true);
                $("#continue").css("background-color","#999");
            }
        })
        $('#termsOfService').click(function(){
            if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
                $('#checkAll').prop('checked', true);
                $('#continue').attr('disabled', false);
                $("#continue").css("background-color","white");
            }else {
                $('#checkAll').prop('checked', false);
                $('#continue').attr('disabled', true);
                $("#continue").css("background-color","#999");  
            }
        })
        $('#privacyPolicy').click(function(){
            if($('#termsOfService').prop('checked') && $('#privacyPolicy').prop('checked')){
                $('#checkAll').prop('checked', true);
                $('#continue').attr('disabled', false);
                $("#continue").css("background-color","white");
            }else {
                $('#checkAll').prop('checked', false);
                $('#continue').attr('disabled', true); 
                $("#continue").css("background-color","#999"); 
            }
        })
        
       });
    </script>
</head>
<body>
    
    <div class="policy_wrap">
        <div class="header">HEADER</div>

        <div class="policy_content">
            <ul>
                <p class="policy_p">Terms & Policy</p>
            </ul>
            <textarea class="policy_textarea">제1조 목적
                본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
            </textarea><br>
            <div class="policy_checkbox">
                <input type="checkbox" name="agreement" id="termsOfService"> (필수) 이용약관 동의하기</input><br><br>
            </div>
            <textarea class="policy_textarea">Ⅰ. 개인정보의 수집 및 이용 동의서
                - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.
            ① 개인정보 수집 항목 및 수집·이용 목적
            ① 개인정보 수집 항목 및 수집·이용 목적
            ① 개인정보 수집 항목 및 수집·이용 목적
            ① 개인정보 수집 항목 및 수집·이용 목적
            </textarea><br>
            <div class="policy_checkbox">
                <input type="checkbox" name="agreement" id="privacyPolicy"> (필수) 개인정보 수집 및 이용 동의하기</input><br><br>
                <input type="checkbox" name="checkAll" id="checkAll"> (전체) 이용약관 및 개인정보 수집 및 이용 동의하기</input><br><br>
            </div>
            <button class="policy_button" type="button" onclick="location.href='메인페이지.html'" style="border: 1px solid black;">취소하기</button>
            <button class="policy_button" type="button" id="continue" onclick="location.href='회원가입.html'" style="border: 1px solid black; background-color: #999;" disabled>가입하기</button>
        </div>

        <div class="footer">FOOTER</div>
    </div>
</body>
</html>