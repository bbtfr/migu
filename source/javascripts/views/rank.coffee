define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/rank.html')

  SongListView = require('views/songList')
  
  Loader       = require('utils/loader')
  
  template     = _.template(tpl)

  url = "api/bd.json"

  Backbone.View.extend

    render: ->
      @loader = new Loader url, (data) =>
        @$el.html(template(data))
        @yyb = new SongListView(el: @$el.find("#yyb-list")).render(data["yyb"])
        @xrb = new SongListView(el: @$el.find("#xrb-list")).render(data["xrb"])
        @jqb = new SongListView(el: @$el.find("#jqb-list")).render(data["jqb"])
        @clb = new SongListView(el: @$el.find("#clb-list")).render(data["clb"])
        @ztb = new SongListView(el: @$el.find("#ztb-list")).render(data["ztb"])
        @yyrb = new SongListView(el: @$el.find("#yyrb-list")).render(data["yyrb"])

        window.indexView.triggerChangePage()

      return @