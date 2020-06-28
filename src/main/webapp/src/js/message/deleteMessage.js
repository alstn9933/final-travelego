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

$("tr").on("click",messageView);
	
$("#dropdownDeleteCheck").click(function(){
	$(".dropdown-toggle").hide();
	$(".delete-btns").show();
	$("tr").off();
	$("tr").on("click",clickCheck);
	$(".check_area").show();
	$("input").prop("checked", false);
});

$("#cancelBtn").click(function(){
	$(".check_area").hide();
	$(".delete-btns").hide();
	$(".dropdown-toggle").show();
	$("tr").off();
	$("tr").on("click",messageView);
});

$("#deleteBtn").click(function(){
	const checkNum = $("#checkNo:checked").length;
	if(checkNum != 0 && confirm(checkNum+"개의 쪽지를 삭제하시겠습니까?")){
		$("#deleteForm").submit();
	}
});

function clickCheck(){
	const checkBox = $(this).find("input");
	if(checkBox.prop("checked")) {
		checkBox.prop("checked",false);
	} else {
		checkBox.prop("checked",true);
	}
};