$(function(){
       
    //제일 하단에 있는 depth1의 댓글을 다는 이벤트
    $("#commentParentSubmit").click(function( event ) {
           
        //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
        var pName = $("#commentParentName");
        var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
        var pText = $("#commentParentText");
           
        if($.trim(pName.val())==""){
            alert("이름을 입력하세요.");
            pName.focus();
            return;
        }else if($.trim(pPassword.val())==""){
            alert("패스워드를 입력하세요.");
            pPassword.focus();
            return;
        }else if($.trim(pText.val())==""){
            alert("내용을 입력하세요.");
            pText.focus();
            return;
        }
           
        var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                    '<td colspan=2>'+
                                        '<strong>'+pName.val()+'</strong> '+pPassword.val()+' <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                    '</td>'+
                                '</tr>';
           
        //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
        if($('#commentTable').contents().size()==0){
            $('#commentTable').append(commentParentText);
        }else{
            $('#commentTable tr:last').after(commentParentText);
        }
           
        $("#commentParentName").val("");
        $("#commentParentPassword").val("");
        $("#commentParentText").val("");
           
    });
       

       
    $(document).on("click","table#commentTable a", function(){//동적으로 버튼이 생긴 경우 처리 방식
        
        if($(this).attr("name")=="pDel"){
            if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                   
                var delComment = $(this).parent().parent();
                var nextTr = delComment.next();
                var delTr;
                //댓글(depth1)의 댓글(depth2_1)이 있는지 검사하여 삭제
                while(nextTr.attr("name")=="commentCode"){
                    nextTr = nextTr.next();
                    delTr = nextTr.prev();//삭제하고 넘기면 삭제되서 없기 때문에 다음값을 가져오기 어려워 다시 앞으로 돌려서 찾은 다음 삭제
                    delTr.remove();
                }
                   
                delComment.remove();
                   
            }else{   //취소
                return;
            }
        }
           
    });

       
});
