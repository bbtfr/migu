(function() {
  define(function(require) {
    "use strict";
    var Loader;
    return Loader = function(url, success, fail) {
      var _this = this;
      window.indexView.showLoading();
      $.getJSON(url).done(function(data) {
        if (data["success"]) {
          window.indexView.hideLoading();
          return success(data);
        } else {
          if (fail) {
            window.indexView.hideLoading();
            return fail();
          } else if (data["error"]) {
            return window.indexView.showInfo(data["error"]);
          } else {
            return window.indexView.showInfo("未知错误，请稍候重试...");
          }
        }
      }).fail(function() {
        if (fail) {
          window.indexView.hideLoading();
          return fail();
        } else {
          window.indexView.hideLoading();
          return window.indexView.showInfo("网络错误，请稍候重试...");
        }
      });
      return this;
    };
  });

}).call(this);
