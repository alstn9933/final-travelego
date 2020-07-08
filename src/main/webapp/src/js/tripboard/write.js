CKEDITOR.replace("editor4", {
  filebrowserUploadUrl: "/mine/imageUpload.do",
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
