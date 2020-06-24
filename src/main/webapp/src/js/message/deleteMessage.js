$("#dropdownDeleteRead").click(function(){
	if(confirm("읽은 쪽지를 모두 삭제하시겠습니까?")){
		location.href = "/message/deleteAllReadMessage.do";
	}
});

$("#dropdownDeleteAll").click(function(){
	if(confirm("받은 쪽지를 모두 삭제하시겠습니까?")){
		location.href = "/message/deleteAllReceivedMessage.do";
	}
});

$("#dropdownDeleteAllSend").click(function(){
	if(confirm("보낸 쪽지를 모두 삭제하시겠습니까?")){
		location.href = "/message/deleteAllSendMessage.do";
	}
});

$("#dropdownDeleteSendRead").click(function(){
	if(confirm("상대방이 읽은 쪽지를 모두 삭제하시겠습니까?")){
		location.href = "/message/deleteAllSendRead.do";
	}
});