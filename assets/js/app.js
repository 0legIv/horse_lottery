// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

$('tr').click(function() {
  var $modal_id = $(this).attr('data-target');
  var $modal = document.getElementById($modal_id);
  $("#" + $modal_id).modal();
  // console.log($modal);
  // if($modal.classList.contains('show')) {
  //   $modal.classList.remove('show')
  // } else {
  //   $modal.classList.add('show')
  // }
});