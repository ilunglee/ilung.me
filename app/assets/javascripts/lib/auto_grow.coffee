class App.AutoGrow

  constructor: (@options, @element) ->
    @$element = $(@element)

    @_bind()

  _bind: ->
    @$element.on 'input', ->
      $(@).css 'height', ''
      h = $(@).get(0).scrollHeight
      $(@).height h

$.widget.bridge 'appAutoGrow', App.AutoGrow
