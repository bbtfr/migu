define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')

  tpls         = {}
  tpls["song"] = require('text!tpl/songList.html')
  tpls["ring"] = require('text!tpl/ringList.html')
  tpls["info"] = require('text!tpl/infoList.html')

  Backbone.View.extend
  
    initialize: (options) ->
      type = options["type"] || "song"
      @template = _.template(tpls[type])
  
    render: (songs) ->
      window.songs.add(songs)
      tpl = @template(songs: songs)
      @$el.html(tpl)
        
      return @