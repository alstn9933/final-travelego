function twsConnect() {
  var url = window.location.host;
  tws = new WebSocket("ws://" + url + "/together/tws.do");
  const memberId = "${sessionScope.member.memberId}";
  tws.onopen = function () {
    const msg = {
      type: "register",
      memberId: memberId,
    };
    tws.send(JSON.stringify(msg));
  };
  tws.onmessage = function (e) {
    const notify = $(".notify_area");
    notify.show();
    let currentNum = notify.find("#newCount").html().substr(1);
    notify.find("#newCount").html("+" + eval(Number(currentNum) + 1));
    let currentLoad = notify.attr("loadNum");
    if (currentLoad == undefined) {
      notify.attr("loadNum", e.data);
    } else {
      notify.attr("loadNum", currentLoad + "," + e.data);
    }
  };
  tws.onclose = function () {
    const msg = {
      type: "exit",
      memberId: memberId,
    };
    tws.send(JSON.stringify(msg));
  };
}

twsConnect();

$(document).on("click", ".notify_area", function () {
  const notify = $(this);
  const loadNums = $(this).attr("loadNum").split(",");
  let boardNo = [];
  for (let i = 0; i < loadNums.length; i++) {
    boardNo.push({ name: "boardNo", value: loadNums[i] });
  }

  $.ajax({
    url: "/together/asyncLoadNew.do",
    type: "POST",
    data: boardNo,
    success: function (data) {
      console.log(data);
      const memberId = $("input[name=togetherWriter]").val();

      if (data.length != 0) {
        for (let i = 0; i < data.length; i++) {
          const content = document.createElement("div");

          content.classList.add("content");
          content.setAttribute("rnum", data[i].rnum);
          content.setAttribute("boardNum", data[i].togetherNo);

          const firstDiv = document.createElement("div");
          content.append(firstDiv);

          const boardTitleArea = document.createElement("div");
          boardTitleArea.classList.add("board_title_area");
          firstDiv.append(boardTitleArea);

          const boardTitle = document.createElement("div");
          boardTitle.classList.add("board_title");
          boardTitleArea.append(boardTitle);

          const titleA = document.createElement("a");
          titleA.href = "javascript:void(0)";
          titleA.innerHTML = data[i].togetherTitle;
          boardTitle.append(titleA);

          const boardContent = document.createElement("div");
          boardContent.className = "board_content";
          boardTitleArea.append(boardContent);

          const boardContentDiv = document.createElement("div");
          boardContentDiv.innerHTML = data[i].togetherContent;
          boardContent.append(boardContentDiv);

          const boardWriterArea = document.createElement("div");
          boardWriterArea.className = "board_writer_area";
          firstDiv.append(boardWriterArea);

          const boardDate = document.createElement("div");
          boardDate.className = "board_date";
          boardWriterArea.append(boardDate);

          const dateSpan = document.createElement("span");
          dateSpan.innerHTML = data[i].togetherDate;
          boardDate.append(dateSpan);

          const boardWriter = document.createElement("div");
          boardWriter.className = "board_writer";
          boardWriterArea.append(boardWriter);

          const writerSpan = document.createElement("span");
          writerSpan.innerHTML = data[i].togetherWriter;
          boardWriter.append(writerSpan);

          const actionArea = document.createElement("div");
          actionArea.className = "action_area";
          content.append(actionArea);

          const showComment = document.createElement("div");
          showComment.className = "show_comment";
          actionArea.append(showComment);

          const commentDiv1 = document.createElement("div");
          showComment.append(commentDiv1);

          const commentIcon = document.createElement("i");
          commentIcon.className = "far fa-comment-dots";
          commentDiv1.append(commentIcon);

          const commentSpan1 = document.createElement("span");
          commentSpan1.innerHTML = "댓글";
          commentDiv1.append(commentSpan1);

          const commentSpan2 = document.createElement("span");
          commentSpan2.innerHTML = "(0)";
          commentDiv1.append(commentSpan2);

          const commentDiv2 = document.createElement("div");
          showComment.append(commentDiv2);

          const commentIcon2 = document.createElement("i");
          commentIcon2.className = "fas fa-angle-down";
          commentDiv2.append(commentIcon2);

          const comments = document.createElement("div");
          comments.className = "comments";
          comments.style = "display:none;";
          actionArea.append(comments);

          const commentForm = document.createElement("form");
          commentForm.className = "comment_form";
          comments.append(commentForm);

          const commentTextArea = document.createElement("textarea");
          commentTextArea.name = "";
          commentTextArea.className = "form-control autosize";
          commentTextArea.rows = "1";
          commentTextArea.maxLength = "60";
          commentForm.append(commentTextArea);

          const writeCommentBtn = document.createElement("button");
          writeCommentBtn.type = "button";
          writeCommentBtn.className = "btn btn-primary writeCommentBtn";
          writeCommentBtn.setAttribute("boardNo", data[i].togetherNo);
          writeCommentBtn.innerHTML = "작성";
          commentForm.append(writeCommentBtn);

          const commentTable = document.createElement("table");
          commentTable.className = "table";
          comments.append(commentTable);

          const stretchArea = document.createElement("div");
          stretchArea.className = "stretch_area";
          stretchArea.style = "display:none;";
          content.append(stretchArea);

          const stretchIcon = document.createElement("i");
          stretchIcon.className = "fas fa-angle-down";
          stretchArea.append(stretchIcon);

          if (memberId == data[i].togetherWriter) {
            const boardBtnDiv = document.createElement("div");
            boardBtnDiv.className = "board_btn";

            const modButton = document.createElement("button");
            modButton.type = "button";
            modButton.className = "btn btn-sm btn-outline-primary modBoard";
            modButton.innerHTML = "수정";
            modButton.setAttribute("togetherNo", data[i].togetherNo);

            const delButton = document.createElement("button");
            delButton.type = "button";
            delButton.className = "btn btn-sm btn-outline-danger delBoard";
            delButton.innerHTML = "삭제";
            delButton.setAttribute("togetherNo", data[i].togetherNo);

            boardBtnDiv.append(modButton);
            boardBtnDiv.append(delButton);
            boardWriterArea.append(boardBtnDiv);
          }
          $(".content_area").prepend(content);
        }
        notify.find("#newCount").html("+0");
        notify.attr("loadNum", "");
        notify.hide();
        $("html, body").animate({ scrollTop: 0 }, 400);
      }
    },
    error: function () {
      console.log("서버 접속에 실패");
    },
  });
});
