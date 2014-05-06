#= require implements/libs/idangerous.swiper
#= require implements/templates/widgets/slider.idangerous.swiper

Migu.Widgets.Slider = Migu.Widget.extend

  template: Migu.loadTemplate("implements/templates/widgets/slider.idangerous.swiper")

  className: "swiper-container"

  _afterRender: ->
    @swiper = @$el.swiper
      calculateHeight: true
    Migu.index.wrapper.once "createPage:after", =>
      @swiper.resizeFix()
