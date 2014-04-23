Migu.Views.Page = Backbone.View.extend

  template: Migu.loadTemplate('templates/page')

  tagName: "article"

  className: "page-container"

  initialize: (options) ->
    console.info("Create Page", { options: options })
    console.time("Page")

    @url = required(options, "url")
    @parts = []

  _createWidget: (options) ->
    if widget = Migu.createWidget(options)
      @$container.append(widget.$el)
      @parts.push(widget)

  render: () ->
    @$el.html(@template())
    @$container = @$el.find(".container")

    Migu.index.header.removeActiveMenuItem()

    Migu.loader @url, 
      success: (data) =>
        @options = data
        
        for options in data["data"]
          @_createWidget(options)

      complete: () =>
        @trigger "ready"
        console.timeEnd("Page")

    @

