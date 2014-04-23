DebugLevel = 1

window.Migu =
  Models: {}
  Collections: {}
  Widgets: {}
  Views: {}
  Routers: {}

  initialize: ->
    @musics = new Backbone.Collection()
    
    @loading = new @Loading()
    @router = new @Routers.AppRouter()
    @index = new @Views.Index(el: $("body")).render()
    @index.on "ready", =>
      $("#progress").remove()
      Backbone.history.start()
      @index.wrapper.on "createPage", =>
        @index.pusher.closeSidebar()

  navigate: (url) ->
    @router.navigate(url, true)

  # Local Storage
  local:
    set: (key, value) ->
      localStorage.setItem key, value

    get: (key) ->
      localStorage.getItem key

    remove: (key) ->
      localStorage.removeItem key


$(document).ready ->
  # use fast click to speed up click event
  FastClick.attach(document.body)

  # initialize
  Migu.initialize()


window.required = (obj, key) ->
  if obj[key]?
    obj[key]
  else
    console.error("parameter '#{key}' is required for ", obj)

window.deleted = (obj, key) ->
  value = obj[key]
  delete obj[key]
  value

if DebugLevel > 0
  console.debug = -> undefined
  console.time = -> undefined
  console.timeEnd = -> undefined
if DebugLevel > 1
  console.info = -> undefined
