Migu.Widgets.RandomList = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/lists/random_list")
  randomHeaderTemplate: Migu.loadTemplate("templates/widgets/details/random_header")

  requiredParams: [
    "data"
    "title"
  ]

  _afterRender: () ->
    @$el.prepend(@randomHeaderTemplate(@options))
