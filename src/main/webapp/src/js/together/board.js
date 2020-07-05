$("#autosize").on("keyup", function (event) {
  const key = event.key;
  const lineNum = $(this).val().split("\n").length;
  if (key == "Enter") {
    $(this)
      .height(1)
      .height($(this).prop("scrollHeight") + 12);
  } else if (key == "Backspace") {
    const lineNum = $(this).val().split("\n").length;
    $(this).height(lineNum * 15 + 26);
  }
});

$(".content").on("mouseenter mouseleave", toggleStrech);
$(".show_comment").click(showComment);

function toggleStrech() {
  $(this).find(".stretch_area").slideToggle();
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
      }
    },
    error: function () {
      console.log("서버 접속에 실패하였습니다.");
    },
  });
}
