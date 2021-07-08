function del() {
    if (confirm('정말 탈퇴 하시겠습니까?\n고객님의 아이디, 비밀번호, 구매내역 등\n모든 정보가 사라집니다.')) {
        location.href="";
    }
}

function cancel_back() {
    if(confirm('취소하시겠습니까?')) {
        alert('취소되었습니다.');
        history.back();
    }
}

function cancel_submit() {
    if ($('.order_cancel select').val() == 0) {
        alert('신청 종류를 선택해주세요.');
        return false;
    }
    if ($('.cancel_content').val().replace(/\s/gi,'') == '') {
            alert('취소/교환/반품 사유를 적어주세요.');
    } else {
        if(confirm('취소/교환/반품을 요청하시겠습니까?')) {
            $('.order_cancel form').submit();
        }
    }
}