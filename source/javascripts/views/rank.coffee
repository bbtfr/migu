define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/rank.html')

  SongListView = require('views/songList')
  
  Loader       = require('utils/loader')
  
  template     = _.template(tpl)

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/bd.json", {}, (data) =>
        @$el.html(template(data))
        @yyb = new SongListView(el: @$el.find("#yyb-list")).render(data["yyb"])
        @jqb = new SongListView(el: @$el.find("#jqb-list")).render(data["jqb"])
        @clb = new SongListView(el: @$el.find("#clb-list")).render(data["clb"])
        @bd4 = new SongListView(el: @$el.find("#bd4-list")).render(data["yyb"])
        @bd5 = new SongListView(el: @$el.find("#bd5-list")).render(data["jqb"])
        @bd6 = new SongListView(el: @$el.find("#bd6-list")).render(data["clb"])

        window.indexView.triggerChangePage()

      return @