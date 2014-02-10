define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/slider.html')

  template    = _.template(tpl)

  require('jqueryflexslider')

  slides =
    default: null
    vip: null
  urls =
    default: "api/slides.json"
    vip: "api/vip_slides.json"

  Backbone.View.extend

    initialize: (options) ->
      @type = options["type"] || "default"

    initSlider: ->
      @$el.html(template(slides[@type]))

      @$el.find(".flexslider").flexslider
        animation: "slide"
        startAt: 1
        # controlNav: false
        directionNav: false

    render: ->
      if slides[@type]
        @initSlider()
      else
        $.getJSON urls[@type], (data) =>
          slides[@type] = data
          @initSlider()

      return @