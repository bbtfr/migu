#= require views/widgets/register

Migu.Widgets.BindMobile = Migu.Widgets.Register.extend
  
  template: Migu.loadTemplate("templates/widgets/bind_mobiles/step1")

  stepTemplates: {}

  tipsTemplate: Migu.loadTemplate("templates/widgets/bind_mobiles/tips")

  step1: (submitData, url) ->
    $.post url, submitData, (data) =>
      @_showTips(data)
