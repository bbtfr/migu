Migu.Widgets.PaginateA = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/paginate.append")

  requiredParams: [
    "data"
    "paginateUrl"
  ]

  optionalParams: {
    "currPage": 1
  }

  events:
    "click .more": "more"

  more: (event) ->
    event.preventDefault()
    @renderPage(@currPage+1)

  _createWidget: (options) ->
    if @widget = Migu.createWidget(options)
      @$container.append(@widget.$el)

  _updateMoreBtnVms: (rid) ->
    @$more.attr("vms", @generateVms(@generateRid(rid), @generateLid(0)))

  _renderPage: (options, n) ->
    if options["type"] == "NoMorePage"
      @$(".more").hide()
    else
      # For generate VMS
      total = 0
      total += @data[i]?["data"].length for i in [0..n-2] if n > 1

      options["vmsTemplate"] = @vmsTemplate
      options["ridOffset"] = @ridOffset + total
      options["lidOffset"] = @lidOffset

      @_createWidget(options)

      total += @data[n-1]?["data"].length
      @_updateMoreBtnVms(total)
    @currPage = n

  renderPage: (n) ->
    if @data[n-1]
      @_renderPage(@data[n-1], n)
    else
      url = @paginateUrl.replace("$PAGE", n)
      Migu.loader url, (data) =>
        @data[n-1] = data
        @_renderPage(data, n)

  _afterRender: () ->
    @$more = @$(".more")
    @$container = @$(".paginate-container")

    @renderPage(1)

Migu.registerCreateWidgetCallback (options) ->
  if options["paginateUrl"]? and options["type"] != "Paginate"
    options =
      type: "Paginate"
      paginateUrl: deleted(options, "paginateUrl")
      vmsTemplate: deleted(options, "vmsTemplate")
      ridOffset: deleted(options, "ridOffset")
      lidOffset: deleted(options, "lidOffset")
      data: if options["data"] then [ options ] else []
  options
