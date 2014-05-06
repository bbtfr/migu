#= require views/widgets/static_tabs

Migu.Widgets.SearchTabs = Migu.Widgets.StaticTabs.extend

  template: Migu.loadTemplate("templates/widgets/tabs/search_tabs")

  requiredParams: [
    "data"
    "query"
  ]