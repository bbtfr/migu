Migu.Views.Pusher = Backbone.View.extend

  events:
    "click a[href='#openSidebar']": "openSidebar"
    "click a[href='#closeSidebar']": "closeSidebar"
    "click .mask": "closeSidebar"

  render: () ->
    @$el.on TransitionEndEvent, =>
      @$el.removeClass("animate")

  openSidebar: (event) ->
    event.preventDefault() if event
    @$el.addClass("openSidebar animate")

  closeSidebar: (event) ->
    event.preventDefault() if event
    @$el.removeClass("openSidebar").addClass("animate")
