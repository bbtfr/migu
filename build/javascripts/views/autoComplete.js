(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, Loader, template, tpl, _;
    $ = require('jquery');
    _ = require('underscore');
    Backbone = require('backbone');
    tpl = require('text!tpl/autoComplete.html');
    template = _.template(tpl);
    Loader = require('utils/loader');
    return Backbone.View.extend({
      render: function(query) {
        var _this = this;
        if (query && query !== this.query) {
          $.post("api/autocomplete.json", {
            query: query
          }, function(data) {
            _this.$el.html(template(data));
            return _this.query = query;
          }, 'json');
        }
        return this;
      },
      empty: function() {
        return this.$el.empty();
      }
    });
  });

}).call(this);
