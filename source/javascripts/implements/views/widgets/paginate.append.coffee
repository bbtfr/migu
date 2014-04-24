#= require implements/templates/widgets/paginate.append

Migu.Widgets.Paginate = Migu.Widget.extend

  template: Migu.loadTemplate("implements/templates/widgets/paginate.append")

  requiredParams: [
    "data"
    "paginateUrl"
  ]

  optionalParams: {
    "vms": null
    "currPage": 1
  }

  events:
    "click .more": "more"

  more: (event) ->
    event.preventDefault()
    @renderPage(@currPage+1)

  _afterInitialize: () ->
    dataObj = {}
    for o, i in @data
      dataObj[i+1] = o
    @data = dataObj

  _createWidget: (options) ->
    if @widget = Migu.createWidget(options)
      @$container.append(@widget.$el)

  _renderPage: (data, n) ->
    @_createWidget(data)
    @currPage = n

  renderPage: (n) ->
    if @data[n]
      @_renderPage(@data[n], n)
    else
      url = @paginateUrl.replace("$PAGE", n)
      Migu.loader url, (data) =>
        @data[n] = data
        @_renderPage(data, n)

  _afterRender: () ->
    @$pageBox = @$el.find(".pageBox")
    @$container = @$el.find(".paginate-container")

    @renderPage(1)

Migu.registerCreateWidgetCallback (options) ->
  if options["paginateUrl"]? and options["type"] != "Paginate"
    options =
      type: "Paginate"
      paginateUrl: deleted(options, "paginateUrl")
      totalPage: deleted(options, "totalPage") || 10
      data: if options["data"] then [ options ] else []
  options
