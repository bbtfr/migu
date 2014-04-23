#= require views/widgets/tabs

Migu.Widgets.ActivityImageList = Migu.Widgets.Tabs.extend

  template: Migu.loadTemplate("templates/widgets/lists/activity_image_list")

  requiredParams: [
    "data"
    "title"
    "moreLink"
  ]

  _afterRender: ->
    @_createTabs()
