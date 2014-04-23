Migu.Views.Index = Backbone.View.extend

  render: () ->
    Migu.loader "api/app.json", (data) =>
      @global_events = new Migu.Views.GlobalEvents(el: @$el)
      @header = new Migu.Views.Header(el: @$el.find("#header")).render(data["menu"])
      @sidebar = new Migu.Views.Sidebar(el: @$el.find("#sidebar")).render(data["sidebar"])
      @auto_complete = new Migu.Views.AutoComplete(el: @$el.find("#search")).render()
      @pusher = new Migu.Views.Pusher(el: @$el.find("#pusher")).render()
      @wrapper = new Migu.Views.PageWrapper(el: @$el.find("#page-wrapper")).render()
      @player = new Migu.Views.Player(el: @$el.find("#player")).render()
      @loginDialog = new Migu.Views.LoginDialog(el: @$el.find("#login-dialog")).render()
      @loginDialog.on "success", @_updateAfterLogin, @

      Migu.appData = data
      Migu.homePageLink = required(data, "homePageLink")
      Migu.pageUrl = required(data, "pageUrl")
      Migu.autoCompleteUrl = required(data, "autoCompleteUrl")
      Migu.searchUrl = required(data, "searchUrl")
      Migu.tariffUrl = required(data, "tariffUrl")
      
      @trigger("ready")

    @

  _updateAfterLogin: () ->
    @sidebar._updateAfterLogin()
