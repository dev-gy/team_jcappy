function del() {
    if (confirm('정말 탈퇴 하시겠습니까?\n고객님의 아이디, 비밀번호, 구매내역 등\n모든 정보가 사라집니다.')) {
        location.href="";
    }
}

function back() {
    if(confirm('취소하시겠습니까?')) {
        alert('취소되었습니다.');
        history.back();
    }
}

function submit() {
    if (checkpwd()) {
        if (checkinfo()) {
            if(confirm('수정하시겠습니까?')) {
                $('.updateinfotable form').submit();
            }
        }
    }
}

function checkpwd() {
    var pwd1 = $('.pwd1').val().replace(/\s/gi,'');
    var pwd2 = $('.pwd2').val().replace(/\s/gi,'');
    
    if (pwd1 != '' || pwd2 != '') {
        if (pwd1 != pwd2) {
            alert('입력하신 비밀번호가 일치하지 않습니다.');
            return false;
        } else {
            return true;
        }
    }
    return true;
}

function checkinfo() {
    $('.updateinfotable input[type="text"]').each(function(i, v) {
        if ($('input[type="text"]').eq(i).val().replace(/\s/gi,'') == '') {
            alert('빈칸을 채워주세요.');
            $('input[type="text"]').eq(i).focus();
            return false; // callback 함수가 중지되는 것. check()가 중지되는 것이 아님.
        } else {
            return true;
        }
    });
}