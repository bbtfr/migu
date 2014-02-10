define (require) ->
  "use strict"

  _           = require('underscore')
  Backbone    = require('backbone')

  Activity    = require('models/activity')
  
  Backbone.Collection.extend

    model: Activity
