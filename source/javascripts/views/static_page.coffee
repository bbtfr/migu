Migu.Views.StaticPage = Backbone.View.extend

  template: Migu.loadTemplate('templates/page')

  tagName: "article"

  className: "page-container"

  initialize: (options) ->
    console.info("Create StaticPage")
    console.debug(options)
    console.time("StaticPage")

    @Widget = required(options, "Widget")

  render: () ->
    @$el.html(@template())
    @$container = @$el.find(".container")

    Migu.index.header.removeActiveMenuItem()

    @widget = new @Widget().render()
    @$container.html(@widget.$el)

    @trigger "ready"
    console.timeEnd("StaticPage")

    @
