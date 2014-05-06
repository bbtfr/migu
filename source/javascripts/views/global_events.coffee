Migu.Views.GlobalEvents = Backbone.View.extend
  
  events:
    "click a[href^='#play']": "loadUrl"
    "click a[href^='#login']": "loadUrl"
    "click a[href^='#logout']": "loadUrl"
    "click [vms]": "sendVms"

  loadUrl: (event) ->
    # load url & run callback defined in AppRouter without change hash
    event.preventDefault()
    url = $(event.currentTarget).attr("href")
    Backbone.history.loadUrl(url)

  sendVms: (event) ->
    vms = $(event.currentTarget).attr("vms")
    console.info("Get VMS #{vms}")
