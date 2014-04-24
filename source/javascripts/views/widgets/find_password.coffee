#= require views/widgets/wizzard

Migu.Widgets.FindPassword = Migu.Widgets.Wizzard.extend
  
  stepTemplates: [
    Migu.loadTemplate("templates/widgets/find_passwords/step1")
  ]
  
  tipsTemplate: Migu.loadTemplate("templates/widgets/find_passwords/tips")

  step1: (submitData, url) ->
    Migu.post url, submitData, (data) =>
      @_showTips(data)
