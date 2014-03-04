define (require) ->
  "use strict"

  Loader = (url, postData, success, fail) ->
    window.indexView.showLoading()
    $.post(url, postData, "json")
    .success (data) =>
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