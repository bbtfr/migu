#= require implements/templates/widgets/paginate

Migu.Widgets.Paginate = Migu.Widget.extend

  template: Migu.loadTemplate("implements/templates/widgets/paginate")

  requiredParams: [
    "data"
    "paginateUrl"
    "totalPage"
  ]

  optionalParams: {
    "currPage": 1
  }

  events:
    "click .prev": "prev"
    "click .next": "next"
    "click .pageBtn": "goto"

  _afterInitialize: () ->
    dataObj = {}
    for o, i in @data
      dataObj[i+1] = o
    @data = dataObj

  prev: (event) ->
    event.preventDefault()
    @renderPage(@currPage-1)

  next: (event) ->
    event.preventDefault()
    @renderPage(@currPage+1)

  goto: (event) ->
    event.preventDefault()
    @renderPage(parseInt(@$pageBox.val()))

  _createWidget: (options) ->
    if @widget = Migu.createWidget(options)
      @$container.html(@widget.$el)

  _renderPage: (data, n) ->
    @_createWidget(data)
    @$pageBox.val(n)
    @currPage = n

  renderPage: (n) ->
    if n > 0 and n <= @totalPage
      if @data[n]?
        @_renderPage(@data[n], n)
      else
        url = @paginateUrl.replace("$PAGE", n)
        Migu.loader url, (data) =>
          @data[n] = data
          @_renderPage(data, n)

  _afterRender: () ->
    @$pageBox = @$el.find(".pageBox")
    @$container = @$el.find(".paginate-container")

    @_createWidget(@data[1])

Migu.registerCreateWidgetCallback (options) ->
  if options["paginateUrl"]? and options["type"] != "Paginate"
    options =
      type: "Paginate"
      paginateUrl: deleted(options, "paginateUrl")
      totalPage: deleted(options, "totalPage") || 10
      data: [ options ]
  options