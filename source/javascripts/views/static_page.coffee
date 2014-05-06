Migu.Views.StaticPage = Backbone.View.extend

  template: Migu.loadTemplate('templates/page')

  tagName: "article"

  className: "page-container"

  initialize: (options) ->
    console.info("Create Page", { options: options })
    console.time("Page")

    @Widget = required(options, "Widget")

  render: () ->
    @$el.html(@template())
    @$container = @$(".container")

    Migu.index.header.removeActiveMenuItem()

    @widget = new @Widget().render()
    @$container.html(@widget.$el)

    @trigger "ready"
    console.timeEnd("Page")

    @
