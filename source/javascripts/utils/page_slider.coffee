define (require) ->
  "use strict"

  $ = require("jquery")
  
  PageSlider = ($container) ->
    firstTime = true
    currPage = null
    $panel = $("[data-role=panel]")

    # Use this function if you want PageSlider to automatically determine the sliding direction based on the state history
    @slidePage = (page, options={}) ->
      $container.off("page_slider.finish")
      if page.rerender?
        $container.on "page_slider.finish", ->
          page.rerender()
          
      $container.off("page_slider.change").one "page_slider.change", ->
        if firstTime
          $.mobile.loading "hide"
          page.$el.appendTo($container)
          $container.trigger "page_slider.finish"
          firstTime = false
          currPage = page
        else
          page.$el.hide().appendTo($container)
          currPage.$el.hide
            effect: 'slide'
            direction: 'left'
            complete: ->
              page.$el.show
                effect: 'slide'
                direction: 'right'
                complete: ->
                  $container.trigger "page_slider.finish"
          currPage = page

        page.$el.find("[data-role=tabs]").tabs
          show: 
            effect: 'slide'
            direction: 'right'
          hide: 
            effect: 'slide'
            direction: 'left'

        $panel.panel "close"

      page.render()

    return @

