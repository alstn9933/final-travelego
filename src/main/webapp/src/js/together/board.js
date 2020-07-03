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
  $(this).find(".strech_area").slideToggle();
}

function showComment() {
  const icon = $(this).find(".fa-angle-down");

  if (icon.hasClass("icon_x_rotate")) {
    icon.removeClass("icon_x_rotate");
  } else {
    icon.addClass("icon_x_rotate");
  }

  $(this).next().slideToggle();
}
