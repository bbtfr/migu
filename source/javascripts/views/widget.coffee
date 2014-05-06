Migu.Widget = Backbone.View.extend

  tagName: "section"

  requiredParams: [
    "data"
  ]

  optionalParams: {}

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

    # For VMS
    @ridOffset = options["ridOffset"] || 1
    @lidOffset = options["lidOffset"] || 1
    if options["vmsPrefix"]
      @vmsTemplate = "#{options["vmsPrefix"]}R$RIDL$LID"
    else
      @vmsTemplate = options["vmsTemplate"]

    @_afterInitialize(options) if @_afterInitialize?

  # For VMS
  generateVms: (rid, lid) ->
    @vmsTemplate.replace("$RID", rid).replace("$LID", lid) if @vmsTemplate

  generateRid: (rid) ->
    rid + @ridOffset

  generateLid: (lid) ->
    lid + @lidOffset

  vmsTag: (rid, lid) ->
    vms = @generateVms(@generateRid(rid), @generateLid(lid))
    "vms=\"#{vms}\"" if vms

  render: ->
    @$el.html(@template(@)) if @template?
    @_afterRender() if @_afterRender?
    @trigger("ready")
    console.timeEnd(@type)
    @

Migu.CreateWidgetCallbacks = []

Migu.registerCreateWidgetCallback = (callback) ->
  Migu.CreateWidgetCallbacks.push callback
