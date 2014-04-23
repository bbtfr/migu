define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/musician.html')

  template     = _.template(tpl)

  SongListView = require('views/songList')
  SongMoreView = require('views/songMore')

  Loader       = require('utils/loader')

  rqycphUrl = "api/rqycph.json"
  tjyyrUrl = "api/tjyyr.json"

  Backbone.View.extend

    render: () ->
      @$el.html(template())

      @rqycph = new SongMoreView(
        el: @$el.find("#rqycph")
        url: rqycphUrl
        key: "rqycph"
        eachPage: 8
      ).render()

      @tjyyr = new SongMoreView(
        el: @$el.find("#tjyyr")
        type: "musician"
        url: tjyyrUrl
        key: "tjyyr"
        eachPage: 8
      ).render(false)

      return @