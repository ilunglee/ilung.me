class App.Ellipsis

  constructor: (@options, @element) ->
    @$element = $(@element)
    @$parent  = @$element.parent()

    defaults = {
      suffix: '...'
      data:   'original'
    }

    @options = $.extend defaults, @options

    @_bind()

  _reset: ->
    @$element.text @$element.data(@options.data)

  _format: ->
    @text = $(@element).data(@options.data)
    h     = @$parent.height()

    while @$element.height() > h
      @$element.text (_index, text) =>
        text.replace /\W*\s(\S)*$/, @options.suffix

  _bind: ->
    @options = $.extend @options, @$element.data('ellipsis-options')

    @_format()

    $(window).resize =>
      @_reset()
      @_format()

$.widget.bridge 'appEllipsis', App.Ellipsis
