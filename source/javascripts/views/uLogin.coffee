define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpl           = require('text!tpl/uLogin.html')

  template      = _.template(tpl)

  Loader        = require('utils/loader')

  urls =
    token: "api/token.json"
    loginbytoken: "api/loginbytoken.json"
    loginbypass: "api/loginbypass.json"
    
  Backbone.View.extend
  
    events:
      "click .get_token": "get_token"
      "click .send_token": "send_token"
      "click .send_pass": "send_pass"
      "click .forget_password": "forget_password"
      "click .close": "remove"

    initialize: (options) ->
      @callback = options["callback"]

    render: ->
      @$el.html(template())
      window.loginDialog.triggerChangePage()
      return @

    get_token: ->
      countdown = 60
      @mobile = @$el.find(".mobile").val()
      unless @mobile.match /\d{11}/g
        window.indexView.showInfo "您输入的手机号码有误"
        return
      
      $get_token = @$el.find(".get_token").hide()

      @loader = new Loader urls["token"], (data) =>
        # nothing

      $wait = @$el.find(".wait").show()
      $wait.val("还剩#{countdown}秒")

      index = setInterval =>
        if countdown > 0
          countdown -= 1
          $wait.val("还剩#{countdown}秒")
        else
          $get_token.show()
          $wait.hide()
          clearInterval index
      , 1000

    send_token: ->
      @token = @$el.find(".token").val()
      unless @token.match /\d{6}/g
        window.indexView.showInfo "您输入的短信验证码有误"
        return

      @loader = new Loader urls["loginbytoken"], (data) =>
        window.indexView.updateUsername(data)
        @callback() if @callback
        @remove()

    send_pass: ->
      @pass = @$el.find(".pass").val()
      @password = @$el.find(".password").val()

      @loader = new Loader urls["loginbypass"], (data) =>
        window.indexView.updateUsername(data)
        @callback() if @callback
        @remove()

    forget_password: ->
      window.router.navigate('findPsw', true)
      @remove()

