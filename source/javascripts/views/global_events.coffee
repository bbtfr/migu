Migu.Views.GlobalEvents = Backbone.View.extend
  
  events:
    "click a[href^='#play']": "loadUrl"
    "click a[href^='#login']": "loadUrl"

  loadUrl: (event) ->
    event.preventDefault()
    url = $(event.currentTarget).attr("href")
    Backbone.history.loadUrl(url)