Migu.Widgets.StaticTabs = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/tabs/tabs")

  events:
    "click nav li": "changeTab"

  _afterInitialize: () ->
    @parts = {}

  _createWidget: (options, n) ->
    if widget = Migu.createWidget(options)
      @$container.html(widget.$el)
      @parts[n] = widget

  _renderTab: (options, n) ->
    # For generate VMS
    options["vmsTemplate"] = @vmsTemplate
    options["ridOffset"] = @ridOffset
    options["lidOffset"] = @lidOffset

    @_createWidget(options, n)

  renderTab: (n) ->
    if @parts[n]
      @$container.html(@parts[n].$el)
    else
      @_renderTab(@data[n-1], n)
    @activateMenuItem(n)

  activateMenuItem: (n) ->
    @$tab.find("li.current").removeClass('current')
    @$tab.find("li").eq(n-1).addClass('current')

  changeTab: (event) ->
    event.preventDefault()
    index = $(event.target).index() + 1
    @renderTab(index)

  _afterRender: () ->
    @$container = @$(".tabs-container")
    @$tab = @$("nav")

    @renderTab(1)
