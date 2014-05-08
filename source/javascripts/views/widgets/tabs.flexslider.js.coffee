# Migu.Widgets.TabsF = Migu.Widget.extend

#   template: Migu.loadTemplate("templates/widgets/tabs/tabs")

#   className: "flexslider"

#   _afterInitialize: (options) ->
#     @parts = []

#   _afterRender: ->
#     $container = @$(".tabs-container")

#     for options, i in @data
#       # For generate VMS
#       options["vmsTemplate"] = @vmsTemplate
#       options["lid"] = (lid) ->
#         "#{i+1}#{lid+1}"
#       options["rid"] = (rid) ->
#         rid+2

#       if widget = Migu.createWidget(options)
#         $container.append(widget.$el.addClass("tab-container"))
#         @parts.push(widget)

#     @$el.flexslider
#       selector: '.tabs-container > .tab-container'
#       manualControls: @$('nav li')
#       activeControlNavClass: 'current'
#       animation: 'slide'
#       animationLoop: false
#       slideshow: false
#       directionNav: false
