Migu.Routers.AppRouter = Backbone.Router.extend

  routes:
    "home": "home"
    "pages/url/*url": "pageFromUrl"
    "pages/:id": "pageFromId"

    "login(/*url)": "login"
    "play/:id(/:play_only)": "play"

    "search/*query": "search"
    "tariff/:id": "tariff"
    
    # static pages
    "register": "register"
    "bindMobile": "bind_mobile"
    "findPassword": "find_password"
    
    "*otherwise": "otherwise"

  home: ->
    @navigate(Migu.homePageLink, true)

  pageFromId: (id) ->
    url = Migu.pageUrl.replace("$PAGEID", id)
    @pageFromUrl(url)

  pageFromUrl: (url) ->
    Migu.index.wrapper.createPage(url: url)

  login: (url) ->
    unless Migu.local.get("login")
      Migu.index.pusher.closeSidebar()
      Migu.index.loginDialog.open()
      Migu.index.loginDialog.once "success", =>
        Migu.navigate(url) if url
    else
      Migu.navigate(url) if url

  play: (id, play_only) ->
    media = Migu.musics.get(id)
    if play_only
      Migu.index.player.play(media)
    else
      Migu.index.player.add(media, true)

  search: (query) ->
    url = Migu.searchUrl.replace("$QUERY", decodeURI(query)).replace("$TYPE", "all")
    @pageFromUrl(url)

  tariff: (id) ->
    url = Migu.tariffUrl.replace("$MUSICID", id)
    @pageFromUrl(url)

  _appendPage: (Widget) ->
    page = new Migu.Views.StaticPage(Widget: Widget)
    Migu.index.wrapper.appendPage(page)
    page.render()

  register: () ->
    @_appendPage(Migu.Widgets.Register)

  bind_mobile: () ->
    @_appendPage(Migu.Widgets.BindMobile)

  find_password: () ->
    @_appendPage(Migu.Widgets.FindPassword)

  otherwise: (id) ->
    @home()
