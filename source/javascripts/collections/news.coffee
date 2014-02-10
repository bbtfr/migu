define (require) ->
  "use strict"

  _           = require('underscore')
  Backbone    = require('backbone')

  News        = require('models/news')
  
  Backbone.Collection.extend

    model: News
