define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/findPsw.html')

  template    = _.template(tpl)

  Loader      = require('utils/loader')

  urls =
    token: "api/token.json"
    findpassword: "api/findpassword.json"
    
  Backbone.View.extend

    events:
      "click .get_token": "get_token"
      "click .find_password": "find_password"

    render: ->
      @$el.html(template())
      window.indexView.triggerChangePage()
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
      console.log $wait

      index = setInterval =>
        if countdown > 0
          countdown -= 1
          $wait.val("还剩#{countdown}秒")
        else
          $get_token.show()
          $wait.hide()
          clearInterval index
      , 1000

    find_password: ->
      @token = @$el.find(".token").val()
      unless @token.match /\d{6}/g
        window.indexView.showInfo "您输入的短信验证码有误"
        return

      @password = @$el.find(".password").val()

      @loader = new Loader urls["findpassword"], (data) =>
        window.indexView.updateUsername(data)
        window.router.navigate('findPswSucc', true)
