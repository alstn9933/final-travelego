$(".show_comment").click(function () {
  const icon = $(this).find(".fa-angle-down");

  if (icon.hasClass("icon_x_rotate")) {
    icon.removeClass("icon_x_rotate");
  } else {
    icon.addClass("icon_x_rotate");
  }

  $(this).next().slideToggle();
});

$(document).on("keyup", ".autosize", autoSizing);

function autoSizing(event) {
  const key = event.key;
  const lineNum = $(this).val().split("\n").length;
  if (key == "Enter") {
    $(this)
      .height(1)
      .height($(this).prop("scrollHeight") + 12);
  } else if (key == "Backspace" || key == "Delete") {
    const lineNum = $(this).val().split("\n").length;
    $(this).height(lineNum * 15 + 26);
  }
}

$(".addComment").on("click", function () {
  const tbody = $(this).parents("tr").eq(0);

  const tr = document.createElement("tr");
  tr.className = "add_comment_area";

  const td1 = document.createElement("td");
  tr.append(td1);

  const form = document.createElement("form");
  form.action = "/tripboard/writeComment.do";
  form.className = "comment_form";
  td1.append(form);

  const textarea = document.createElement("textarea");
  textarea.name = "commentContent";
  textarea.className = "form-control autosize";
  textarea.rows = "3";
  textarea.maxLength = "60";
  form.append(textarea);

  const commentLevel = document.createElement("input");
  commentLevel.type = "hidden";
  commentLevel.name = "commentLevel";
  commentLevel.value = "1";
  form.append(commentLevel);

  const refComment = document.createElement("input");
  refComment.type = "hidden";
  refComment.name = "refComment";
  refComment.value = $(this).attr("commentNo");
  form.append(refComment);

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
  writeBtn.innerHTML = "작성";
  writeBtn.id = "addCommentBtn";
  div1.append(writeBtn);

  const cancelBtn = document.createElement("button");
  cancelBtn.type = "button";
  cancelBtn.className = "btn btn-danger writeCommentBtn";
  cancelBtn.id = "cancelAddBtn";
  cancelBtn.innerHTML = "취소";
  div1.append(cancelBtn);
  tbody.after(tr);
  tbody.after(document.createElement("tr"));
});

$(document).on("click", "#addCommentBtn", function () {
  $(this).parents("tr").find("form").submit();
});

$(document).on("click", "#cancelAddBtn", function () {
  $(this).parents("tr").eq(0).prev().remove();
  $(this).parents("tr").eq(0).remove();
});

$(".delCommentBtn").click(function () {
  if (confirm("댓글을 삭제하시겠습니까?")) {
    location.href =
      "/tripboard/deleteComment.do?boardNo=" +
      $(this).attr("boardNum") +
      "&commentNo=" +
      $(this).attr("commentNo");
  }
});

$(".modCommentBtn").click(function () {
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
});

$(document).on("click", "#cancelmodBtn", function () {
  $(this).parents("tr").eq(0).prev().remove();
  $(this).parents("tr").eq(0).prev().show();
  $(this).parents("tr").eq(0).remove();
});

$(document).on("click", "#modCommentBtn", function () {
  $(this).parents("tr").find("form").submit();
});
