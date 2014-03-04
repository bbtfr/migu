define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/type1.html')

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
      @$el.html(template())

      @type = new SongMoreView(el: @$el.find("#type"), url: @url, key: "fl").render()

      return @

    back: ->
      window.indexView.back()
      