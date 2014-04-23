#= require views/widgets/tabs

Migu.Widgets.SearchTabs = Migu.Widgets.Tabs.extend

  template: Migu.loadTemplate("templates/widgets/tabs/search_tabs")

  requiredParams: [
    "data"
    "query"
  ]