define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  ULoginView    = require('views/uLogin')
  RegView       = require('views/reg')

  PageSlider    = require('utils/page_slider')

  Backbone.View.extend
  
    events:
      "click .close": "close"

    triggerChangePage: ->
      @$el.trigger "page_slider.change"
      
    render: (callback=null) ->      
      @$el.appendTo("#loginDialog")

      @container = new PageSlider(@$el)
      @uLogin = new ULoginView(el: @$el, callback: callback)

      @container.slidePage @uLogin

      return @

    close: () ->
      @$el.empty()