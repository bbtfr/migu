define (require) ->
  "use strict"

  Loader = (url, success, fail) ->
    window.indexView.showLoading()
    $.getJSON(url)
    .done (data) =>
      if data["success"]
        window.indexView.hideLoading()
        success(data)
      else
        if fail
          window.indexView.hideLoading()
          fail() 
        else
          window.indexView.showInfo(data["error"])
    .fail () =>
      if fail
        window.indexView.hideLoading()
        fail()
      else
        window.indexView.hideLoading()
        window.indexView.showInfo("网络错误，请稍候重试...")

    return @