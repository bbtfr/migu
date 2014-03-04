define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/activityList.html')

  template    = _.template(tpl)

  Backbone.View.extend
  
    render: (activities) ->

      activities2 = []
      for activity, index in activities by 2
        activities2.push([activities[index], activities[index+1]])

      tpl = template(activities: activities2, title: @$el.data('title'))
      @$el.html(tpl)

      return @