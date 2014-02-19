define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/autoComplete.html')

  template    = _.template(tpl)

  Loader      = require('utils/loader')

  Backbone.View.extend

    render: (query) ->
      if query and query != @query
        $.post "api/autocomplete.json", { query: query }, (data) =>
          @$el.html(template(data))
          @query = query
        , 'json'

      return @

    empty: ->
      @$el.empty()
