define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/regSucc.html')
  
  template    = _.template(tpl)

  Backbone.View.extend

    events:
      "click .back": "back"

    initialize: (options={}) ->
      @success = options["success"] || true

    render: ->
      @$el.html(template(success: @success))
      window.indexView.triggerChangePage()
      return @

    back: ->
      window.indexView.back()
      