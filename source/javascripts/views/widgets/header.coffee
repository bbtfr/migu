Migu.Widgets.Header = Migu.Widget.extend
  
  template: Migu.loadTemplate("templates/widgets/header")

  requiredParams: [
    "data"
    "header"
  ]

  render: () ->
    @remove()
    @widget = Migu.newWidget(@data)
    @widget.once "ready", () =>
      @widget.$el.prepend(@template(@options))
    @widget.render()

Migu.registerCreateWidgetCallback (options) ->
  if options["header"]? and options["type"] != "Header"
    options =
      type: "Header"
      header: deleted(options, "header")
      headerBack: deleted(options, "headerBack")
      headerTextCenter: deleted(options, "headerTextCenter")
      data: options
  options