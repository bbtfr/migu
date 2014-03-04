define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpl           = require('text!tpl/reg.html')

  template      = _.template(tpl)

  Loader        = require('utils/post_loader')

  url = "api/reg.json"

  Backbone.View.extend

    events:
      "click .next": "reg"
  
    render: () ->
      @$el.html(template())
      window.indexView.triggerChangePage()
      return @

    reg: ->
      @mobile = @$el.find(".mobile").val()
      @password = @$el.find(".password").val()
      @password_confirmation = @$el.find(".password_confirmation").val()

      @loader = new Loader url, {}, (data) =>
        window.router.navigate("/reg2", true)
      , (data) =>
        window.router.navigate("/reg3", true)