define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')

  tpls = 
    song: require('text!tpl/songList.html')
    ring: require('text!tpl/ringList.html')
    info: require('text!tpl/infoList.html')
    album: require('text!tpl/albumList.html')
    artist: require('text!tpl/artistList.html')
    musician: require('text!tpl/musicianList.html')
    mv: require('text!tpl/mvList.html')
    mv1: require('text!tpl/mv1List.html')

  Backbone.View.extend
  
    initialize: (options) ->
      type = options["type"] || "song"
      @template = _.template(tpls[type])
  
    render: (songs) ->
      window.songs.add(songs)
      @$el.html(@template(songs: songs))

      return @