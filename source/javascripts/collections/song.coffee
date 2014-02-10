define (require) ->
  "use strict"

  _           = require('underscore')
  Backbone    = require('backbone')

  Song        = require('models/song')

  Backbone.Collection.extend 

    model: Song