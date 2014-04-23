#= require views/widgets/register

Migu.Widgets.FindPassword = Migu.Widgets.Register.extend
  
  template: Migu.loadTemplate("templates/widgets/find_passwords/step1")

  stepTemplates: {}

  tipsTemplate: Migu.loadTemplate("templates/widgets/find_passwords/tips")

  step1: (submitData, url) ->
    $.post url, submitData, (data) =>
      @_showTips(data)
