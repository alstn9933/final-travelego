$(".writeCommentBtn").on("click", submitComment);

function submitComment() {
  const commentContent = $(this).prev().val();
  const commentWriter = $("input[name=togetherWriter]").val();
  const boardNo = $(this).attr("boardNo");
  if (commentWriter == "") {
    alert("로그인이 필요한 기능입니다.");
  } else if (commentContent == "") {
    alert("댓글을 입력해주세요.");
  } else {
    $.ajax({
      url: "/together/writeComment.do",
      type: "POST",
      data: {
        boardNo: boardNo,
        commentWriter: commentWriter,
        commentContent: commentContent,
      },
      success: function (data) {
        if (data == "1") {
          alert("댓글이 작성되었습니다.");
        } else {
          alert("댓글 작성에 실패하였습니다.");
        }
      },
      error: function () {
        console.log("서버접속에 실패 하였습니다.");
      },
    });
  }
}
