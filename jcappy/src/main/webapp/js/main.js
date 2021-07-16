/*======================================
smarteditor 공통
========================================*/
function setEditor(holder) {
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: holder,
		sSkinURI: "/jcappy/smarteditor/SmartEditor2Skin.html",
		htParams: {
			bUseToolbar: true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer: false,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger: false,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload: function() {
				//alert("아싸!");   
			}
		}, //boolean
		fOnAppLoad: function() {
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	return oEditors;
}

/*======================================
top.jsp
========================================*/
$(function () {
    $(".depth1 > li").mouseover(function () {
        $(this).find('.depth2').stop().slideDown(300);
    }).mouseleave(function () {
        $(this).find('.depth2').stop().slideUp(300);
    });

    $(".depth2 > li").mouseover(function() {
        $(this).css("background-color", "#dddddd").css("color", "black");
    }).mouseleave(function () {
        $(this).css("background-color", "white").css("color", "#575757");
    });
});