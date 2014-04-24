#= require views/widgets/register

Migu.Widgets.FindPassword = Migu.Widgets.Register.extend
  
  stepTemplates: [
    Migu.loadTemplate("templates/widgets/find_passwords/step1")
  ]
  
  tipsTemplate: Migu.loadTemplate("templates/widgets/find_passwords/tips")

  step1: (submitData, url) ->
    $.post url, submitData, (data) =>
      @_showTips(data)
