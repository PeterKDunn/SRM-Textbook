<script type="text/javascript">
$(document).ready(function() {
  $folds = $(".fold");
  $folds.wrapInner("<div class=\"fold-blck\">"); // wrap a div container around content
  $folds.prepend("<button class=\"fold-btn\" style=\"border-style=solid; border-color: black; padding: 12px 25px; font-size: larger; background-color=LightSteelBlue\">Answer: Reveal</button>");  // add a button
  $(".fold-blck").toggle();  // fold all blocks
  $(".fold-btn").on("click", function() {  // add onClick event
    $(this).text($(this).text() === "Answer: Hide" ? "Answer: Reveal" : "Answer: Hide");  // if the text equals "Fold", change it to "Unfold"or else to "Fold" 
    $(this).next(".fold-blck").toggle("linear");  // "swing" is the default easing function. This can be further customized in its speed or the overall animation itself.
  })
});
</script>
