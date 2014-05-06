Migu.Views.Player = Backbone.View.extend

  playListItemTemplate: Migu.loadTemplate('templates/partials/play_list_item')
  lyricsListTemplate: Migu.loadTemplate('templates/partials/lyrics_list')

  events:
    "click .togglePlayer": "togglePlayer"
    "click .togglePlayList": "togglePlayList"
    "click .jp-previous": "previous"
    "click .jp-next": "next"

  render: (playList=[]) ->
    @$miniPlayer = @$(".miniPlay")
    @$extendPlayer = @$(".playSkin")
    @$playList = @$(".playList")
    @$lyrics = @$(".jp-lyrics")

    @playList = new Backbone.Collection(playList)

    @jPlayer = new $.jPlayer
      cssSelectorAncestor: "#player"
      supplied: "mp3"
      smoothPlayBar: true
      remainingDuration: true
      toggleDuration: true
      ended: =>
        @next()
      timeupdate: (event) =>
        @_timeUpdateLyrics(event.jPlayer.status.currentTime)
    , @$("#jPlayer")

    @

  add: (media, playNow) ->
    @playList.add(media)
    @_createPlaylistItem(media.attributes)
    @play(media) if playNow

  _play: (media) ->
    @_updateUI(media)
    @jPlayer.setMedia(media)
    @jPlayer.play() 

  play: (media) ->
    if media?
      @media = media
      @_play(@media.attributes)

  previous: () ->
    index = @playList.indexOf(@media) - 1
    media = @playList.at(index)
    @play(media)

  next: () ->
    index = @playList.indexOf(@media) + 1
    media = @playList.at(index)
    @play(media)

  togglePlayer: (event) ->
    event.preventDefault()
    @$miniPlayer.slideToggle()
    @$extendPlayer.slideToggle()

  togglePlayList: (event) ->
    event.preventDefault()
    @$playList.slideToggle()

  ####################
  # Lyrics
  _initLyrics: (url)->
    @lyrics = null
    @$lyrics.html ""
    $.ajax
      url: url
      success: (data) =>
        @_parseLyrics(data)
        @$lyrics.html @_createLyricsList(@lyrics)
        @$lyricsUl = @$lyrics.find("ul")
        @$lyricsFirstLi = @$lyricsUl.find("li:first-child")
        @currLyrics = 0
  
  # Parsing the Lyrics 
  _parseLyrics: (data) ->
    lyrics = []

    # This will only divide with respect to new lines 
    allTextLines = data.split(/\r\n|\n/);
    for textLine, i in allTextLines
      # any line without the prescribed format wont enter this loop 
      if line = textLine.match(/^([\[\]\d:.]*)+(.*)$/)
        if timeStrings = line[1].match(/\[[\d:.]*\]/g)
          for timeString in timeStrings
            if time = timeString.match(/\[(\d)*:([\d.]*)\]/)
              lyrics.push
                time: (parseInt(time[1])*60) + parseFloat(time[2]) # will give seconds 
                text: line[2]

    @lyrics = _.sortBy lyrics, (lyric) -> lyric.time

  _timeUpdateLyrics: (time) ->
    # 1000 ms for animation (time + 1)
    if @lyrics? and @lyrics[@currLyrics+1]? and time + 1 > @lyrics[@currLyrics+1].time
      @currLyrics += 1
      @_selectLyrics(@currLyrics)

  _selectLyrics: (index) ->
    offset = @$lyricsFirstLi.position().left - 
      @$lyricsUl.find("li").eq(index).position().left
    @$lyricsUl.animate
      translateX: "#{offset}px"

  _createLyricsList: (lyrics) ->
    @lyricsListTemplate(lyrics: lyrics)


  ####################
  # PlayList
  _createPlaylistItem: (media) ->
    $(@playListItemTemplate(media: media))
      .appendTo(@$playList.find("ul"))
      .slideDown()

  _updateUI: (media) ->
    @$el.fadeIn() if @$el.css('display') == 'none'
    @$(".jp-artist").text(media.artist)
    @_initLyrics(media.lyrics) if media.lyrics?

