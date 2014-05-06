Migu.Views.AutoComplete = Backbone.View.extend

  template: Migu.loadTemplate('templates/partials/auto_complete_drop')

  events:
    "click #submit": "submit"
    "focus": "startQuery"
    "keyup #query": "sendQuery"
    "blur": "cleanQuery"
    "click a[href^='#search']": "cleanQuery"

  render: () ->
    @$drop = @$("#drop")
    @$query = @$("#query")
    @    

  _setTimeout: (callback) ->
    setTimeout callback, 500

  query: (query) ->
    if query != @lastQuery
      if query
        url = Migu.autoCompleteUrl.replace("$QUERY", query)
        @lastQuery = query
        $.getJSON url, (data) =>
          @$drop.html(@template(data))
      else
        @$drop.empty()


  startQuery: ->
    @lastQuery = null
    @autoComplateIndex = null

  sendQuery: ->
    query = @$query.val()
    @autoComplateIndex = @_setTimeout =>
      if @$query.val() == query
        @query(query)

  cleanQuery: ->
    clearTimeout @autoComplateIndex
    @$drop.empty()

  submit: ->
    query = @$query.val()
    @cleanQuery()
    Migu.router.navigate("search/#{encodeURI(query)}", true)
