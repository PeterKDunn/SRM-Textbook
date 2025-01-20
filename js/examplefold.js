<script type="text/javascript">
$(document).ready(function() {
  $examplefolds = $(".exampleExtra");
  $examplefolds.wrapInner("<div class=\"example-fold-blck\">"); // wrap a div container around content
  $examplefolds.prepend("<button class=\"example-fold-btn\" style=\"border-style=solid; border-color: black; padding: 12px 25px; font-size: larger; background-color=LightSlateGrey\">Example: Show</button>");  // add a button
  $(".example-fold-blck").toggle();  // fold all blocks
  $(".example-fold-btn").on("click", function() {  // add onClick event
    $(this).text($(this).text() === "Extra example: Hide" ? "Extra example: Show" : "Extra example: Hide");  // if the text equals "Example: Hide", change it to "Example: Show"or else to "Example: Hide" 
    $(this).next(".example-fold-blck").toggle("linear");  // "swing" is the default easing function. This can be further customized in its speed or the overall animation itself.
  })
});

</script>


