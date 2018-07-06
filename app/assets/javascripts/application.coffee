# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery3
#= require jquery-ui
#= require jquery_ujs
#= require popper
#= require bootstrap
#= require turbolinks
#= require holder
#= require typekit
#= require typed
#= require smooth-scroll
#= require responsive-images
#= require_self
#= require_tree ./lib
#= require_tree ./utilities

window.App = {}

onDOMReady = ->
  $('[data-js="typed"]').appTyped()
  $('[data-js="auto-grow"]').appAutoGrow()
  $('[data-js="smooth-scroll"]').smoothScroll()

$(document).on('page:load turbolinks:load', onDOMReady)
