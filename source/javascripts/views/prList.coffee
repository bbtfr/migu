define (require) ->
  "use strict"

  $             = require('jquery')
  _             = require('underscore')
  Backbone      = require('backbone')

  tpl           = require('text!tpl/prList.html')

  template      = _.template(tpl)

  Backbone.View.extend
  
    render: (pr) ->
      @$el.html(template(pr: pr))

      return @