$(function (){
  $(document).on("click", ".favorite-link", function (e){
    var $link = $(this);
    e.preventDefault();

    $.post($link.attr("href")).done(function (response){
      $link.closest(".tweet").html(response);
    });
  });
});
