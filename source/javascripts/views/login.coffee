#= require libs/zepto/form
#= require libs/zepto/fx_methods

Migu.Views.Login = Backbone.View.extend

  events:
    "submit form": "submitForm"
    "click input[type='submit']": "clickSubmit"

  render: () ->
    @$countDown = @$el.find("[name='countDown']").hide()
    @$getToken = @$el.find("[name='getToken']").show()
    @

  open: () ->
    @$el.fadeIn()

  close: () ->
    @$el.fadeOut()

  _countDown: () ->
    @$countDown.show()
    @$getToken.hide()
    
    countDown = 60
    @$countDown.val("还剩#{countDown}秒")

    index = setInterval =>
      if countDown > 0
        countDown -= 1
        @$countDown.val("还剩#{countDown}秒")
      else
        @$getToken.show()
        @$countDown.hide()
        clearInterval index
    , 1000

  _validateToken: (token) ->
    unless token.match /\d{6}/g
      Migu.loading.info "您输入的短信验证码有误"
      return false
    return true

  _validateMobile: (mobile) ->
    unless mobile.match /\d{11}/g
      Migu.loading.info "您输入的手机号码有误"
      return false
    return true

  clickSubmit: (event) ->
    @submitName = $(event.target).attr("name")

  submitForm: (event) ->
    event.preventDefault()
    if submit = required(@, @submitName)
      submitData = {}
      for o in $(event.target).serializeArray()
        submitData[o.name] = o.value
      url = $(event.target).attr("url")
      submit.call(@, submitData, url)
