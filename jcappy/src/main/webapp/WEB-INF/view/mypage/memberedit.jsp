<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
<script>
$(function(){ 
	// 수정버튼 비활성화 및 툴팁 창 숨김
	$(".mypage_member_update #submit").attr("disabled", "disabled"); 
    $(".mypage_member_update #alert-success").hide(); 
    $(".mypage_member_update #alert-danger").hide(); 
    
    $("input").keyup(function(){
	    // 키 입력시 비밀번호 일치여부 확인 및 결과툴팁 띄우기
	    // 일치할 시 버튼 활성화, 일치하지 않을 시 버튼 비활성화
        var pwd1=$(".mypage_member_update #mpwd").val(); 
        var pwd2=$(".mypage_member_update #mpwd_check").val(); 
	    if(pwd1 != "" || pwd2 != ""){ 
	        if(pwd1 == pwd2){ 
	            $(".mypage_member_update #alert-success").show(); 
	            $(".mypage_member_update #alert-danger").hide(); 
	            $(".mypage_member_update #submit").removeAttr("disabled"); 
	        } else{ $(".mypage_member_update #alert-success").hide(); 
                $(".mypage_member_update #alert-danger").show(); 
                $(".mypage_member_update #submit").attr("disabled", "disabled"); 
            } 
        }    
    });
    $('.mypage_member_update #mphone').blur(function() {
		$.ajax({
			url:'<%=request.getContextPath()%>/members/isDuplicatePhone',
			data:{phone:$('#mphone').val()},
			success : function(res) {
				if (res.trim() == 'true'){
					alert('중복된 연락처입니다. 다른 연락처를 입력해주세요.');
					$('#mphone').val('');
					$('#mphone').focus();
				}
			}
		});	
	});
    
 // 비밀번호 정규식
	$("form").submit(function(){
		if(!/(?=.*\d)(?=.*[a-zA-ZS])(?=.*?[#?!@$%^&*-]).{6,20}/.test($('#mpwd').val())){
			alert('비밀번호 : 영문대소문자, 숫자, 특수문자를 각 하나이상 포함한 6~20자');
			$('#mpwd').val('');
			$('#mpwd').focus();
			return false;
		}
	});
	
	// 이름 정규식
	$("form").submit(function(){
		if(!/^[가-힣a-zA-Z]{1,20}$/.test($('#mname').val())){
			alert('이름 : 한글, 영문으로 이루어진 1~20자');
	      	$('#mname').val('');
	      	$('#mname').focus();
			return false;
		}
	});	
	
 	// 연락처 정규식
	$("form").submit(function(){
		if(!/^[0-9]{9,11}$/.test($('#mphone').val())){
			alert('숫자 9~11자리로만 입력해주세요.');
			$('#mphone').val('');
			$('#mphone').focus();
			return false;
		}
	});
    
});
</script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/top.jsp"%>
		<div id="container">
			<%@ include file="/WEB-INF/view/include/mypage/sidebar.jsp"%>
			<%@ include file="/WEB-INF/view/include/mypage/userinfo.jsp"%>
			<!-- 마이페이지 공통 컨텐츠 -->
			<div class="mypage_content">
				<!-- 마이페이지 공통 서브타이틀 -->
				<div class="mypage_subtitle">
					<h2>정보수정</h2>
				</div>
				<div class="mypage_content">
					<!-- 현재 페이지 컨텐츠 구현부 -->
					<div class="mypage_for_line"></div>
					<!-- 내정보수정 -->
					<div>
						<div class="mypage_member_update">
							<form action="/jcappy/mypage/update" method="POST">
								<div>
									<table class="">
									<colgroup>
										<col width="50%"/>
										<col width="50%"/>
									</colgroup>
										<tr>
											<td>이메일</td>
											<td><input type="text" name="memail" value="${membersInfo.memail }" readonly required="required"></td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td><input class="pwd1" type="password" name="mpwd" id="mpwd" required="required"></td>
										</tr>
										<tr>
											<td>비밀번호확인</td>
											<td><input class="pwd2" type="password" id="mpwd_check" required="required"></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<div class="edit_alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
		                   						<div class="edit_alert alert-danger" id="alert-danger">비밀번호가 일치하지않습니다.</div>
		                   					</td>
										</tr>
										<tr>
											<td>이름</td>
											<td><input type="text" name="mname" id="mname" value="${membersInfo.mname }" required="required"></td>
										</tr>
										<tr>
											<td>연락처</td>
											<td><input type="text" name="mphone" id="mphone" value="${membersInfo.mphone }" required="required"></td>
										</tr>
										<tr>
											<td>우편번호</td>
											<td class="zipcode_td">
												<input class="zipcode" id="zipcode" type="text" name="mzipcode" value="${membersInfo.mzipcode }" required="required">
												<input class="cstyle_btn search_zipcode" type="button" value="검색" onclick="daumPostcode($('#zipcode'), $('#addr1'), $('#addr2'));">
											</td>
										</tr>
										<tr>
											<td>주소</td>
											<td><input type="text" id="addr1" name="maddr"  value="${membersInfo.maddr }" required="required"></td>
										</tr>
										<tr>
											<td>상세주소</td>
											<td><input type="text" id="addr2" name="maddrde" value="${membersInfo.maddrde }" required="required"></td>
										</tr>
										<tr>
											<td colspan="2">
												<input class="cstyle_btn" type="submit" id="submit" value="수정">
												<input class="cstyle_btn" type="button" value="취소" onclick="location.href='/jcappy/mypage/order/index.do'">
											</td>
										</tr>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/bottom.jsp"%>
	</div>
</body>
</html>