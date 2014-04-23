WidgetMap =
  "Slider": Migu.Widgets.Slider
  "Tabs": Migu.Widgets.Tabs
  "HotTabs": Migu.Widgets.HotTabs
  "SearchTabs": Migu.Widgets.SearchTabs

  "MusicList": Migu.Widgets.MusicList
  "MusicRankList": Migu.Widgets.MusicRankList
  "MusicRandomList": Migu.Widgets.MusicRandomList
  "MusicCollList": Migu.Widgets.MusicCollList
  
  "RandomList": Migu.Widgets.RandomList
  "TypeList": Migu.Widgets.TypeList
  "LinkList": Migu.Widgets.LinkList
  "ImageList": Migu.Widgets.ImageList

  "CurrRing": Migu.Widgets.CurrRing
  "RingList": Migu.Widgets.RingList

  "News": Migu.Widgets.News
  "TopNews": Migu.Widgets.TopNews
  "NewsList": Migu.Widgets.NewsList
  
  "Activity": Migu.Widgets.Activity
  "ActivityList": Migu.Widgets.ActivityList
  "ActivityImageList": Migu.Widgets.ActivityImageList

  "Album": Migu.Widgets.Album
  "AlbumList": Migu.Widgets.AlbumList
  "Artist": Migu.Widgets.Artist
  "ArtistList": Migu.Widgets.ArtistList

  "Vip": Migu.Widgets.Vip
  "AppLink": Migu.Widgets.AppLink

  "ImageBanner": Migu.Widgets.ImageBanner
  "Header": Migu.Widgets.Header

  "Paginate": Migu.Widgets.Paginate
  "Refresh": Migu.Widgets.Refresh

  "Tariff": Migu.Widgets.Tariff
  "Register": Migu.Widgets.Register

Migu.newWidget = (options) ->
  for callback in Migu.CreateWidgetCallbacks
    options = callback(options)

  if Widget = WidgetMap[required(options, "type")]
    widget = new Widget(options)
  else
    console.error("Widget type #{options["type"]} not found!")

Migu.createWidget = (options) ->
  try
    if widget = Migu.newWidget(options)
      widget.render()
  catch e
    console.error("Widget with options", options, " render failed!", e)
  
