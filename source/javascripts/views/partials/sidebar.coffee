Migu.Views.Sidebar = Backbone.View.extend

  template: Migu.loadTemplate('templates/partials/sidebar')

  render: (data) ->
    @$el.html(@template(data: data))
    @

  _updateAfterLogin: () ->
    @$el.find("#login-btn").text("13800138000")