#= require views/form_widget
#= require views/widgets/tabs

Migu.Views.LoginDialog = Migu.FormWidget.extend

  events: _.extend Migu.FormWidget::events, 
    "click nav li": "changeTab"
    "click .mask": "close"

  open: () ->
    Migu.FormWidget::open.call(@)
    @swiper.resizeFix()

  render: () ->
    Migu.FormWidget::render.call(@)
    Migu.Widgets.Tabs::_createTabs.call(@)
    @

  activateMenuItem: Migu.Widgets.Tabs::activateMenuItem
  changeTab: Migu.Widgets.Tabs::changeTab

  getToken: (data) ->
    @countDown()

  login: (data) ->
    @trigger "success", data
    @close()

  findPassword: () ->
    Migu.navigate("findPassword")
    @close()
