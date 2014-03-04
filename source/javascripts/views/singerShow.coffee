define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/singerShow.html')

  SongMoreView = require('views/songMoreStatic')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  Backbone.View.extend

    events:
      "click .back": "back"

    initialize: (options) ->
      @title = options["title"]
      @url = options["url"]

    render: ->
      @loader = new Loader @url, (data) =>
        @$el.html(template(data))
        @musics = new SongMoreView(el: @$el.find("#musics")).render(data["musics"])
        window.indexView.triggerChangePage()

      return @

    back: ->
      window.indexView.back()
      