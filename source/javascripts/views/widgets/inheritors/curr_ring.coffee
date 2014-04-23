Migu.Widgets.CurrRing = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/details/curr_ring")

  requiredParams: [
    "media"
  ]

  _afterRender: () ->
    Migu.musics.add(@media)
    