define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/activityList.html')

  template    = _.template(tpl)

  Backbone.View.extend
  
    render: (activities) ->
      window.activities.add(activities)
      tpl = template(activities: activities)
      @$el.html(tpl)
        
      return @