define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpl           = require('text!tpl/reg2.html')

  template      = _.template(tpl)

  Backbone.View.extend

    render: () ->
      @$el.html(template())
      window.indexView.triggerChangePage()
      return @

    reg: ->
      @mobile = @$el.find(".mobile").val()
      @password = @$el.find(".token").val()
      @password_confirmation = @$el.find(".password_confirmation").val()

      @loader = new Loader url, {}, (data) =>
        $.cookie 'login', $.param(data)
        window.login = data
        window.router.navigate('/reg2', true)