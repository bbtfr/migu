define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/home.html')

  SliderView   = require('views/slider')
  SongListView = require('views/songList')
  NewsListView = require('views/newsList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend
  
    render: ->
      @loader = new Loader "api/home.json", null, (data) =>
        @$el.html(template(data))

        @sf = new SongListView(el: @$el.find("#sf-list")).render(data["sf"])
        @bd = new SongListView(el: @$el.find("#bd-list")).render(data["bd"])
        @zx = new NewsListView(el: @$el.find("#news-list")).render(data["zx"])

        window.indexView.triggerChangePage()
      
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider")).render()
      