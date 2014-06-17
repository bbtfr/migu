define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/ztVip.html')

  SongListView = require('views/songList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/zt_vip.json"

  Backbone.View.extend

    render: ->
      @loader = new Loader url, (data) =>
        @$el.html(template())
      
        @ztVip = new SongListView(el: @$el.find("#part1")).render(data["musics"])

        window.indexView.triggerChangePage()

      return @