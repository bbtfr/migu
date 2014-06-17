define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/mvOrder1.html')

  template     = _.template(tpl)

  Backbone.View.extend

    events:
      "click .submit": "submit"

    render: ->
      @$el.html(template())
      
      window.indexView.triggerChangePage()

      return @

    submit: (event) ->
      event.preventDefault()
      name = @$(".name").val()
      mobile = @$(".mobile").val()
      address = @$(".address").val()
      console.log name, mobile, address