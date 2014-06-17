define (require) ->
  "use strict"

  $                = require('jquery')
  _                = require('underscore')
  Backbone         = require('backbone')
  tpl              = require('text!tpl/mvShow.html')

  SongListView     = require('views/songList')

  template         = _.template(tpl)
  
  Loader           = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    render: ->
      @loader = new Loader @url, (data) =>
        @$el.html(template(data))
        @xgmv = new SongListView(el: @$el.find("#xgmv-list"), type: "mv").render(data["xgmv"])

        window.indexView.triggerChangePage()
      
      return @
