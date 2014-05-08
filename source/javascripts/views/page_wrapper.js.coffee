Migu.Views.PageWrapper = Backbone.View.extend

  events:
    "click a[href='#back']": "back"

  render: () ->
    @pages = []
    @hashes = []
    @

  _pages: (action, page) ->
    @hashes[action](window.location.hash if page?)
    @pages[action](page)

  _activateMenuItem: (page) ->
    Migu.index.header.activateMenuItem(page.options?["activeMenuId"])

  _setTimeout: (callback) ->
    setTimeout callback, 100

  createPage: (options) ->
    page = new Migu.Views.Page(options).render()
    @appendPage(page)

  appendPage: (page) ->
    @trigger("createPage")

    lastPage = @pages[@pages.length-1]

    @$el.append(page.$el)
    @_pages("push", page)

    if @pages.length > 2
      @_pages("shift").remove()

    page.once "ready", =>
      @_activateMenuItem(page)
      if @pages.length > 1
        @_setTimeout =>
          @$el.addClass("slideLeft animate")
          lastPage.$el.removeClass("active")
          page.$el.addClass("active")

          # Scroll to top fix
          overflowY = $("html").css("overflow-y")
          $("html").css("overflow-y", "hidden")
          paddingTop = page.$el.css("padding-top")
          page.$el.css("padding-top": document.body.scrollTop)

          @$el.one TransitionEndEvent, =>
            @_setTimeout =>
              @$el.removeClass("animate slideLeft")
            
            # Scroll to top fix
            $("html").css("overflow-y", overflowY)
            page.$el.css("padding-top": paddingTop)
            document.body.scrollTop = 0

          @trigger("createPage:after")
      else
        page.$el.addClass("active")
        @trigger("createPage:after")


  back: (event) ->
    @trigger "createPage"

    event.preventDefault() if event
    if @pages.length > 1
      page = @pages[0]
      lastPage = @pages[1]
      hash = @hashes[0]

      Migu.router.navigate(hash)
      @_activateMenuItem(page)

      @_setTimeout =>
        @$el.addClass("slideRight animate")
        page.$el.addClass("active")
        lastPage.$el.removeClass("active")
        @$el.one TransitionEndEvent, =>
          @_setTimeout =>
            @$el.removeClass("slideRight animate")
            @_pages("pop").remove()


