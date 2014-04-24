#= require views/form_widget

Migu.Widgets.Wizzard = Migu.FormWidget.extend
  
  stepTemplates: []
  
  _afterInitialize: () ->
    @template ||= @stepTemplates[0]

  _afterRender: () ->
    @currStep = 0
    @_initCountDown()

  _showTips: (data) ->
    @$el.html(@tipsTemplate(data))

  gotoStep: (step) ->
    @$el.html(@stepTemplates[step-1]())
    @_initCountDown()
    @currStep = step
