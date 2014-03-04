(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, tpls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpls = {
      song: require('text!tpl/songList.html'),
      ring: require('text!tpl/ringList.html'),
      info: require('text!tpl/infoList.html'),
      album: require('text!tpl/albumList.html'),
      artist: require('text!tpl/artistList.html')
    };
    return Backbone.View.extend({
      initialize: function(options) {
        var type;
        type = options["type"] || "song";
        return this.template = _.template(tpls[type]);
      },
      render: function(songs) {
        var tpl;
        window.songs.add(songs);
        tpl = this.template({
          songs: songs
        });
        this.$el.html(tpl);
        return this;
      }
    });
  });

}).call(this);
