define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/currRing.html')

  template    = _.template(tpl)

  Backbone.View.extend
  
    render: (ring) ->
      window.songs.add(ring)
      tpl = template(ring: ring)
      @$el.html(tpl)
        
      return @