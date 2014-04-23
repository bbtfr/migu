#= require views/login

Migu.Widgets.Register = Migu.Widget.extend
  
  template: Migu.loadTemplate("templates/widgets/registers/step1")

  stepTemplates:
    "Step2": Migu.loadTemplate("templates/widgets/registers/step2")

  tipsTemplate: Migu.loadTemplate("templates/widgets/registers/tips")

  events: Migu.Views.Login::events

  requiredParams: []

  _afterRender: () ->
    @currStep = 0
    @_initCountDown()
    
  _initCountDown: () ->
    @$countDown = @$el.find("[name='countDown']").hide()
    @$getToken = @$el.find("[name='getToken']").show()

  _showTips: (data) ->
    @$el.html(@tipsTemplate(data))

  gotoStep: (step) ->
    @$el.html(@stepTemplates["Step#{step}"]())
    @_initCountDown()
    @currStep = step

  submitForm: Migu.Views.Login::submitForm
  clickSubmit: Migu.Views.Login::clickSubmit
  _countDown: Migu.Views.Login::_countDown

  step1: (submitData, url) ->
    $.post url, submitData, (data) =>
      @gotoStep(2)

  step2: (submitData, url) ->
    $.post url, submitData, (data) =>
      @_showTips(data)

  getToken: (data) ->
    @_countDown()
