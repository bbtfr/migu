define (require) ->
  "use strict"

  $                = require('jquery')
  _                = require('underscore')
  Backbone         = require('backbone')
  tpl              = require('text!tpl/activity.html')

  SliderView       = require('views/slider')
  ActivityListView = require('views/activityList')

  template         = _.template(tpl)
  
  Loader           = require('utils/loader')

  url = "api/hd.json"

  Backbone.View.extend

    render: ->
      @loader = new Loader url, (data) =>
        @$el.html(template())

        @jbrd = new ActivityListView(el: @$el.find("#jbrd")).render(data["jbrd"])
        @yyxc = new ActivityListView(el: @$el.find("#yyxc")).render(data["yyxc"])
        @djtj = new ActivityListView(el: @$el.find("#djtj")).render(data["djtj"])
        
        window.indexView.triggerChangePage()
      
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider")).render()
      