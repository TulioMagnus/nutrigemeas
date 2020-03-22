// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

var jQuery = require("jquery")
// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import 'stylesheets/application'
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all";
import 'admin-lte'
import 'overlayscrollbars/js/jquery.overlayScrollbars.js'

$(document).on('turbolinks:load', function() {
  $('body').tooltip({
    selector: '[data-toggle="tooltip"]',
    container: 'body',
  });

  $('body').popover({
    selector: '[data-toggle="popover"]',
    container: 'body',
    html: true,
    trigger: 'hover',
  });
});
