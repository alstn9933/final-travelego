$(document).on("click", ".writeCommentBtn", submitComment);
$(document).on("click", ".show_comment", showComment);
$(document).on("click", ".modCommentBtn", modifyComment);

function modifyComment() {
  const commentContent = $(this).parents("td").prev().html();

  const tbody = $(this).parents("tr").eq(0);

  const tr = document.createElement("tr");
  tr.className = "mod_comment_area";

  const td1 = document.createElement("td");
  tr.append(td1);

  const form = document.createElement("form");
  form.action = "/tripboard/modComment.do";
  form.className = "comment_form";
  form.method = "POST";
  td1.append(form);

  const textarea = document.createElement("textarea");
  textarea.name = "commentContent";
  textarea.className = "form-control autosize";
  textarea.rows = "3";
  textarea.maxLength = "60";
  textarea.innerHTML = commentContent;
  form.append(textarea);

  const commentNo = document.createElement("input");
  commentNo.type = "hidden";
  commentNo.name = "commentNo";
  commentNo.value = $(this).attr("commentNo");
  form.append(commentNo);

  const boardNo = document.createElement("input");
  boardNo.type = "hidden";
  boardNo.name = "boardNo";
  boardNo.value = $(this).attr("boardNum");
  form.append(boardNo);

  const td2 = document.createElement("td");
  tr.append(td2);

  const div1 = document.createElement("div");
  td2.append(div1);

  const writeBtn = document.createElement("button");
  writeBtn.className = "btn btn-primary writeCommentBtn";
  writeBtn.innerHTML = "완료";
  writeBtn.id = "modCommentBtn";
  div1.append(writeBtn);

  const cancelBtn = document.createElement("button");
  cancelBtn.type = "button";
  cancelBtn.className = "btn btn-danger writeCommentBtn";
  cancelBtn.id = "cancelmodBtn";
  cancelBtn.innerHTML = "취소";
  div1.append(cancelBtn);
  tbody.after(tr);
  tbody.after(document.createElement("tr"));
  $(this).parents("tr").hide();
}

function submitComment() {
  const commentContent = $(this).prev().val();
  const commentWriter = $("input[name=togetherWriter]").val();
  const boardNo = $(this).attr("boardNo");
  const table = $(this).parent().next();

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
          loadComment(boardNo, table);
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

  const icon = $(this).find(".fa-angle-down");

  if (icon.hasClass("icon_x_rotate")) {
    icon.removeClass("icon_x_rotate");
  } else {
    icon.addClass("icon_x_rotate");
    const boardNo = $(this).parent().parent().attr("boardNum");
    const table = $(this).next().find("table");
    loadComment(boardNo, table);
  }

  $(this).next().slideToggle();
}

function loadComment(boardNo, table) {
  const memberId = $("input[name=togetherWriter]").val();
  const memberNickname = $("#inputMemberNick").val();
  console.log(memberNickname);
  $.ajax({
    url: "/together/asyncCommentLoad.do",
    type: "POST",
    data: { boardNo: boardNo },
    success: function (data) {
      table.children().remove();
      table
        .parent()
        .prev()
        .find("#commentCount")
        .html("(" + data.commentCount + ")");
      const list = data.commentList;
      for (let i = 0; i < list.length; i++) {
        const commentWriterArea = document.createElement("tr");
        commentWriterArea.className = "comment_writer_area";
        table.append(commentWriterArea);

        const commentWriter = document.createElement("th");
        commentWriter.scope = "row";
        commentWriter.className = "comment_writer";
        commentWriter.innerHTML = list[i].commentWriter;
        commentWriterArea.append(commentWriter);

        const commentDate = document.createElement("td");
        commentDate.className = "comment_date";
        commentWriterArea.append(commentDate);

        const div = document.createElement("div");
        div.innerHTML = list[i].commentDate;
        commentDate.append(div);

        const commentContentArea = document.createElement("tr");
        commentContentArea.className = "comment_content_area";
        table.append(commentContentArea);

        const contentTd = document.createElement("td");
        contentTd.innerHTML = list[i].commentContent;
        commentContentArea.append(contentTd);

        if (list[i].commentWriter == memberNickname) {
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
