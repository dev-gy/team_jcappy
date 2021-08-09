<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
$(function(){
	getComment(1);
});

function getComment(reqPage) { // 댓글 리스트 불러오기
	$.ajax({
		url:'/jcappy/notice/comment/list',
		data:{
			cm_board_no:${vo.nno},
			reqPage:reqPage
		},
		success:function(res) {
			$("#commentArea").html(res);
		}
	})
}
function notice_detail_goSave() { //댓글 입력
	<c:if test="${empty membersInfo}">
		alert("로그인후 댓글을 입력할수 있습니다.");
	</c:if>
	<c:if test="${!empty membersInfo}"> 
	if ($("#contents").val().trim() == '') {
		alert('내용을 입력해 주세요');
	} else {
		if (confirm('댓글을 등록하시겠습니까?')) {
			$.ajax({
    			url:'/jcappy/notice/comment/insert',
    			data:{
    				cm_content:$("#contents").val(),
    				cm_board_no:${vo.nno},
    				mno:${membersInfo.mno}
    			},
    			success:function(res) {
    				if (res.trim()=='true') {
    					alert('댓글이 등록되었습니다.');
    					$("#contents").val("");
    					getComment(1);
    				} else {
    					alert('댓글 등록 실패');
    				}
    			}
    		});
		}
	}
	</c:if>
}

function commentDel(no) { //댓글 삭제
	if (confirm('댓글을 삭제하시겠습니까?')) {
		$.ajax({
			url:'/jcappy/notice/comment/delete',
			data:{
				cm_no:no
			},
			success:function(res) {
				if (res.trim()=='true') {
    				alert('댓글이 삭제되었습니다.');
    				getComment(1);
				} else {
					alert('댓글 삭제 오류');
				}
			}
		});
	}
}
</script>
</head>
<body>
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/top.jsp" %>
        <div id="container">
        	<div class="notice_detail_content">
				<div class="title">
					<h1 class="cstyle_h1">공지사항</h1>
				</div>
				<table class="cstyle_table">
					<colgroup>
						<col>
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th class="cstyle_text_align_left">${vo.ntitle }</th>
							<th><fmt:formatDate value="${vo.nregdate }" pattern="yyyy-MM-dd HH:mm:ss"/></td> 
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="notice_context cstyle_text_align_left" colspan="2">
								${vo.ncontent}
							</td>
						</tr>
						<c:if test="${null ne vo.nfile_org}">
							<tr>
								<th class="cstyle_text_align_left">첨부파일</th>
								<th><a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.nfile_org}&real=${vo.nfile_real}" 
                         		target="_blank">${vo.nfile_org}</a></th>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="btn_wrap">
					<input class="cstyle_btn" type="button" value="목록" onclick="location.href='/jcappy/notice/list'">
				</div>
				<table class="cstyle_table">
               		<colgroup>
	                    <col width="*" />
	                    <col width="80px" />
                  	</colgroup>
                    <tbody>
                    	<tr>
	                        <td>
	                            <textarea name="content" id="contents" style="width:100%;height:80px;"></textarea>
	                        </td>
	                        <td>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:notice_detail_goSave();"><strong>저장</strong></a>
								</div>
	                        </td>
                     	</tr>
                    </tbody>
                 </table>
                 <div id="commentArea"></div>
			</div>
        </div>
        <%@ include file="/WEB-INF/view/include/bottom.jsp" %>
    </div>
</body>
</html>