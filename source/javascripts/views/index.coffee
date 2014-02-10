define (require) ->
  "use strict"

  $                = require('jquery')
  _                = require('underscore')
  Backbone         = require('backbone')

  PlayerView       = require('views/player')
  AutoCompleteView = require('views/autoComplete')

  PageSlider       = require('utils/page_slider')

  NavbarMap =
    "sf": "home"
    "zx": "home"
    "news": "home"
    "regVip": "vip"
    "regSucc": "vip"
    "regFail": "vip"

  Backbone.View.extend

    # page container
    $container: $("section.container")

    # navbar
    $navbar: $("nav.navbar")
    $navbarMore: $(".navbarMore")

    pageStack: []

    events:
      "click #navbar .navbar-more-button": "toggleNavbarMore"
      "click #search .send_query": "send_query"
      "focus #search .query": "send_autocomplete"
      "blur #search": "remove_autocomplete"

    initialize: ->
      @$el = $("body")
      @pageSlider = new PageSlider(@$container)
      @autocomplete = new AutoCompleteView(el: @$el.find("#autocomplete"))
      window.player = @player = new PlayerView()

    triggerChangePage: ->
      @$container.trigger "page_slider.change"
      
    showInfo: (info, options={}) ->
      clearTimeout @showInfoIndex if @showInfoIndex?
      $.mobile.loading "show",
        text: info
        textonly: true
      @showInfoIndex = setTimeout ->
        $.mobile.loading "hide"
      , 2000

    showLoading: ->
      $.mobile.loading "show"

    hideLoading: ->
      $.mobile.loading "hide"

    # navbar
    toggleNavbarButton: (key) ->
      key = NavbarMap[key] if NavbarMap[key]
      @$navbar.find(".current").removeClass 'current'
      @$navbar.find(".navbar-#{key}-button").addClass 'current'
      false

    toggleNavbarMore: (e) ->
      @$navbarMore.slideToggle()
      false

    # change page animation
    changePage: (key, page) ->
      @toggleNavbarButton(key)
      @pageSlider.slidePage page
      @pageStack.push page

    back: ->
      if @pageStack.length > 1
        window.history.reverse = true
        window.history.back()
      else
        window.router.navigate("/home", true)
      false

    send_query: ->
      query = @$el.find("#search .query").blur().val()
      if query
        @search(query)
      else
        @showInfo "请输入搜索内容"

    search: (query) ->
      window.router.navigate("/search/#{query}", true)
      false

    send_autocomplete: () ->
      @autocomplateIndex = setInterval =>
        query = @$el.find("#search .query").val()
        @autocomplete.render(query) 
      , 200

    remove_autocomplete: () ->
      clearInterval @autocomplateIndex
      setTimeout =>
        @autocomplete.empty()
      , 200


