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
