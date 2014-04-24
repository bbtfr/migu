#= require views/login
#= require views/widgets/tabs

Migu.Views.LoginDialog = Migu.Views.Login.extend

  events: _.extend Migu.Views.Login::events, 
    "click nav li": "changeTab"
    "click .mask": "close"

  open: () ->
    Migu.Views.Login::open.call(@)
    @swiper.resizeFix()

  render: () ->
    Migu.Views.Login::render.call(@)
    Migu.Widgets.Tabs::_createTabs.call(@)
    @

  activateMenuItem: Migu.Widgets.Tabs::activateMenuItem
  changeTab: Migu.Widgets.Tabs::changeTab

  getToken: (data) ->
    @_countDown()

  login: (data) ->
    @trigger "success", data
    @close()

  findPassword: () ->
    Migu.navigate("findPassword")
    @close()
