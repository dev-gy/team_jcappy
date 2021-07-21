<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
            <div class="policy_content">
                <div class="title">
                	<h1 class="cstyle_h1">Terms &amp; Policy</h1>
               	</div>
                <textarea class="policy_textarea">제1조 목적
                    본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                    본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                    본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                    본 약관은 「주식회사 파스토」(이하 "회사")와 회사의 풀필먼트 서비스(이하”서비스)를 이용하는 자(이하 "사용자")간의 관계와 권리 의무 및 책임 사항, 기타 서비스 이용에 관한 제반 사항을 정함을 목적으로 합니다.
                </textarea><br>
                <div class="policy_checkbox">
                    <input type="checkbox" name="agreement" id="termsOfService"> (필수) 이용약관 동의하기<br><br>
                </div>
                <textarea class="policy_textarea">Ⅰ. 개인정보의 수집 및 이용 동의서
                    - 이용자가 제공한 모든 정보는 다음의 목적을 위해 활용하며, 하기 목적 이외의 용도로는 사용되지 않습니다.
                    ① 개인정보 수집 항목 및 수집·이용 목적
                    ① 개인정보 수집 항목 및 수집·이용 목적
                    ① 개인정보 수집 항목 및 수집·이용 목적
                    ① 개인정보 수집 항목 및 수집·이용 목적
                </textarea><br>
                <div class="policy_checkbox">
                    <input type="checkbox" name="agreement" id="privacyPolicy"> (필수) 개인정보 수집 및 이용 동의하기<br><br>
                    <input type="checkbox" name="checkAll" id="checkAll"> (전체) 이용약관 및 개인정보 수집 및 이용 동의하기<br><br>
                </div>
                <button class="cstyle_btn ex" type="button" id="continue" onclick="location.href='/jcappy/join.do'" disabled>확인</button>
                <button class="cstyle_btn ex" type="button" onclick="location.href='/jcappy/index.do'" >취소</button>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>