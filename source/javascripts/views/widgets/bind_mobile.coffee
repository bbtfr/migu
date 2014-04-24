#= require views/widgets/wizzard

Migu.Widgets.BindMobile = Migu.Widgets.Wizzard.extend

  stepTemplates: [
    Migu.loadTemplate("templates/widgets/bind_mobiles/step1")
  ]

  tipsTemplate: Migu.loadTemplate("templates/widgets/bind_mobiles/tips")

  step1: (submitData, url) ->
    Migu.post url, submitData, (data) =>
      @_showTips(data)
