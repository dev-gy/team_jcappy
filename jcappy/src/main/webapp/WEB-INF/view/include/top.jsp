<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<div id="header">
    <div class="size">
        <div class="logo">
            <a href="/jcappy">
                <img src="/jcappy/img/logo.png">
            </a>
        </div>
        <div class="member_menu">
        	<c:if test="${empty membersInfo }">
            	<a href="/jcappy/login">로그인</a> | <a href="/jcappy/policy/agreement.do">회원가입</a>
            </c:if>
            <c:if test="${!empty membersInfo }">
            	<a href="/jcappy/logout">로그아웃</a> | <a href="/jcappy/mypage/order">마이페이지</a>
             </c:if>
            <!-- <a href="">김조은님</a> | <a href="">마이페이지</a> | <a href="">장바구니</a> | <a href="">로그아웃</a> -->
        </div>
    </div>
	
	<div id="nav">
	    <div class="size">
	        <ul class="depth1">
	            <li><a href="/jcappy/product/refrigerator">냉장고</a></li>
	            <li><a href="/jcappy/product/airconditioner">에어컨</a></li>
	            <li><a href="/jcappy/product/tv">TV</a></li>
	            <li><a href="/jcappy/product/washer">세탁기</a></li>
	            <li><a href="/jcappy/notice/index.do">SERVICE</a>
	                <ul class="depth2">
	                    <li><a href="/jcappy/notice/index.do">공지사항</a>
	                    <li><a href="/jcappy/review.do">리뷰게시판</a>
	                    <li><a href="/jcappy/notice/index.do">회사소개</a>
	                </ul>
	            </li>
	        </ul>
	    </div>
	</div>
</div>