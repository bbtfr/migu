#= require views/widgets/register

Migu.Widgets.BindMobile = Migu.Widgets.Register.extend

  stepTemplates: [
    Migu.loadTemplate("templates/widgets/bind_mobiles/step1")
  ]

  tipsTemplate: Migu.loadTemplate("templates/widgets/bind_mobiles/tips")

  step1: (submitData, url) ->
    $.post url, submitData, (data) =>
      @_showTips(data)
