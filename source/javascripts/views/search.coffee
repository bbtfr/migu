define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/search.html')

  SongMoreView = require('views/songMoreStatic')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @query = options["query"]

    render: () ->
      @loader = new Loader "api/search.json?query=#{@query}", (data) =>
        @$el.html(template(query: @query, data: data))

        @musics = new SongMoreView(el: @$el.find("#musics")).render(data["musics"])
        @artists = new SongMoreView(el: @$el.find("#artists"), type: "artist").render(data["artists"])
        @albums = new SongMoreView(el: @$el.find("#albums"), type: "album").render(data["albums"])
        window.indexView.triggerChangePage()

      return @