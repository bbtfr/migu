(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, tpls, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpls = {};
    tpls["song"] = require('text!tpl/songList.html');
    tpls["ring"] = require('text!tpl/ringList.html');
    tpls["info"] = require('text!tpl/infoList.html');
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
