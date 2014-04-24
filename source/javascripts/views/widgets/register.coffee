#= require views/widgets/wizzard

Migu.Widgets.Register = Migu.Widgets.Wizzard.extend
  
  stepTemplates: [
    Migu.loadTemplate("templates/widgets/registers/step1")
    Migu.loadTemplate("templates/widgets/registers/step2")
  ]

  tipsTemplate: Migu.loadTemplate("templates/widgets/registers/tips")

  step1: (submitData, url) ->
    Migu.post url, submitData, (data) =>
      @gotoStep(2)

  sendToken: (submitData, url) ->
    Migu.post url, submitData, (data) =>
      @_showTips(data)

  getToken: (data) ->
    @countDown()
    