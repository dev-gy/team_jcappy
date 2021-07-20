<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
	function isDel() {
		if (confirm('삭제하시겠습니까?')) {
			// 삭제처리
			$.ajax({
				url:'delete.do',
				data:{
					'nno':${vo.nno}
				},
				method:'post',
				success:function(res) {
					console.log(res);
					if (res.trim() == 'true') {
						alert('정상적으로 삭제되었습니다.');
						location.href='index.do';
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
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>공지게시판 - [읽기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">번호</label></th>
										<td colspan="10">
											${vo.nno}
										
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											${vo.ntitle }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">조회수</label></th>
										<td colspan="10">
											${vo.nreadcount}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작성날짜</label></th>
										<td colspan="10">
											${vo.nregdate }
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											${vo.ncontent}
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
											<a href="/jcappy/common/download.jsp?path=/upload/&org=${vo.nfile_org}&real=${vo.nfile_real}" 
                            				target="_blank">${vo.nfile_org}</a>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="index.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="edit.do?nno=${vo.nno}"><strong>수정</strong></a>
									<a class="btns" style="cursor:pointer;" href="javascript:isDel();"><strong>삭제</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>