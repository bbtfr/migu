Migu.Widgets.Refresh = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/refresh")

  requiredParams: [
    "data"
    "refreshUrl"
  ]
  
  optionalParams: {
    "currPage": 1
  }

  events:
    "click .refresh": "refresh"

  refresh: (event) ->
    event.preventDefault()
    @renderPage(@currPage+1)

  _createWidget: (options) ->
    if @widget = Migu.createWidget(options)
      @$container.html(@widget.$el)

  _updateRefreshBtnVms: (rid) ->
    @$refresh.attr("vms", @generateVms(@generateRid(rid), @generateLid(0)))

  _renderPage: (options, n) ->
    if options["type"] == "NoMorePage"
      $(".refresh").hide()
    else
      # For generate VMS
      total = options["data"].length

      options["vmsTemplate"] = @vmsTemplate
      options["ridOffset"] = @ridOffset
      options["lidOffset"] = @lidOffset
      @_createWidget(options)
      @_updateRefreshBtnVms(total)
    @currPage = n

  renderPage: (n) ->
    if @data[n-1]
      @_renderPage(@data[n-1], n)
    else
      url = @refreshUrl.replace("$PAGE", n)
      Migu.loader url, (data) =>
        @data[n-1] = data
        @_renderPage(data, n)
        
  _afterRender: () ->
    @$refresh = @$(".refresh")
    @$container = @$(".refresh-container")

    @renderPage(1)

Migu.registerCreateWidgetCallback (options) ->
  if options["refreshUrl"]? and options["type"] != "Refresh"
    options =
      type: "Refresh"
      refreshUrl: deleted(options, "refreshUrl")
      vmsTemplate: deleted(options, "vmsTemplate")
      ridOffset: deleted(options, "ridOffset")
      lidOffset: deleted(options, "lidOffset")
      data: if options["data"] then [ options ] else []
  options
  