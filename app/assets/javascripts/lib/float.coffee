class App.Float

  constructor: (@options, @element) ->
    @$element = $(@element)
    @windowW  = $(window).width()

    defaults = {
      vertSpeed: 1
      horiSpeed: 1
    }

    @options = $.extend defaults, @options

    @_bind()

  _float: ($el, index)->
    $el.css 'position', 'absolute'
    opts    = @options
    windowH = $(window).height()
    thisH   = $el.height()
    parentW = ($(window).width() - $el.width()) / 2
    rand    = Math.random() * index * 1000
    current = $el
    $el.css
      top: -100
      display: 'block'

    floatInterval = setInterval ->
      current.css
        top: (n, v) ->
          if parseFloat(v) >= windowH + 300
            0
          else
            parseFloat(v) + opts.vertSpeed
        left: (n, v) ->
          (Math.sin((new Date).getTime() / (opts.horiSpeed * 1000) + rand) + 1) * parentW
    , 20

    $(window).resize =>
      if @windowW != $(window).width()
        clearInterval(floatInterval)

  _init: ->
    @$element.children().each (i, e)=>
      @_float($(e), i + 1)

  _bind: ->
    @_init()

    $(window).resize =>
      if @windowW != $(window).width()
        @_init()

$.widget.bridge 'appFloat', App.Float

