define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpl           = require('text!tpl/reg3.html')

  template      = _.template(tpl)

  Backbone.View.extend

    events:
      "click .retry": "retry"
      "click .back": "back"

    render: () ->
      @$el.html(template())
      window.indexView.triggerChangePage()
      return @

    retry: ->
      window.router.navigate("/reg", true)

    back: ->
      window.router.navigate("/home", true)
