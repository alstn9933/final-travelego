$("#submitBtn").click(function () {
  $("#writeForm").submit();
});

$("#writeForm").submit(function (e) {
  const postData = $(this).serializeArray();
  const formUrl = $(this).attr("action");

  $.ajax({
    url: formUrl,
    type: "POST",
    data: postData,
    success: function (data) {
      if (data == "1") {
        cleanWriteForm();
        $("#staticBackdrop").modal("hide");
        alert("게시글을 등록하였습니다.");
      } else {
        alert("실패!");
      }
    },
    error: function () {
      alert("실패!");
    },
  });
  e.preventDefault();
});

function cleanWriteForm() {
  $("#inputRegion").val("");
  $("#inputTitle").val("");
  $("#inputContent").val("");
}

$("#inputRegion").keypress(function (event) {
  if (event.keyCode == 13) {
    event.preventDefault();
    return false;
  }
});

$("#inputRegion").keyup(function (event) {
  const key = event.key;
  const current = $("#selected_region");
  if (key.includes("Arrow")) {
    if (key.includes("Up")) {
      const next = current.prev();
      if (next.length != 0) {
        current.removeAttr("id");
        next.attr("id", "selected_region");
      }
    } else if (key.includes("Down")) {
      const next = current.next();
      if (next.length != 0) {
        current.removeAttr("id");
        next.attr("id", "selected_region");
      }
    }
  } else if (event.keyCode == 13) {
    $(this).val(current.html());
    $("#regionNo").val(current.attr("regionNo"));
    $(".list-group").children().remove();
    // setTimeout(function () {
    // }, 200);
  } else {
    const keyword = $(this).val();

    $.ajax({
      url: "/together/searchRegion.do",
      type: "post",
      data: { keyword: keyword },
      success: function (data) {
        const list = $(".list-group");
        list.children().remove();
        if (data.length != 0) {
          for (let i = 0; i < data.length; i++) {
            const text = data[i].regionCountry + "-" + data[i].regionCity;
            let li = document.createElement("li");
            if (i == 0) {
              li.id = "selected_region";
            }
            li.classList.add("list-group-item");
            li.setAttribute("regionNo", data[i].regionNo);
            li.innerHTML = text;
            li.addEventListener("click", listClick);
            li.addEventListener("mouseenter", listHover);
            list.append(li);
          }
        } else {
          let li = document.createElement("li");
          li.classList.add("list-group-item");
          li.innerHTML = "조회 결과가 없습니다.";
          list.append(li);
        }
      },
      error: function () {
        alert("서버 연결에 실패하였습니다.");
      },
    });
  }
});

$("#inputRegion").on("search focusout", function (event) {
  $(".list-group").children().remove();
  event.preventDefault();
  return false;
});

function listClick() {
  $("#inputRegion").val($(this).html());
  $("#regionNo").val($(this).attr("regionNo"));
  $(".list-group").children().remove();
}

function listHover() {
  $("#selected_region").removeAttr("id");
  $(this).attr("id", "selected_region");
}
