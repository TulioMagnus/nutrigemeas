import Rails from "@rails/ujs";
import "@rails/activestorage";
import "channels";
import Turbolinks from 'turbolinks';

var jQuery = require("jquery")
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
import ApexCharts from 'apexcharts'
window.ApexCharts = ApexCharts

import 'stylesheets/application'
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all"
import 'admin-lte'
import 'jquery-mask-plugin/dist/jquery.mask.min'
import 'overlayscrollbars/js/jquery.overlayScrollbars.js'
import 'select2/dist/js/select2.js'
import 'jquery-mask-plugin/dist/jquery.mask.min'

import './utils'
import './masks'

Turbolinks.start();
window.Turbolinks = Turbolinks;
window.$ = $;

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
