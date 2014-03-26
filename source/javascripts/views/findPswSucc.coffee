define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/findPswSucc.html')
  
  template    = _.template(tpl)

  Backbone.View.extend

    events:
      "click .back": "back"

    render: ->
      @$el.html(template())
      window.indexView.triggerChangePage()
      return @

    back: ->
      window.indexView.back()
      