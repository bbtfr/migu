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

  Backbone.View.extend

    render: ->
      @loader = new Loader "api/hd.json", {}, (data) =>
        @$el.html(template())

        @jbrd = [
          new ActivityListView(el: @$el.find("#jbrd1-list")).render(data["jbrd"][0..1])
          new ActivityListView(el: @$el.find("#jbrd2-list")).render(data["jbrd"][2..3])
          new ActivityListView(el: @$el.find("#jbrd3-list")).render(data["jbrd"][4..5])
        ]
        @yyxc = [
          new ActivityListView(el: @$el.find("#yyxc1-list")).render(data["yyxc"][0..1])
          new ActivityListView(el: @$el.find("#yyxc2-list")).render(data["yyxc"][2..3])
          new ActivityListView(el: @$el.find("#yyxc3-list")).render(data["yyxc"][4..5])
        ]
        @djtj = [
          new ActivityListView(el: @$el.find("#djtj1-list")).render(data["djtj"][0..1])
          new ActivityListView(el: @$el.find("#djtj2-list")).render(data["djtj"][2..3])
          new ActivityListView(el: @$el.find("#djtj3-list")).render(data["djtj"][4..5])
        ]
        
        window.indexView.triggerChangePage()
      
      return @

    rerender: ->
      @slider = new SliderView(el: @$el.find("#slider")).render()
      