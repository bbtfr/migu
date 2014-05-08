Migu.Widgets.PaginateN = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/paginate")

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

  _updatePagirateBtnVms: (total, n) ->
    @$pageBox.val(n)

  _renderPage: (options, n) ->
    if options["type"] == "NoMorePage"
      @$(".refresh").hide()
    else
      # For generate VMS
      total = options["data"].length

      options["vmsTemplate"] = @vmsTemplate
      options["ridOffset"] = @ridOffset
      options["lidOffset"] = @lidOffset

      @_createWidget(options)
      @_updatePagirateBtnVms(total, n)
    @currPage = n

  renderPage: (n) ->
    if n > 0 and n <= @totalPage
      if @data[n]
        @_renderPage(@data[n], n)
      else
        url = @paginateUrl.replace("$PAGE", n)
        Migu.loader url, (data) =>
          @data[n] = data
          @_renderPage(data, n)

  _afterRender: () ->
    @$pageBox = @$(".pageBox")
    @$container = @$(".paginate-container")

    @renderPage(1)

Migu.registerCreateWidgetCallback (options) ->
  if options["paginateUrl"]? and options["type"] != "Paginate"
    options =
      type: "Paginate"
      paginateUrl: deleted(options, "paginateUrl")
      totalPage: deleted(options, "totalPage") || 10
      data: if options["data"] then [ options ] else []
  options
  