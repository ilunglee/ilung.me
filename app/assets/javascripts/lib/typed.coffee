class App.Typed

  constructor: (@options, @element) ->
    @$element = $(@element)

    defaults = {
      loop: 'infinite'
      cursorChar: '|'
      typeSpeed: 10
      startDelay: 0
      backDelay: 8000
    }

    @options = $.extend defaults, @options

    @_bind()

  _bind: ->
    @options = $.extend @options, @$element.data('typed-options')
    @$element.removeData 'typed'
    @$element.typed @options

$.widget.bridge 'appTyped', App.Typed
