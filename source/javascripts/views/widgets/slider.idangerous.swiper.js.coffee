Migu.Widgets.SliderI = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/slider.idangerous.swiper")

  className: "swiper-container"

  _afterRender: ->
    @swiper = @$el.swiper
      calculateHeight: true
    Migu.index.wrapper.once "createPage:after", =>
      @swiper.resizeFix()
