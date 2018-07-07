class App.Showcase

  constructor: (@options, @element) ->
    @$element = $(@element)
    @target   = @$element.data('target') || @element
    @$target  = $(@target)

    defaults = {
      activeKlass: 'showcase'
    }

    @options = $.extend defaults, @options

    @_bind()

  _bind: ->
    @options = $.extend @options, @$element.data('showcase-options')
    @$element.on 'click', (e)=>
      if $(e.target).data('action') == 'hide'
        $('body').css 'overflow', 'initial'
        @$target.removeClass @options.activeKlass
      else
        $('body').css 'overflow', 'hidden'
        @$target.addClass @options.activeKlass

$.widget.bridge 'appShowcase', App.Showcase
