Migu.Views.PageWrapper = Backbone.View.extend

  events:
    "click a[href='#back']": "back"

  render: () ->
    @pages = []
    @hashes = []
    @$el.on TransitionEndEvent, =>
      @$el.removeClass("animate")
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

    lastPage = @pages[@pages.length-1]

    @$el.append(page.$el)
    @_pages("push", page)

    if @pages.length > 2
      @_pages("shift").remove()

    page.once "ready", =>
      @_activateMenuItem(page)
      @_setTimeout =>
        if @pages.length > 1
          # Scroll to top fix
          marginTop = page.$el.css("margin-top")
          page.$el.css("margin-top": @el.scrollTop)

          @$el.addClass("slideLeft animate")
          lastPage.$el.removeClass("active")
        page.$el.addClass("active")
        if @pages.length > 1
          @$el.one TransitionEndEvent, =>
            @_setTimeout =>
              # Scroll to top fix
              @el.scrollTop = 0
              page.$el.css("margin-top": marginTop)

              @$el.removeClass("slideLeft")
        @trigger("createPage:after")

    @trigger "createPage"

  back: (event) ->
    event.preventDefault() if event
    if @pages.length > 1
      page = @pages[0]
      lastPage = @pages[1]
      hash = @hashes[0]

      Migu.router.navigate(hash)
      @_activateMenuItem(page)

      @$el.addClass("slideRight animate")
      page.$el.addClass("active")
      lastPage.$el.removeClass("active")
      @$el.one TransitionEndEvent, =>
        @_setTimeout =>
          @$el.removeClass("slideRight")
          @_pages("pop").remove()

    @trigger "createPage"

