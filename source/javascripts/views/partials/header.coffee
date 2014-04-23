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
    @$el.find(".menuMore").slideToggle()

  closeMore: (event) ->
    event.preventDefault() if event
    @$el.find(".menuMore").slideUp()

  activateMenuItem: (menuId) ->
    @$el.find("a[menu-id='#{menuId}']").addClass("current")

  removeActiveMenuItem: () ->
    @$el.find("a.current").removeClass("current")
    