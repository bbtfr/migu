define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')
  tpl         = require('text!tpl/tariff.html')
  
  orderTpls   = [
    require('text!tpl/order2.html')
    require('text!tpl/order3.html')
    require('text!tpl/order4.html')
    require('text!tpl/order5.html')
  ]

  HotView     = require('views/hot')

  template    = _.template(tpl)

  Loader      = require('utils/loader')

  Backbone.View.extend

    initialize: (options) ->
      @url = options["url"]

    events:
      "click [data-order]": "order"
      "click .send_gift": "send_gift"
      "click .submit": "submit"
      "click .cancel": "cancel"

    render: ->
      @loader = new Loader @url, (data) =>
        @data = data["zf"]

        @$el.html(template(data))

        @hot = new HotView(el: @$el.find("#hot")).render(data["rmtj"], data["cnxh"])
        window.indexView.triggerChangePage()

      return @

    order: (e) ->
      $a = $(e.currentTarget)
      @order = $a.data("order")
      @type = $a.data("type")
      @redirect = $a.attr("href")
      @$el.find("#tariff").html(_.template(orderTpls[@order-2])(zf: @data, order: @order, type: @type))
      false

    send_gift: (e) ->
      @username = @$el.find("#username").val()
      @mobile = @$el.find("#mobile").val()
      @types = {}
      @$el.find(".gift").each (index, el) =>
        @types[index] = $(el).val()
      window.router.ajax "path/to/send/gift", "赠送礼物"

    submit: (e) ->
      window.router.navigate(@redirect, true)
      false

    cancel: (e) ->
      @render()
      false
