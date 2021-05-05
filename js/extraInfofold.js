<script type="text/javascript">
$(document).ready(function() {
  $extraInfofolds = $(".extraInfo");
  $extraInfofolds.wrapInner("<div class=\"info-fold-blck\">"); // wrap a div container around content
  $extraInfofolds.prepend("<button class=\"info-fold-btn\" style=\"border-style=solid; border-color: black; padding: 12px 25px; font-size: larger; background-color=LightSlateGrey\">Extra information: Show</button>");  // add a button
  $(".info-fold-blck").toggle();  // fold all blocks
  $(".info-fold-btn").on("click", function() {  // add onClick event
    $(this).text($(this).text() === "Extra information: Hide" ? "Extra information: Show" : "Extra information: Hide");  // if the text equals "Extra information: Hide", change it to "Extra information: Show"or else to "Extra information: Hide" 
    $(this).next(".info-fold-blck").toggle("linear");  // "swing" is the default easing function. This can be further customized in its speed or the overall animation itself.
  })
});

</script>


