Migu.Widget = Backbone.View.extend

  tagName: "section"

  requiredParams: [
    "data"
  ]

  optionalParams: {
    "vms": null
  }

  initialize: (options={}) ->
    @type ||= options["type"]
    console.debug("Create Widget #{@type}", { options: options })
    console.time(@type)

    @options = options

    # Required parameters
    for param in @requiredParams
      @[param] = required(options, param)

    # Optional parameters
    for param, value of @optionalParams
      @[param] = options[param] || value

    @vms = options["vms"]

    @_afterInitialize(options) if @_afterInitialize?

  render: ->
    @$el.html(@template(@)) if @template?
    @_afterRender() if @_afterRender?
    @trigger("ready")
    console.timeEnd(@type)
    @

Migu.CreateWidgetCallbacks = []

Migu.registerCreateWidgetCallback = (callback) ->
  Migu.CreateWidgetCallbacks.push callback
