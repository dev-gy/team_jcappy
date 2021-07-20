<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<table class="list">
                    <p><span><strong>총 ${commentVo.totCount }개</strong>  |  ${commentVo.reqPage}/${commentVo.totPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="*" />
                            <col width="100px" />
                        </colgroup>
                        <tbody>
						<c:if test="${empty list }">
                            <tr>
                                <td class="first" colspan="5">등록된 댓글이 없습니다.</td>
                            </tr>
                        </c:if>
                        <c:forEach var="vo" items="${list }">     
                            <tr>
                                <td class="txt_l">
                                    ${vo.cm_content}
                                </td>
                                <td class="date"><fmt:formatDate value="${vo.cm_regdate }" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagenate clear">
                        <div class='page'>
	                        <c:if test="${commentVo.startPage > commentVo.pageRange}">
	                        	<span><a href="javascript:getComment(${commentVo.startPage-1 })"><</a></span>
	                        </c:if>
	                        <c:forEach var="rp" begin="${commentVo.startPage}" end="${commentVo.endPage }">
	                            <span><a href='javascript:getComment(${rp})' <c:if test="${rp==commentVo.reqPage }">class='current'</c:if>>${rp }</a></span>
	                        </c:forEach>
	                        <c:if test="${commentVo.totPage > commentVo.endPage}">
	                        	<span><a href="javascript:getComment(${commentVo.endPage+1 })">></a></span>
	                        </c:if>
						</div>
                    </div>