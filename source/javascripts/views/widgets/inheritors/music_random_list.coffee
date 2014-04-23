#= require views/widgets/inheritors/music_rank_list

Migu.Widgets.MusicRandomList = Migu.Widgets.MusicRankList.extend

  randomHeaderTemplate: Migu.loadTemplate("templates/widgets/details/random_header")

  requiredParams: Migu.Widgets.MusicRankList::requiredParams.concat [
    "title"
    "randomLink"
  ]

  render: () ->
    Migu.Widgets.MusicRankList::render.call(@)
    @$el.prepend(@randomHeaderTemplate(@options))
    @
