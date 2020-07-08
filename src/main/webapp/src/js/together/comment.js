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

function showComment() {
  const commentNum = $(this)
    .find("#commentCount")
    .html()
    .slice(
      $(this).find("#commentCount").html().indexOf("(") + 1,
      $(this).find("#commentCount").html().indexOf(")")
    );

  if (commentNum != 0) {
    const boardNo = $(this).parent().parent().attr("boardNum");
    const table = $(this).next().find("table");
    loadComment(boardNo, table);
  }

  const icon = $(this).find(".fa-angle-down");

  if (icon.hasClass("icon_x_rotate")) {
    icon.removeClass("icon_x_rotate");
  } else {
    icon.addClass("icon_x_rotate");
  }

  $(this).next().slideToggle();
}

function loadComment(boardNo, table) {
  const memberId = $("input[name=togetherWriter]").val();
  $.ajax({
    url: "/together/asyncCommentLoad.do",
    type: "POST",
    data: { boardNo: boardNo },
    success: function (data) {
      table.children().remove();
      console.log(data);
      for (let i = 0; i < data.length; i++) {
        const commentWriterArea = document.createElement("tr");
        commentWriterArea.className = "comment_writer_area";
        table.append(commentWriterArea);

        const commentWriter = document.createElement("th");
        commentWriter.scope = "row";
        commentWriter.className = "comment_writer";
        commentWriter.innerHTML = data[i].commentWriter;
        commentWriterArea.append(commentWriter);

        const commentDate = document.createElement("td");
        commentDate.className = "comment_date";
        commentDate.innerHTML = data[i].commentDate;
        commentWriterArea.append(commentDate);

        const commentContentArea = document.createElement("tr");
        commentContentArea.className = "comment_content_area";
        table.append(commentContentArea);

        const contentTd = document.createElement("td");
        contentTd.innerHTML = data[i].commentContent;
        commentContentArea.append(contentTd);

        if (data[i].commentWriter == memberId) {
          const commentBtnTd = document.createElement("td");
          commentBtnTd.className = "comment_btn";
          commentContentArea.append(commentBtnTd);

          const modCommentBtn = document.createElement("button");
          modCommentBtn.type = "button";
          modCommentBtn.className =
            "btn btn-sm btn-outline-primary modCommentBtn";
          modCommentBtn.innerHTML = "수정";
          commentBtnTd.append(modCommentBtn);

          const delCommentBtn = document.createElement("button");
          delCommentBtn.type = "button";
          delCommentBtn.className =
            "btn btn-sm btn-outline-danger delCommentBtn";
          delCommentBtn.innerHTML = "삭제";
          commentBtnTd.append(delCommentBtn);
        }
      }
    },
    error: function () {
      console.log("서버 접속에 실패하였습니다.");
    },
  });
}
