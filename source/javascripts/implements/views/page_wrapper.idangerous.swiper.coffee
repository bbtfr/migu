#= require implements/libs/idangerous.swiper

Migu.Views.PageWrapper = Backbone.View.extend

  events:
    "click a[href='#back']": "back"

  render: ->
    @pages = []
    @hashes = []

    @$el.html('<div class="page-wrapper swiper-no-swiping"></div>')
    @swiper = @$el.swiper
      calculateHeight: false
      # cssWidthAndHeight: true
      noSwiping: true
      wrapperClass: "page-wrapper"
      onSlideChangeEnd: (swiper, to) =>
        if to == "next"
          if @pages.length > 2
            @_setTimeout =>
              @_pages("shift").remove()
              @swiper.removeSlide(0)
              @swiper.resizeFix()
        else if to == "prev"
          @_pages("pop").remove()
          @swiper.removeLastSlide()

    @

  _pages: (action, page) ->
    @hashes[action](window.location.hash if page?)
    @pages[action](page)

  _activateMenuItem: (page) ->
    Migu.index.header.activateMenuItem(page.options?["activeMenuId"])

  _setTimeout: (callback) ->
    setTimeout callback, 0

  createPage: (options) ->
    page = new Migu.Views.Page(options).render()
    @appendPage(page)

  appendPage: (page) ->
    @trigger("createPage:before")

    slide = @swiper.createSlide()
    
    page.$el.appendTo(slide)

    slide.append()
    @_pages("push", page)

    page.once "ready", =>
      @_activateMenuItem(page)
      if @pages.length > 1
        @_setTimeout =>
          @swiper.swipeNext()
      @trigger("createPage:after")

    @trigger "createPage"

  back: (event) ->
    event.preventDefault() if event
    if @pages.length > 1
      hash = @hashes[@hashes.length-2]
      page = @pages[@pages.length-2]

      Migu.router.navigate(hash, false)
      @_activateMenuItem(page)

      @swiper.swipePrev()

    @trigger "createPage"
