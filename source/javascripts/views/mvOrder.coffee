define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/mvOrder.html')

  template     = _.template(tpl)

  Backbone.View.extend

    events:
      "click .submit": "submit"
      "click .back": "back"

    render: ->
      @$el.html(template())
      
      window.indexView.triggerChangePage()

      return @

    submit: (event) ->
      console.log("Do something")
