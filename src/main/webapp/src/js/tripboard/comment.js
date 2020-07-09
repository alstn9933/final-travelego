$(".autosize").on("keyup", function (event) {
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
});
