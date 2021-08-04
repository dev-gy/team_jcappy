<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
</head>
<style> 
/* 성재형에게 물어볼것 */
.notice_write_content { margin: 50px 0px; }
.notice_write_content > .title { margin: 50px; }
.notice_write_content table { margin-bottom: 20px; }
.notice_write_content > .btn_wrap { margin: 20px 0px; box-sizing: border-box; overflow: hidden; }
.notice_write_content > .btn_wrap > input[type="button"] { width: 100px; height: 40px; float: right; }
.notice_write_content .notice_context { min-height: 300px; display: block; }
</style>
<script>
function qna_detail_isDel() {//게시글 삭제
	if (confirm('문의를 삭제하시겠습니까?')) {  
		// 삭제처리
		$.ajax({
			url:'delete',
			data:{
				'qno':${vo.qno}
			},
			method:'post',
			success:function(res) {
				console.log(res);
				if (res.trim() == 'true') {
					alert('정상적으로 삭제되었습니다.');
					location.href='list';
				} else {
					alert('삭제 실패');
				}
			},
			error : function(res) {
				console.log(res);
			}
		});
	}
}
</script>
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
					<h2 class="qnatitle">내 문의</h2>
					<input class="cstyle_btn" id="qnalistbutton" type="button" value="목록" onclick="location.href='/jcappy/mypage/qna/list'">
				</div>
				<div class="qna_detail_content">
					<table class="cstyle_table">
						<colgroup>
							<col>
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th class="cstyle_text_align_left">${vo.qtitle}</th>
								<th>${vo.qregdate }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="notice_context cstyle_text_align_left" colspan="2">
									<div class="cont">${vo.qcontent} </div>
								</td>
							</tr>
							<tr>
		                       	<th class="cstyle_text_align_left">	첨부파일 </th>
		                           <th><a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.qfile_org}&real=${vo.qfile_real}"  target="_blank">${vo.qfile_org}</a></th>
		                    	</tr>
						</tbody>
					</table>
					<div class="btn_wrap">
						<input class="cstyle_btn" id="button" type="button" value="수정" onclick="location.href='edit?qno=${vo.qno}'">
						<input class="cstyle_btn" id="button" type="button" value="삭제" onclick="qna_detail_isDel();">
					</div>
				</div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>