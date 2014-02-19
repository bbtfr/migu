define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/tariff.html')

  HotView     = require('views/hot')

  template    = _.template(tpl)

  Loader      = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    render: ->
      @loader = new Loader @url, {}, (data) =>
        @data = data["zf"]

        @$el.html(template(data))

        @hot = new HotView(el: @$el.find("#hot")).render(data["rmtj"], data["cnxh"])
        window.indexView.triggerChangePage()

      return @
