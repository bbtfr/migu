Migu.Views.Pusher = Backbone.View.extend

  events:
    "click a[href='#openSidebar']": "openSidebar"
    "click a[href='#closeSidebar']": "closeSidebar"
    "click .mask": "closeSidebar"

  openSidebar: (event) ->
    event.preventDefault() if event
    @$el.addClass("openSidebar")

  closeSidebar: (event) ->
    event.preventDefault() if event
    @$el.removeClass("openSidebar")
