window.Migu =
  Models: {}
  Collections: {}
  Widgets: {}
  Views: {}
  Routers: {}

  initialize: ->
    console.info("Initialize Migu")
    console.time("Migu")

    @musics = new Backbone.Collection()
    @loading = new @Loading()
    @router = new @Routers.AppRouter()
    @index = new @Views.Index(el: $("body")).render()

    @index.on "ready", =>
      # When index view is ready
      console.timeEnd("Migu")

      # Prepare if user is logged-in
      if login = @local.get("login")
        # Test valid login
        for key in ["mobile", "token"]
          unless login[key]
            @local.remove("login")
            login = {}
            break
        # Set sidebar login button text
        @index.sidebar.updateLoginBtn(login["mobile"])
      
      # Remove progress mask, 进度/欢迎页面
      $("#progress").remove()

      # Start backbone history
      Backbone.history.start()

  navigate: (url) ->
    @router.navigate(url, true)

$(document).ready ->
  # When document is ready
  # use fast click to speed up click event
  FastClick.attach(document.body)

  # initialize
  Migu.initialize()
