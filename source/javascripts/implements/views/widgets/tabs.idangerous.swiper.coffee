#= require implements/libs/idangerous.swiper

Migu.Widgets.Tabs = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/tabs/tabs")

  events:
    "click nav li": "changeTab"

  _afterInitialize: (options) ->
    @parts = []

  _createWidget: (options) ->
    if widget = Migu.createWidget(options)
      widget.$el
        .addClass("swiper-slide tab-container")
      @$container.append(widget.$el)
      @parts.push(widget)

  _afterRender: ->
    @$container = $('<div class="swiper-wrapper"></div>')
      .appendTo(@$el.find(".tabs-container").addClass("swiper-container"))

    for options in @data
      @_createWidget(options)

    @_createTabs()

  _createTabs: ->
    @$tab = @$el.find("nav")
    @swiper = @$el.find(".tabs-container").swiper
      calculateHeight: true
      # cssWidthAndHeight: true
      # autoResize: false
      onSlideChangeStart: (swiper) =>
        @activateMenuItem(@swiper.activeIndex)
      onSwiperCreated: (swiper) =>
        @$tab.find("li:first-child").addClass('current')
      
    Migu.index.wrapper.once "createPage:after", =>
      @swiper.resizeFix()

  activateMenuItem: (index) ->
    @$tab.find("li.current").removeClass('current')
    @$tab.find("li").eq(index).addClass('current')

  changeTab: (event) ->
    event.preventDefault()
    index = $(event.target).index()
    @activateMenuItem(index)
    @swiper.swipeTo(index)
