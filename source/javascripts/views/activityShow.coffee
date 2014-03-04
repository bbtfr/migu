define (require) ->
  "use strict"

  $                = require('jquery')
  _                = require('underscore')
  Backbone         = require('backbone')
  tpl              = require('text!tpl/activityShow.html')

  SliderView       = require('views/slider')
  SongListView     = require('views/songList')

  template         = _.template(tpl)
  
  Loader           = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    render: ->
      @loader = new Loader @url, (data) =>
        @$el.html(template(data))
        @jtqm = new SongListView(el: @$el.find("#tjqm-list")).render(data["tjqm"])

        window.indexView.triggerChangePage()
      
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider")).render()
      