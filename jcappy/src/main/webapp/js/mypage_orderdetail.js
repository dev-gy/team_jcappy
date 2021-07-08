function del() {
    if (confirm('정말 탈퇴 하시겠습니까?\n고객님의 아이디, 비밀번호, 구매내역 등\n모든 정보가 사라집니다.')) {
        location.href="";
    }
}

function order_cancel() {
    // var state = $('.detailtable_1 td:last-child').text();
    if (confirm('취소/교환/반품을 요청하시겠습니까?\n요청은 운영자에게 전달되어 확인 후, 처리됩니다.')) {
        location.href='mypage_ordercancel_form.html';
    }
}