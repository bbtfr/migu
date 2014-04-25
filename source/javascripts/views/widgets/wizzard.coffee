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
    step -= 1
    @$el.html(@stepTemplates[step]())
    @currStep = step
    @_initCountDown()

  nextStep: (submitData, url) ->
    Migu.post url, submitData,
      success: (data) =>
        @gotoStep(@currStep+1)
      error: () =>
        @_showTips(data)
