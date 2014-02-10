define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/rank1.html')

  SongMoreView = require('views/songMore')
  
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

        @rank = new SongMoreView(el: @$el.find("#rank")).render(data["bd"])
        
        window.indexView.triggerChangePage()

      return @

    back: ->
      window.indexView.back()
      