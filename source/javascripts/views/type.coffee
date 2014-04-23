define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/type.html')
  
  template    = _.template(tpl)

  Loader      = require('utils/loader')

  Backbone.View.extend

    render: ->

      @loader = new Loader "api/types.json", (data) ->
        console.log data
        
      @$el.html(template())

      window.indexView.triggerChangePage()
      
      return @