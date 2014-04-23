# Enable scrolling 
enableScroll = ->
  html = $("html")
  html.css "overflow-y", "auto"
  document.ontouchmove = (e) ->
    true

# Prevent scrolling 
disableScroll = ->
  html = $("html")
  html.css "overflow-y", "hidden"
  document.ontouchmove = (e) ->
    e.preventDefault()

class Loading
  constructor: (options = {}) ->
    @$loading = $("#loading")
    @$loading_label = @$loading.find(".text")

  show: ->
    @$loading.addClass("loading")
    disableScroll()

  hide: ->
    @$loading.removeClass("loading")
    enableScroll()

  info: (message) ->
    @$loading_label.text(message)
    @$loading.addClass("text-only")

    setTimeout =>
      @$loading.removeClass("text-only")
      @$loading_label.text("数据加载中...")
    , 2000

Migu.Loading = Loading
