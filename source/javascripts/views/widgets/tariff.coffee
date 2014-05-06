Migu.Widgets.Tariff = Migu.Widget.extend
  
  template: Migu.loadTemplate("templates/widgets/orders/tariff")

  confirmTemplates:
    "Download": Migu.loadTemplate("templates/widgets/orders/download")
    "SetRing": Migu.loadTemplate("templates/widgets/orders/set_ring")
    "SetMP": Migu.loadTemplate("templates/widgets/orders/set_mp")
    "SendGift": Migu.loadTemplate("templates/widgets/orders/send_gift")
    "Recommend": Migu.loadTemplate("templates/widgets/orders/recommend")

  tipsTemplate: Migu.loadTemplate("templates/widgets/orders/tips")

  events:
    "click a[href^='#confirm']": "confirm"
    "click [name='back']": "render"
    "submit form": "submit"

  requiredParams: [
    "data"
    "media"
  ]

  _afterInitialize: () ->
    @tariffs = new Backbone.Collection()
    index = 0
    for g in @data
      for o in g.data
        o.id = index++
        o.gtitle = g.title
      @tariffs.add(g.data)

  _afterRender: () ->
    Migu.musics.add(@media)
    @$container = @$(".tariff-container")

  confirm: (event) ->
    event.preventDefault()
    
    id = $(event.currentTarget).attr("href")
      .match(/^#confirm\/([^\/]+)$/)[1]
    @tariff = @tariffs.get(id).attributes

    confirmTemplate = @confirmTemplates[@tariff.type]
    @$container.html(confirmTemplate(data: @tariff, tariffs: @tariffs))

  submit: (event) ->
    event.preventDefault()

    $form = $(event.target)
    url = $form.attr("action")
    submitData = $form.serializeArray()
    
    $.ajax
      url: url
      dataType: "json"
      data: submitData
      success: (data) =>
        @$container.html(@tipsTemplate(data))
