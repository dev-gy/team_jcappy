$(function(){
    $(".board_title").click(function(){
        $('.board_title').removeClass('on');
        $(this).addClass('on');
        //console.log($(this).text());
        if ($(this).text()=='약관') {
            $('#board_notice').show();
            $('#board_data').hide();
        } else {
            $('#board_notice').hide();
            $('#board_data').show();
        }
    });
});