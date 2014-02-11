(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, lyricsListItemTemplate, lyricsListItemTpl, playListItemTemplate, playListItemTpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    playListItemTpl = require('text!tpl/playListItem.html');
    lyricsListItemTpl = require('text!tpl/lyricsListItem.html');
    playListItemTemplate = _.template(playListItemTpl);
    lyricsListItemTemplate = _.template(lyricsListItemTpl);
    require('jqueryjplayer');
    return Backbone.View.extend({
      events: {
        "click .btnClose": "closePlayer",
        "click .btnOpen": "openPlayer",
        "click .controlsBtn": "togglePlayList"
      },
      initialize: function(playlist) {
        var _this = this;
        if (playlist == null) {
          playlist = [];
        }
        this.current = 0;
        this.loop = false;
        this.shuffled = false;
        this.removing = false;
        this.playlist = [];
        this.original = [];
        this._initPlaylist(playlist);
        this.cssSelector = {
          jPlayer: "#jplayer",
          cssSelectorAncestor: "#player",
          title: ".jp-title",
          artist: ".jp-artist",
          cover: ".jp-cover",
          lyrics: ".jp-lyrics",
          playlist: ".jp-playlist",
          next: ".jp-next",
          previous: ".jp-previous",
          shuffle: ".jp-shuffle",
          shuffleOff: ".jp-shuffle-off"
        };
        this.options = {
          swfPath: "flash",
          supplied: "mp3",
          smoothPlayBar: true,
          playlistOptions: {
            autoPlay: false,
            loopOnPrevious: false,
            shuffleOnLoop: true,
            enableRemoveControls: false,
            displayTime: "slow",
            addTime: "fast",
            removeTime: "fast",
            shuffleTime: "slow",
            itemClass: "jp-playlist-item",
            removeItemClass: "jp-playlist-item-remove"
          },
          repeat: function(event) {
            return _this.loop = event.jPlayer.options.loop;
          },
          ready: function() {
            return _this._init();
          },
          ended: function() {
            return _this.next();
          },
          play: function() {
            return _this.$jplayer.jPlayer("pauseOthers");
          },
          timeupdate: function(event) {
            return _this._timeUpdateLyrics(event.jPlayer.status.currentTime);
          },
          cssSelectorAncestor: this.cssSelector.cssSelectorAncestor
        };
        this.playlistOptions = this.options.playlistOptions;
        this.$el = $("#player");
        this.$jplayer = $("#jplayer");
        this.$playlist = this.$el.find(this.cssSelector.playlist).find("ul");
        this.$previous = this.$el.find(this.cssSelector.previous);
        this.$next = this.$el.find(this.cssSelector.next);
        this.$shuffle = this.$el.find(this.cssSelector.shuffle);
        this.$shuffleOff = this.$el.find(this.cssSelector.shuffleOff);
        this.$title = this.$el.find(this.cssSelector.title);
        this.$artist = this.$el.find(this.cssSelector.artist);
        this.$cover = this.$el.find(this.cssSelector.cover);
        this.$lyrics = this.$el.find(this.cssSelector.lyrics).find("ul");
        this.$previous.click(function() {
          _this.previous();
          return false;
        });
        this.$next.click(function() {
          _this.next();
          return false;
        });
        this.$shuffle.click(function() {
          _this.shuffle(true);
          return false;
        });
        this.$shuffleOff.click(function() {
          _this.shuffle(false);
          return false;
        });
        this._createItemHandlers();
        return this.$jplayer.jPlayer(this.options);
      },
      openPlayer: function() {
        this.$el.find(".miniPlay").slideUp();
        this.$el.find(".playSkin").slideDown();
        return false;
      },
      closePlayer: function() {
        this.$el.find(".miniPlay").slideDown();
        this.$el.find(".playSkin").slideUp();
        return false;
      },
      togglePlayList: function() {
        this.$el.find(".playList").slideToggle();
        return false;
      },
      _lyrics: function(index) {
        var _this = this;
        this.$lyrics.html("");
        this.lyrics = null;
        if (this.playlist[index].lyrics != null) {
          return $.get(this.playlist[index].lyrics).done(function(data) {
            _this._parseLyrics(data);
            _this.$lyrics.html(_this._createLyricsItem(_this.lyrics));
            return _this.currLyrics = 0;
          });
        }
      },
      _timeUpdateLyrics: function(time) {
        if ((this.lyrics != null) && time + 1 > this.lyrics[this.currLyrics + 1].time) {
          this._selectLyrics(this.currLyrics + 1);
          return this.currLyrics += 1;
        }
      },
      _selectLyrics: function(index) {
        var $li,
          _this = this;
        $li = this.$lyrics.find("li:first");
        return this.$lyrics.animate({
          marginLeft: "-" + ($li.outerWidth()) + "px"
        }, 500, function() {
          _this.$lyrics.css({
            marginLeft: "0px"
          });
          return $li.remove();
        });
      },
      _parseLyrics: function(data) {
        var allTextLines, i, line, textLine, _i, _len, _results;
        this.lyrics = [];
        allTextLines = data.split(/\r\n|\n/);
        _results = [];
        for (i = _i = 0, _len = allTextLines.length; _i < _len; i = ++_i) {
          textLine = allTextLines[i];
          if (textLine.search(/^(\[)(\d*)(:)(.*)(\])(.*)/i) >= 0) {
            line = textLine.match(/^(\[)(\d*)(:)(.*)(\])(.*)/i);
            _results.push(this.lyrics.push({
              time: (parseInt(line[2]) * 60) + parseFloat(line[4]),
              text: line[6]
            }));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      },
      _createLyricsItem: function(lyrics) {
        return lyricsListItemTemplate({
          lyrics: lyrics
        });
      },
      _init: function() {
        var _this = this;
        return this._refresh(function() {
          if (_this.playlistOptions.autoPlay) {
            return _this.play(_this.current);
          } else {
            return _this.select(_this.current);
          }
        });
      },
      _initPlaylist: function(playlist) {
        this.current = 0;
        this.shuffled = false;
        this.removing = false;
        this.original = $.extend(true, [], playlist);
        return this._originalPlaylist();
      },
      _originalPlaylist: function() {
        return this.playlist = this.original.slice();
      },
      _refresh: function(instant) {
        var displayTime,
          _this = this;
        if (instant && !$.isFunction(instant)) {
          this.$playlist.empty();
          $.each(this.playlist, function(i) {
            return _this.$playlist.append(self._createListItem(self.playlist[i]));
          });
          return this._updateControls();
        } else {
          displayTime = (this.$playlist.children().length ? this.playlistOptions.displayTime : 0);
          return this.$playlist.slideUp(displayTime, function() {
            _this.$playlist.empty();
            $.each(_this.playlist, function(i) {
              return _this.$playlist.append(_this._createListItem(_this.playlist[i]));
            });
            _this._updateControls();
            if ($.isFunction(instant)) {
              instant();
            }
            if (_this.playlist.length) {
              return _this.$playlist.slideDown(_this.playlistOptions.displayTime);
            } else {
              return _this.$playlist.show();
            }
          });
        }
      },
      _createListItem: function(media) {
        return playListItemTemplate({
          song: media
        });
      },
      _createItemHandlers: function() {
        var _this = this;
        this.$playlist.off("click", "a." + this.playlistOptions.itemClass).on("click", "a." + this.playlistOptions.itemClass, function(event) {
          var index;
          index = $(event.target).parent().index();
          if (_this.current !== index) {
            _this.play(index);
          } else {
            _this.$jplayer.jPlayer("play");
          }
          return false;
        });
        return this.$playlist.off("click", "a." + this.playlistOptions.removeItemClass).on("click", "a." + this.playlistOptions.removeItemClass, function(event) {
          var index;
          index = $(event.target).parent().index();
          _this.remove(index);
          return false;
        });
      },
      _updateControls: function() {
        if (this.playlistOptions.enableRemoveControls) {
          this.$playlist.find("a." + this.playlistOptions.removeItemClass).show();
        } else {
          this.$playlist.find("a." + this.playlistOptions.removeItemClass).hide();
        }
        if (this.shuffled) {
          this.$shuffleOff.show();
          return this.$shuffle.hide();
        } else {
          this.$shuffleOff.hide();
          return this.$shuffle.show();
        }
      },
      _updateUI: function(index) {
        if (this.playlist.length && (index != null)) {
          this.$playlist.find(".jp-playlist-current").removeClass("jp-playlist-current");
          this.$playlist.find("li:nth-child(" + (index + 1) + ")").addClass("jp-playlist-current").find(".jp-playlist-item").addClass("jp-playlist-current");
          this.$title.text(this.playlist[index].title);
          if (this.playlist[index].artist != null) {
            this.$artist.text(this.playlist[index].artist);
          }
          if (this.playlist[index].cover != null) {
            return this.$cover.attr("src", this.playlist[index].cover);
          }
        }
      },
      setPlaylist: function(playlist) {
        this._initPlaylist(playlist);
        return this._init();
      },
      add: function(media, playNow) {
        this.$playlist.append(this._createListItem(media)).find("li:last-child").hide().slideDown(this.playlistOptions.addTime);
        this._updateControls();
        this.original.push(media);
        this.playlist.push(media);
        if (playNow) {
          return this.play(this.playlist.length - 1);
        } else {
          if (this.original.length === 1) {
            return this.select(0);
          }
        }
      },
      _remove: function(index) {
        var $li,
          _this = this;
        index = (index < 0 ? self.original.length + index : index);
        if (0 <= index && index < this.playlist.length) {
          this.removing = true;
          $li = this.$playlist.find("li:nth-child(" + (index + 1) + ")");
          return $li.slideUp(this.playlistOptions.removeTime, function() {
            var item;
            $li.remove();
            if (_this.shuffled) {
              item = _this.playlist[index];
              $.each(_this.original, function(i) {
                if (this.original[i] === item) {
                  this.original.splice(i, 1);
                  return false;
                }
              });
              _this.playlist.splice(index, 1);
            } else {
              _this.original.splice(index, 1);
              _this.playlist.splice(index, 1);
            }
            if (_this.original.length) {
              if (index === _this.current) {
                _this.current = (index < _this.original.length ? _this.current : _this.original.length - 1);
                _this.select(_this.current);
              } else {
                if (index < _this.current) {
                  _this.current--;
                }
              }
            } else {
              _this.$jplayer.jPlayer("clearMedia");
              _this.current = 0;
              _this.shuffled = false;
              _this._updateControls();
            }
            return _this.removing = false;
          });
        }
      },
      remove: function(index) {
        if (index == null) {
          this._initPlaylist([]);
          this._refresh(function() {
            return this.$jplayer.jPlayer("clearMedia");
          });
          return true;
        } else {
          if (this.removing) {
            return false;
          } else {
            this._remove(index);
            return true;
          }
        }
      },
      select: function(index) {
        index = (index < 0 ? this.original.length + index : index);
        if (0 <= index && index < this.playlist.length) {
          this.current = index;
          this._updateUI(index);
          this._lyrics(index);
          return this.$jplayer.jPlayer("setMedia", this.playlist[this.current]);
        } else {
          return this.current = 0;
        }
      },
      play: function(index) {
        index = (index < 0 ? this.original.length + index : index);
        if (0 <= index && index < this.playlist.length) {
          if (this.playlist.length) {
            this.select(index);
            return this.$jplayer.jPlayer("play");
          }
        } else {
          if (index == null) {
            return this.$jplayer.jPlayer("play");
          }
        }
      },
      pause: function() {
        return this.$jplayer.jPlayer("pause");
      },
      next: function() {
        var index;
        index = (this.current + 1 < this.playlist.length ? this.current + 1 : 0);
        if (this.loop) {
          if (index === 0 && this.shuffled && this.playlistOptions.shuffleOnLoop && this.playlist.length > 1) {
            return this.shuffle(true, true);
          } else {
            return this.play(index);
          }
        } else {
          if (index > 0) {
            return this.play(index);
          }
        }
      },
      previous: function() {
        var index;
        index = (this.current - 1 >= 0 ? this.current - 1 : this.playlist.length - 1);
        if (this.loop && this.playlistOptions.loopOnPrevious || index < this.playlist.length - 1) {
          return this.play(index);
        }
      },
      shuffle: function(shuffled, playNow) {
        var self;
        self = this;
        if (shuffled == null) {
          shuffled = !this.shuffled;
        }
        if (shuffled || shuffled !== this.shuffled) {
          return this.$playlist.slideUp(this.playlistOptions.shuffleTime, function() {
            self.shuffled = shuffled;
            if (shuffled) {
              self.playlist.sort(function() {
                return 0.5 - Math.random();
              });
            } else {
              self._originalPlaylist();
            }
            self._refresh(true);
            if (playNow || !$(self.cssSelector.jPlayer).data("jPlayer").status.paused) {
              self.play(0);
            } else {
              self.select(0);
            }
            return $(this).slideDown(self.playlistOptions.shuffleTime);
          });
        }
      }
    });
  });

}).call(this);
