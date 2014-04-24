#= require libs/zepto/form
#= require libs/zepto/fx_methods

Migu.FormWidget = Migu.Widget.extend

  requiredParams: []
  type: "Form"

  events:
    "submit form": "submitForm"
    "click input[type='submit']": "clickSubmit"
    "click input[type='submit'][name='retry']": "retry"

  _afterRender: () ->
    @_initCountDown()
    
  _initCountDown: () ->
    @$countDown = @$el.find("[name='countDown']").hide()
    @$getToken = @$el.find("[name='getToken']").show()

  open: () ->
    @$el.fadeIn()

  close: () ->
    @$el.fadeOut()

  countDown: () ->
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

  _callSubmit: (submit) ->
    console.debug "Call Submit", { submit: submit }
    submit["submit"].call(@, submit["submitData"], submit["url"]) if submit

  submitForm: (event) ->
    event.preventDefault()
    if submit = required(@, @submitName)
      submitData = {}
      for o in $(event.target).serializeArray()
        submitData[o.name] = o.value
      url = $(event.target).attr("url")

      # Save data for retry
      @submit =
        submit: submit
        submitName: @submitName
        submitData: submitData
        url: url

      @_callSubmit(@submit)

  retry: (event) ->
    event.preventDefault() if event
    @_callSubmit(@submit)

  back: () ->
    @render()
