define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/random1.html')

  SongListView = require('views/songList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  window.randomTitle = "新歌推荐"

  Backbone.View.extend

    initialize: (options) ->
      window.randomTitle = @title = options["title"]
      @url = options["url"]

    events:
      "click #pd .refresh a": "refresh"

    refresh: () ->
      @loader = new Loader @url, null, (data) =>
        @pd.render(data["pd"])
      false

    render: ->
      @loader = new Loader @url, null, (data) =>
        @$el.html(template(title: @title))
        
        @pd = new SongListView(el: @$el.find("#pd-list")).render(data["pd"])
        
        window.indexView.triggerChangePage()

      return @
