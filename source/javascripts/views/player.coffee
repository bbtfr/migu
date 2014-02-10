define (require) ->
  "use strict"

  $           = require('jquery')
  _           = require('underscore')
  Backbone    = require('backbone')

  playListItemTpl = require('text!tpl/playListItem.html')
  lyricsListItemTpl = require('text!tpl/lyricsListItem.html')

  playListItemTemplate = _.template(playListItemTpl)
  lyricsListItemTemplate = _.template(lyricsListItemTpl)

  require('jqueryjplayer')

  Backbone.View.extend

    events:
      "click .btnClose": "closePlayer"
      "click .btnOpen": "openPlayer"
      "click .controlsBtn": "togglePlayList"

    initialize: (playlist=[])->
      @current = 0

      # Flag used with the jPlayer repeat event
      @loop = false 
      @shuffled = false
      # Flag is true during remove animation, disabling the remove() method until complete.
      @removing = false 
      # Array of Objects: The current playlist displayed (Un-shuffled or Shuffled)
      @playlist = []
      # Array of Objects: The original playlist
      @original = []
      # Copies playlist to this.original. Then mirrors this.original to this.playlist. 
      # Creating two arrays, where the element pointers match. (Enables pointer comparison.)
      @_initPlaylist playlist 

      # Object: Containing the css selectors for jPlayer its cssSelectorAncestor
      # and the css selectors for the extra interface items used by the playlist.
      @cssSelector = 
        jPlayer: "#jplayer"
        cssSelectorAncestor: "#player"
        title: ".jp-title"
        artist: ".jp-artist"
        cover: ".jp-cover"
        lyrics: ".jp-lyrics"
        playlist: ".jp-playlist"
        next: ".jp-next"
        previous: ".jp-previous"
        shuffle: ".jp-shuffle"
        shuffleOff: ".jp-shuffle-off"

      # Object: Containing the options for initializing jPlayer
      @options =
        swfPath: "flash"
        supplied: "mp3"
        smoothPlayBar: true
        playlistOptions:
          autoPlay: false
          loopOnPrevious: false
          shuffleOnLoop: true
          enableRemoveControls: false
          displayTime: "slow"
          addTime: "fast"
          removeTime: "fast"
          shuffleTime: "slow"
          itemClass: "jp-playlist-item"
          removeItemClass: "jp-playlist-item-remove"
        # Override the default repeat event handler
        repeat: (event) =>
          @loop = event.jPlayer.options.loop
        # Create a ready event handler to initialize the playlist
        ready: =>
          @_init()
        # Create an ended event handler to move to the next item
        ended: =>
          @next()
        # Create a play event handler to pause other instances
        play: =>
          @$jplayer.jPlayer "pauseOthers"
        timeupdate: (event) =>
          @_timeUpdateLyrics(event.jPlayer.status.currentTime)
        # Override the cssSelectorAncestor given in options
        cssSelectorAncestor: @cssSelector.cssSelectorAncestor

      @playlistOptions = @options.playlistOptions

      # initialize dom
      @$el = $("#player")
      @$jplayer = $("#jplayer")
      @$playlist = @$el.find(@cssSelector.playlist).find("ul")
      
      @$previous = @$el.find(@cssSelector.previous)
      @$next = @$el.find(@cssSelector.next)
      @$shuffle = @$el.find(@cssSelector.shuffle)
      @$shuffleOff = @$el.find(@cssSelector.shuffleOff)

      @$title = @$el.find(@cssSelector.title)
      @$artist = @$el.find(@cssSelector.artist)
      @$cover = @$el.find(@cssSelector.cover)

      @$lyrics =@$el.find(@cssSelector.lyrics).find("ul")

      # Create click handlers for the extra buttons that do playlist functions.
      @$previous.click =>
        @previous()
        false

      @$next.click =>
        @next()
        false

      @$shuffle.click =>
        @shuffle true
        false

      @$shuffleOff.click =>
        @shuffle false
        false
      
      # Create .on() handlers for the playlist items along with the free media and remove controls.
      @_createItemHandlers()
      
      # Instance jPlayer
      @$jplayer.jPlayer @options

    openPlayer: ->
      @$el.find(".miniPlay").slideUp()
      @$el.find(".playSkin").slideDown()
      false

    closePlayer: ->
      @$el.find(".miniPlay").slideDown()
      @$el.find(".playSkin").slideUp()
      false

    togglePlayList: ->
      @$el.find(".playList").slideToggle()
      false

    ####################
    # Lyrics
    _lyrics: (index)->
      @$lyrics.html ""
      @lyrics = null
      if @playlist[index].lyrics?
        $.get(@playlist[index].lyrics).done (data) =>
          @_parseLyrics(data)
          @$lyrics.html @_createLyricsItem(@lyrics)
          @currLyrics = 0

    _timeUpdateLyrics: (time) ->
      # 1000 ms for animation (time + 1)
      if @lyrics? and time + 1 > @lyrics[@currLyrics+1].time
        @_selectLyrics(@currLyrics+1)
        @currLyrics += 1

    _selectLyrics: (index) ->
      $li = @$lyrics.find("li:first")
      @$lyrics.animate
        marginLeft: "-#{$li.outerWidth()}px"
      , 500, =>
        @$lyrics.css(marginLeft: "0px")
        $li.remove()

    # parsing the Lyrics 
    _parseLyrics: (data) ->
      @lyrics = []

      # This will only divide with respect to new lines 
      allTextLines = data.split(/\r\n|\n/);
      for textLine, i in allTextLines
        # any line without the prescribed format wont enter this loop 
        if (textLine.search(/^(\[)(\d*)(:)(.*)(\])(.*)/i)>=0 )
          line = textLine.match(/^(\[)(\d*)(:)(.*)(\])(.*)/i)
          @lyrics.push
            time: (parseInt(line[2])*60) + parseFloat(line[4]) # will give seconds 
            text: line[6] # will give lyrics 

    _createLyricsItem: (lyrics) ->
      lyricsListItemTemplate(lyrics: lyrics)


    ####################
    # Audit Player logic
    _init: ->
      @_refresh =>
        if @playlistOptions.autoPlay
          @play @current
        else
          @select @current

    _initPlaylist: (playlist) ->
      @current = 0
      @shuffled = false
      @removing = false
      @original = $.extend(true, [], playlist) # Copy the Array of Objects
      @_originalPlaylist()

    _originalPlaylist: ->
      @playlist = @original.slice()

    _refresh: (instant) ->
      # instant: Can be undefined, true or a function.
      #       *  undefined -> use animation timings
      #       *  true -> no animation
      #       *  function -> use animation timings and excute function at half way point.
      #       
      if instant and not $.isFunction(instant)
        @$playlist.empty()
        $.each @playlist, (i) =>
          @$playlist.append self._createListItem(self.playlist[i])

        @_updateControls()
      else
        displayTime = (if @$playlist.children().length then @playlistOptions.displayTime else 0)
        @$playlist.slideUp displayTime, =>
          @$playlist.empty()
          $.each @playlist, (i) =>
            @$playlist.append @_createListItem(@playlist[i])

          @_updateControls()
          instant() if $.isFunction(instant)
          if @playlist.length
            @$playlist.slideDown @playlistOptions.displayTime
          else
            @$playlist.show()


    _createListItem: (media) ->
      playListItemTemplate(song: media)

    _createItemHandlers: ->
      # Create live handlers for the playlist items
      @$playlist.off("click", "a.#{@playlistOptions.itemClass}")
      .on "click", "a.#{@playlistOptions.itemClass}", (event) =>
        index = $(event.target).parent().index()
        if @current isnt index
          @play index
        else
          @$jplayer.jPlayer "play"
        false
      
      # Create live handlers for the remove controls
      @$playlist.off("click", "a.#{@playlistOptions.removeItemClass}")
      .on "click", "a.#{@playlistOptions.removeItemClass}", (event) =>
        index = $(event.target).parent().index()
        @remove index
        false


    _updateControls: ->
      if @playlistOptions.enableRemoveControls
        @$playlist.find("a.#{@playlistOptions.removeItemClass}").show()
      else
        @$playlist.find("a.#{@playlistOptions.removeItemClass}").hide()
      if @shuffled
        @$shuffleOff.show()
        @$shuffle.hide()
      else
        @$shuffleOff.hide()
        @$shuffle.show()


    _updateUI: (index) ->
      if @playlist.length and index?
        @$playlist.find(".jp-playlist-current").removeClass "jp-playlist-current"
        @$playlist.find("li:nth-child(#{index+1})").addClass("jp-playlist-current")
        .find(".jp-playlist-item").addClass "jp-playlist-current"
        @$title.text @playlist[index].title
        @$artist.text @playlist[index].artist if @playlist[index].artist?
        @$cover.attr "src", @playlist[index].cover if @playlist[index].cover?

    # public methods for audio player
    setPlaylist: (playlist) ->
      @_initPlaylist playlist
      @_init()

    add: (media, playNow) ->
      @$playlist.append(@_createListItem(media)).find("li:last-child")
      .hide().slideDown @playlistOptions.addTime
      @_updateControls()
      # Both array elements share the same object pointer. 
      # Comforms with _initPlaylist(p) system.
      @original.push media
      @playlist.push media 
      if playNow
        @play @playlist.length - 1
      else
        @select 0 if @original.length is 1

    _remove: (index) ->
      index = (if (index < 0) then self.original.length + index else index) 
      if 0 <= index and index < @playlist.length
        @removing = true
        $li = @$playlist.find("li:nth-child(#{index+1})")
        $li.slideUp @playlistOptions.removeTime, =>
          $li.remove()
          if @shuffled
            item = @playlist[index]
            $.each @original, (i) ->
              if @original[i] is item
                @original.splice i, 1
                false # Exit $.each
            @playlist.splice index, 1
          else
            @original.splice index, 1
            @playlist.splice index, 1
          if @original.length
            if index is @current
              # To cope when last element being selected when it was removed
              @current = (if (index < @original.length) then @current else @original.length - 1) 
              @select @current
            else @current--  if index < @current
          else
            @$jplayer.jPlayer "clearMedia"
            @current = 0
            @shuffled = false
            @_updateControls()
          @removing = false


    remove: (index) ->
      unless index?
        @_initPlaylist []
        @_refresh ->
          @$jplayer.jPlayer "clearMedia"
        true
      else
        if @removing
          false
        else
          # Negative index relates to end of array.
          @_remove(index)
          true


    select: (index) ->
      # Negative index relates to end of array.
      index = (if (index < 0) then @original.length + index else index) 
      if 0 <= index and index < @playlist.length
        @current = index
        @_updateUI index
        @_lyrics index
        @$jplayer.jPlayer "setMedia", @playlist[@current]
      else
        @current = 0

    play: (index) ->
      # Negative index relates to end of array.
      index = (if (index < 0) then @original.length + index else index) 
      if 0 <= index and index < @playlist.length
        if @playlist.length
          @select index
          @$jplayer.jPlayer "play"
      else @$jplayer.jPlayer "play" unless index?

    pause: ->
      @$jplayer.jPlayer "pause"

    next: ->
      index = (if (@current + 1 < @playlist.length) then @current + 1 else 0)
      if @loop
        # See if we need to shuffle before looping to start, and only shuffle if more than 1 item.
        if index is 0 and @shuffled and @playlistOptions.shuffleOnLoop and @playlist.length > 1
          @shuffle true, true # playNow
        else
          @play index
      else
        # The index will be zero if it just looped round
        @play index  if index > 0

    previous: ->
      index = (if (@current - 1 >= 0) then @current - 1 else @playlist.length - 1)
      @play index if @loop and @playlistOptions.loopOnPrevious or index < @playlist.length - 1

    shuffle: (shuffled, playNow) ->
      self = this
      shuffled = not @shuffled unless shuffled?
      if shuffled or shuffled isnt @shuffled
        @$playlist.slideUp @playlistOptions.shuffleTime, ->
          self.shuffled = shuffled
          if shuffled
            self.playlist.sort ->
              0.5 - Math.random()
          else
            self._originalPlaylist()
          self._refresh true # Instant
          if playNow or not $(self.cssSelector.jPlayer).data("jPlayer").status.paused
            self.play 0
          else
            self.select 0
          $(this).slideDown self.playlistOptions.shuffleTime

      