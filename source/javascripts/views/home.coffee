define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/home.html')

  SliderView   = require('views/slider')
  SongListView = require('views/songList')
  NewsListView = require('views/newsList')
  PrListView   = require('views/prList')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/home.json"

  Backbone.View.extend
  
    render: ->
      @loader = new Loader url, (data) =>
        @$el.html(template())

        @sf = new SongListView(el: @$el.find("#sf-list")).render(data["sf"])
        @bd = new SongListView(el: @$el.find("#bd-list")).render(data["bd"])
        @zx = new NewsListView(el: @$el.find("#news-list")).render(data["zx"])

        @yygc = new PrListView(el: @$el.find("#yygc")).render(data["yygc"])
        @yyc = new PrListView(el: @$el.find("#yyc")).render(data["yyc"])
        @ymq = new PrListView(el: @$el.find("#ymq")).render(data["ymq"])

        window.indexView.triggerChangePage()
      
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider")).render()
      