#= require libs/zepto/fx_methods
#= require libs/zepto/selector
#= require implements/libs/flexslider

Migu.Widgets.Tabs = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/tabs/tabs")

  className: "flexslider"

  _afterInitialize: (options) ->
    @parts = []

  _afterRender: ->
    $container = @$el.find(".tabs-container")

    for options in @data
      if widget = Migu.createWidget(options)
        $container.append(widget.$el.addClass("tab-container"))
        @parts.push(widget)

    @$el.flexslider
      selector: '.tabs-container > .tab-container'
      manualControls: @$el.find('nav li')
      activeControlNavClass: 'current'
      animation: 'slide'
      animationLoop: false
      slideshow: false
      directionNav: false
