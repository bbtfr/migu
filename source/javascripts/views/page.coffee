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
    @$container = @$(".container")

    Migu.index.header.removeActiveMenuItem()

    Migu.loader @url, 
      success: (data) =>
        @options = data

        # For generate VMS
        if @options["vmsTemplate"]
          @vmsTemplate = @options["vmsTemplate"]
        else if @options["vmsPrefix"]
          @vmsTemplate = "#{@options["vmsPrefix"]}S$SIDR$RIDL$LID"
        
        for options, i in data["data"]
          if @vmsTemplate
            options["vmsTemplate"] = @vmsTemplate.replace("$SID", i+1)

          @_createWidget(options)

        @$(".footer").show()

      complete: () =>
        @trigger "ready"
        console.timeEnd("Page")

    @

