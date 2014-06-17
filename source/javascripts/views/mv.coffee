define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/mv.html')

  SongListView   = require('views/songList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/mv.json"

  Backbone.View.extend

    render: ->
      @loader = new Loader url, (data) =>
        @$el.html(template())
      
        @cl = new SongListView(el: @$el.find("#cl"), type: "mv").render(data["cl"])
        @dj = new SongListView(el: @$el.find("#dj"), type: "mv").render(data["dj"])

        window.indexView.triggerChangePage()

      return @