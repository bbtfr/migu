Migu.Widgets.Refresh = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/refresh")

  requiredParams: [
    "data"
    "refreshUrl"
  ]
  
  events:
    "click .refresh": "refresh"

  _createWidget: (options) ->
    if @widget = Migu.createWidget(options)
      @$container.html(@widget.$el)

  refresh: (event) ->
    event.preventDefault()
    Migu.loader @refreshUrl, (data) =>
      @_createWidget(data)

  _afterRender: () ->
    @$container = @$el.find(".refresh-container")
    @_createWidget(@data)

Migu.registerCreateWidgetCallback (options) ->
  if options["refreshUrl"]? and options["type"] != "Refresh"
    options =
      type: "Refresh"
      refreshUrl: deleted(options, "refreshUrl")
      data: options
  options
  