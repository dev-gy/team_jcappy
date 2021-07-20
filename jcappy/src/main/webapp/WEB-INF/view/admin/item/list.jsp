<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<title>상품 목록</title>
<script>

       function isDel() {
          if (confirm('삭제하시겠습니까?')) {
             // 삭제처리
             $.ajax({
                url:'delete',
                data:{
                   'no':${vo.ino}
                },
                method:'post',
                success:function(res) {
                   console.log(res);
                   if (res.trim() == 'true') {
                      alert('정상적으로 삭제되었습니다.');
                      location.href='list.do';
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
	<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>상품관리 - [목록]</h2>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${itemVo.totCount }개</strong>  |  ${itemVo.reqPage}/${itemVo.totPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="상품 목록">
								<colgroup>
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품 번호</th>
										<th scope="col">브랜드</th> 
										<th scope="col">상품명</th> 
										<th scope="col">상품 가격</th> 
										<th scope="col">재고량</th> 
										<th scope="col">상품 등록일</th> 
										<th scope="col">삭제</th> 
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty list }">
		                            <tr>
		                                <td colspan="7">등록된 글이 없습니다.</td>
		                            </tr>
		                        </c:if>
								<c:forEach var="vo" items="${list }">    
									<tr>
										<td>${vo.ino }</td>
										<td>${vo.icompany }</td>
										<td>
										<a href="detail?no=${vo.ino }&reqPage=${itemVo.reqPage}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">${vo.iname }</a>
										</td>
										<td>${vo.iprice }</td>
										<td><input type="number" id="icount" name="icount" class="w100"/><a class="btns" href="#" onclick=""><strong>변경</strong></a></td>
										<td>${vo.iregdate }</td>
										<td><a href="javascript:isDel();" class="btns"><strong>삭제</strong></a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							</form>
							<!-- 페이징 처리 -->
							<div class='page'>
								<ul>
								<c:if test="${itemVo.startPage > itemVo.pageRange}">
		                        	<li><a href="list?reqPage=${itemVo.startPage-1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}"><</a></li>
		                        </c:if>
		                        <c:forEach var="rp" begin="${itemVo.startPage}" end="${itemVo.endPage }">
		                            <li><a href='list?reqPage=${rp}&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}' <c:if test="${rp==itemVo.reqPage }">class='current'</c:if>>${rp }</a></li>
		                        </c:forEach>
		                        <c:if test="${itemVo.totPage > itemVo.endPage}">
		                        	<li><a href="list?reqPage=${itemVo.endPage+1 }&stype=${param.stype}&sval=${param.sval}&orderby=${param.orderby}&direct=${param.direct}">></a></li>
		                        </c:if>
								</ul>
							</div>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="브랜드">
										<option value="sam">삼성</option>
										<option value="lg">LG</option>
										<option value="carrier">캐리어</option>
									</select>
									<input type="text" name="sval" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>	
</body>
</html>