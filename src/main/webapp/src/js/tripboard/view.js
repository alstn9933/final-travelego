$("#delBtn").click(function () {
  if (confirm("게시글을 삭제하시겠습니까?")) {
    location.href = "/tripboard/delete.do?boardNum=" + $(this).attr("boardNum");
  }
});

$("#modBtn").click(function () {
  if (confirm("게시글을 수정하시겠습니까?")) {
    location.href =
      "/tripboard/modifyFrm.do?boardNum=" + $(this).attr("boardNum");
  }
});

$("#goListBtn").click(function () {
  location.href = "/tripboard/main.do?reqPage=1";
});
