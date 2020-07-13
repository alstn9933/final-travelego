CKEDITOR.replace("editor4", {
  filebrowserUploadUrl: "/tripboard/imageUpload.do",
  height: "600px",
  toolbarGroups: [
    { name: "clipboard", groups: ["clipboard", "undo"] },
    { name: "editing", groups: ["find", "selection", "spellchecker"] },
    { name: "links" },
    { name: "insert" },
    { name: "forms" },
    { name: "tools" },
    { name: "document", groups: ["mode", "document", "doctools"] },
    { name: "others" },
    { name: "basicstyles", groups: ["basicstyles", "cleanup"] },
    {
      name: "paragraph",
      groups: ["list", "indent", "blocks", "align", "bidi"],
    },
    { name: "styles" },
    { name: "colors" },
    { name: "about" },
  ],
});

// 일정 선택 로직
$(".modal-body tr").click(function () {
  const tripNo = $(this).attr("tripNo");
  const tr = $(this);
  $.ajax({
    url: "/tripboard/asyncLoadTripRoute.do",
    type: "POST",
    data: { tripNo: tripNo },
    success: function (data) {
      let tripRoute = "";
      let tripDate = data[0].tripDate;
      for (let i = 0; i < data.length; i++) {
        if (i == 0) {
          tripRoute +=
            "1일차 : " +
            data[i].tripSpot.substring(0, data[i].tripSpot.indexOf(","));
        } else {
          if (tripDate == data[i].tripDate) {
            tripRoute += " - ";
          } else {
            tripRoute += "\n" + data[i].tripDate + "일차 : ";
          }
          tripRoute += data[i].tripSpot.substring(
            0,
            data[i].tripSpot.indexOf(",")
          );
        }

        tripDate = data[i].tripDate;
      }

      $("#inputRegion").val(tr.find("td").eq(0).html());
      $("#inputRegion").attr("readonly", true);
      $("#inputRegionNo").val(tr.attr("regionNo"));
      $("#inputTripDay").val(
        tr.attr("tripDay") + "박" + (Number(tr.attr("tripDay")) + 1) + "일"
      );
      $("#textRoute").val(tripRoute);
      $(".route_container").find("span").hide();
      $("#textRoute").show();
      $("#selectTripModal").modal("hide");
    },
    error: function () {
      console.log("서버 접속에 실패하였습니다.");
    },
  });
});

// 대표 이미지 업로드 미리보기
$("#inputMainImg").on("change", mainImgUpload);
function mainImgUpload(input) {
  $(".img_container > span").hide();
  var reader = new FileReader();
  reader.onload = function () {
    var output = document.getElementById("mainImg");
    output.src = reader.result;
  };
  reader.readAsDataURL(event.target.files[0]);
  $("#mainImg").show();
}
