<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<style>
.notice_write_content { margin: 50px 0px; }
.notice_write_content > .title { margin: 50px; }
.notice_write_content table { margin-bottom: 20px; }
.notice_write_content > .btn_wrap { margin: 20px 0px; box-sizing: border-box; overflow: hidden; }
.notice_write_content > .btn_wrap > input[type="button"] { width: 100px; height: 40px; float: right; }
.notice_write_content .notice_context { min-height: 300px; display: block; }
</style>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
       <div id="container">
			<%@ include file="/WEB-INF/view/include/mypage/sidebar.jsp"%>
			<%@ include file="/WEB-INF/view/include/mypage/userinfo.jsp"%>
			<!-- 마이페이지 공통 컨텐츠 -->
			<div class="mypage_content">
				<!-- 마이페이지 공통 서브타이틀 -->
				<div class="mypage_subtitle">
					<h2>내 문의</h2>
				</div>
				<table class="cstyle_table">
					<colgroup>
						<col>
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th class="cstyle_text_align_left">공지사항입니다</th>
							<th>2017-02-13</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="notice_context cstyle_text_align_left" colspan="2">
								
							</td>
						</tr>
					</tbody>
				</table>
				
				<table class="cstyle_table">
                        <colgroup>
                        	<col>
                            <col width="120px">
                        </colgroup>
                        <thead>
                            <tr class="notice_item">
                                <th class="cstyle_text_align_left"><a href="/jcappy/notice/detail.do">공지사항 이전글입니다</a></th>
                                <th>2017-02-13</th>
                            </tr>
                            <tr class="notice_item">
                                <th class="cstyle_text_align_left"><a href="/jcappy/notice/detail.do">공지사항 다음글입니다</a></th>
                                <th>2017-02-13</th>
                            </tr>
                        </thead>
                    </table>
                    
				<div class="btn_wrap">
					<input class="cstyle_btn" type="button" value="목록으로" onclick="location.href='/jcappy/notice/index.do'">
				</div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>