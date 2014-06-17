define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/ztVip2.html')

  template     = _.template(tpl)

  Backbone.View.extend

    render: ->
      @$el.html(template())
      
      window.indexView.triggerChangePage()

      return @