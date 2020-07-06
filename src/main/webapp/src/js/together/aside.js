$(".fold_area").click(function () {
  $(this).hide();
  $("aside").slideToggle();
});

$(".streched").click(function () {
  $(this).parent().slideToggle();
  setTimeout(function () {
    $(".fold_area").fadeToggle();
  }, 350);
});

$("#mainSearchRegion").keyup(function (e) {
  const keyword = $(this).val();

  $.ajax({
    url: "/together/searchRegion.do",
    type: "post",
    data: { keyword: keyword },
    success: function (data) {
      const list = $(".select_region");
      list.children().remove();
      if (data.length != 0) {
        for (let i = 0; i < data.length; i++) {
          const text = data[i].regionCountry + "-" + data[i].regionCity;
          let li = document.createElement("li");
          li.setAttribute("regionNo", data[i].regionNo);
          li.innerHTML = text;
          list.append(li);
        }
        $(".select_region").children().off();
        $(".select_region").children().on("click", selectRegion);
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
});
