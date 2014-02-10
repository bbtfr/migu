define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/vip.html')

  SliderView  = require('views/slider')
  
  template    = _.template(tpl)

  Backbone.View.extend

    render: ->
      @$el.html(template())
      window.indexView.triggerChangePage()
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider"), type: "vip").render()
