loader = (url, options) ->
  Migu.loading.show()

  if typeof options is 'function'
    success = options
    options = {}
  else
    success = options['success']
    error = options['error']

  ajaxOptions = _.extend options, 
    url: url
    dataType: 'json'
    success: (data, status, xhr) =>
      Migu.loading.hide()

      if data["success"]
        success(data, status, xhr)
      else
        if error
          error(xhr) 
        else if data["error"]
          Migu.loading.info(data["error"])
        else
          Migu.loading.info("未知错误，请稍候重试...")
    
    error: (xhr, errorType, error) =>
      Migu.loading.hide()

      if error
        error(xhr)
      else
        Migu.loading.info("网络错误，请稍候重试...")

  return $.ajax ajaxOptions

Migu.loader = loader
