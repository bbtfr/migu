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
      @url = options["url"] || urls[@type]

    initSlider: ->
      @$el.html(template(slides[@type]))
      @$el.find(".flexslider").flexslider
        animation: "slide"
        startAt: 1
        # controlNav: false
        directionNav: false
      
      # @$el.find(".flexslider .slides > li:first-child").show()

    render: ->
      if slides[@type]
        @initSlider()
      else
        $.getJSON @url, (data) =>
          slides[@type] = data
          @initSlider()
          # @rerender()

      return @

    # rerender: ->
    #   height = @$el.find(".flexslider .slides > li:first-child").height()
    #   @$el.find(".flexslider .slides").css("max-height": height)
    #   @$el.find(".flexslider").flexslider
    #     animation: "slide"
    #     startAt: 1
    #     # controlNav: false
    #     directionNav: false