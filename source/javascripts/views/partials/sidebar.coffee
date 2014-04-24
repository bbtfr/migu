Migu.Views.Sidebar = Backbone.View.extend

  template: Migu.loadTemplate('templates/partials/sidebar')

  render: (data) ->
    @$el.html(@template(data: data))
    @$loginBtn = @$el.find("#login-btn")
    @

  # Set sidebar login button text
  updateLoginBtn: (mobile) ->
    if mobile
      @$loginBtn.text(mobile)
    else
      @$loginBtn.text("登录")
