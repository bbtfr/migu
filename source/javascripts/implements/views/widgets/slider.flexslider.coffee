#= require libs/zepto/fx_methods
#= require libs/zepto/selector
#= require implements/libs/flexslider
#= require implements/templates/widgets/slider.flexslider

Migu.Widgets.Slider = Migu.Widget.extend

  template: Migu.loadTemplate("implements/templates/widgets/slider.flexslider")

  className: "flexslider"

  _afterRender: ->
    @$el.flexslider
      animation: 'slide'
      directionNav: false
