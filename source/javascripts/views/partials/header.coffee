Migu.Views.Header = Backbone.View.extend

  template: Migu.loadTemplate('templates/partials/header')

  events:
    "click a[href='#toggleMore']": "toggleMore"
    "click a[href='#closeMore']": "closeMore"

  render: (data) ->
    @$el.html(@template(data: data))
    @

  toggleMore: (event) ->
    event.preventDefault() if event
    @$(".menuMore").slideToggle()

  closeMore: (event) ->
    event.preventDefault() if event
    @$(".menuMore").slideUp()

  activateMenuItem: (menuId) ->
    @$("a[menu-id='#{menuId}']").addClass("current")

  removeActiveMenuItem: () ->
    @$("a.current").removeClass("current")
    