(function() {
  define(function(require) {
    "use strict";
    var $, PageSlider;
    $ = require("jquery");
    return PageSlider = function($container) {
      var $panel, currPage, firstTime;
      firstTime = true;
      currPage = null;
      $panel = $("[data-role=panel]");
      this.slidePage = function(page, options) {
        if (options == null) {
          options = {};
        }
        $container.off("page_slider.finish");
        $(document).scrollTop(0);
        window.indexView.remove_autocomplete_immediately();
        if (page.rerender != null) {
          $container.on("page_slider.finish", function() {
            return page.rerender();
          });
        }
        $container.off("page_slider.change").one("page_slider.change", function() {
          if (firstTime) {
            $("#progress").remove();
            page.$el.appendTo($container);
            $container.trigger("page_slider.finish");
            firstTime = false;
            currPage = page;
          } else {
            page.$el.hide().appendTo($container);
            currPage.$el.hide({
              effect: 'slide',
              direction: 'left',
              complete: function() {
                return page.$el.show({
                  effect: 'slide',
                  direction: 'right',
                  complete: function() {
                    return $container.trigger("page_slider.finish");
                  }
                });
              }
            });
            currPage = page;
          }
          page.$el.find("[data-role=tabs]").tabs({
            show: {
              effect: 'slide',
              direction: 'right'
            },
            hide: {
              effect: 'slide',
              direction: 'left'
            }
          });
          return $panel.panel("close");
        });
        return page.render();
      };
      return this;
    };
  });

}).call(this);
