define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/search.html')

  SongMoreView = require('views/songMore')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    events:
      "click a[href^='#artists']": 'render_artists'
      "click a[href^='#albums']": 'render_albums'

    initialize: (options) ->
      @query = options["query"]

    render: () ->
      @$el.html(template(query: @query))

      @musics = new SongMoreView
        el: @$el.find("#musics")
        url: "api/search.json?query=#{@query}&type=music"
        key: "musics"
      .render()

      return @

    render_artists: () ->
      @artists = new SongMoreView
        el: @$el.find("#artists")
        url: "api/search.json?query=#{@query}&type=artist"
        type: "artist"
        key: "artists"
      .render(false)

      return @

    render_albums: () ->
      @artists = new SongMoreView
        el: @$el.find("#albums")
        url: "api/search.json?query=#{@query}&type=album"
        type: "album"
        key: "albums"
      .render(false)

      return @



