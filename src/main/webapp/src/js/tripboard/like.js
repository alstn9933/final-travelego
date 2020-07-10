$(document).on("click", "#likeBtn", function () {
  const boardNum = $(this).attr("boardNum");
  const span = $(this).find("span").eq(1);
  const button = $(this);

  $.ajax({
    url: "/tripboard/asyncLike.do",
    type: "POST",
    data: { boardNum: boardNum },
    success: function (data) {
      const result = Number(data);
      if (result >= 0) {
        span.html(data);
        button.attr("id", "unLikeBtn");
        button.find("i").eq(0).removeClass();
        button.find("i").eq(0).addClass("fas fa-heart");
      } else {
        alert("서버 접속에 실패했습니다!");
      }
    },
    error: function () {
      console.log("서버 접속에 실패했습니다.");
    },
  });
});

$(document).on("click", "#unLikeBtn", function () {
  const boardNum = $(this).attr("boardNum");
  const span = $(this).find("span").eq(1);
  const button = $(this);

  $.ajax({
    url: "/tripboard/asyncUnLike.do",
    type: "POST",
    data: { boardNum: boardNum },
    success: function (data) {
      const result = Number(data);
      if (result >= 0) {
        span.html(data);
        button.attr("id", "likeBtn");
        button.find("i").eq(0).removeClass();
        button.find("i").eq(0).addClass("far fa-heart");
      } else {
        alert("서버 접속에 실패했습니다!");
      }
    },
    error: function () {
      console.log("서버 접속에 실패했습니다.");
    },
  });
});

$(document).on("click", "#bookmarkBtn", function () {
  const boardNum = $(this).attr("boardNum");
  const button = $(this);
  $.ajax({
    url: "/tripboard/asyncBookmark.do",
    type: "POST",
    data: { boardNum: boardNum },
    success: function (data) {
      const result = Number(data);
      if (result > 0) {
        alert("게시글을 북마크하였습니다.");
        button.attr("id", "unBookmarkBtn");
        button.find("i").eq(0).removeClass();
        button.find("i").eq(0).addClass("fas fa-bookmark");
      } else {
        alert("서버 접속에 실패했습니다!");
      }
    },
    error: function () {
      console.log("서버 접속에 실패했습니다.");
    },
  });
});
$(document).on("click", "#unBookmarkBtn", function () {
  const boardNum = $(this).attr("boardNum");
  const button = $(this);
  if (confirm("북마크를 취소하시겠습니까?")) {
    $.ajax({
      url: "/tripboard/asyncUnBookmark.do",
      type: "POST",
      data: { boardNum: boardNum },
      success: function (data) {
        const result = Number(data);
        if (result > 0) {
          button.attr("id", "bookmarkBtn");
          button.find("i").eq(0).removeClass();
          button.find("i").eq(0).addClass("far fa-bookmark");
        } else {
          alert("서버 접속에 실패했습니다!");
        }
      },
      error: function () {
        console.log("서버 접속에 실패했습니다.");
      },
    });
  }
});
