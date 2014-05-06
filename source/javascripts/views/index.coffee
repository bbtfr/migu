Migu.Views.Index = Backbone.View.extend

  render: () ->
    Migu.loader "api/app.json", (data) =>
      # All global events go here
      @global_events = new Migu.Views.GlobalEvents(el: @$el)

      @header = new Migu.Views.Header(el: @$("#header")).render(data["menu"])
      @sidebar = new Migu.Views.Sidebar(el: @$("#sidebar")).render(data["sidebar"])
      @auto_complete = new Migu.Views.AutoComplete(el: @$("#search")).render()
      @pusher = new Migu.Views.Pusher(el: @$("#pusher")).render()
      @wrapper = new Migu.Views.PageWrapper(el: @$("#page-wrapper")).render()
      @player = new Migu.Views.Player(el: @$("#player")).render()
      @loginDialog = new Migu.Views.LoginDialog(el: @$("#login-dialog")).render()

      # Delegate events:
      # Close sidebar when page is created
      @wrapper.on "createPage", =>
        @pusher.closeSidebar()
        @header.closeMore()

      # Bind required data to Migu
      Migu.appData = data
      for key in ["homePageLink", "pageUrl", "autoCompleteUrl", "searchUrl", 
        "tariffUrl"]
        Migu[key] = required(data, key)
      
      @trigger("ready")

    @
