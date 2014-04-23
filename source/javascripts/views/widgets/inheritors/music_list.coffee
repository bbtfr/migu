Migu.Widgets.MusicList = Migu.Widget.extend

  template: Migu.loadTemplate("templates/widgets/lists/music_list")

  _afterRender: () ->
    Migu.musics.add(@data)
    