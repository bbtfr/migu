define (require) ->
  "use strict"

  $            = require('jquery')
  _            = require('underscore')
  Backbone     = require('backbone')
  tpl          = require('text!tpl/ztVip1.html')

  SongMoreView = require('views/songMore')
  
  template     = _.template(tpl)

  Loader       = require('utils/loader')

  url = "api/zt_vip_1.json"

  Backbone.View.extend

    events:
      "click .submit": "submit"

    render: ->
      @$el.html(template())
    
      @ztVip = new SongMoreView(el: @$el.find("#tjxzqm"), url: url, key: 'tjxzqm').render()

      return @

    submit: () ->
      console.log "Do something"
