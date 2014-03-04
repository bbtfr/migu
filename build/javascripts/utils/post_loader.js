(function() {
  define(function(require) {
    "use strict";
    var Loader;
    return Loader = function(url, postData, success, fail) {
      var _this = this;
      window.indexView.showLoading();
      $.post(url, postData, "json").success(function(data) {
        if (data["success"]) {
          window.indexView.hideLoading();
          return success(data);
        } else {
          if (fail) {
            window.indexView.hideLoading();
            return fail();
          } else {
            return window.indexView.showInfo(data["error"]);
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
