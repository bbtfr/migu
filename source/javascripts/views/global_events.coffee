Migu.Views.GlobalEvents = Backbone.View.extend
  
  events:
    "click a[href^='#play']": "loadUrl"
    "click a[href^='#login']": "loadUrl"
    "click a[href^='#logout']": "loadUrl"

  loadUrl: (event) ->
    # load url & run callback defined in AppRouter without change hash
    event.preventDefault()
    url = $(event.currentTarget).attr("href")
    Backbone.history.loadUrl(url)