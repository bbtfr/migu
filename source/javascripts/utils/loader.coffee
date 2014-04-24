loader = (url, options) ->
  Migu.loading.show()

  if typeof options is 'function'
    success = options
    options = {}
  else
    success = deleted(options, 'success')
    error = deleted(options, 'error')
    complete = deleted(options, 'complete')

  ajaxOptions = 
    url: url
    dataType: 'json'
    success: (data, status, xhr) =>
      console.timeEnd("Ajax #{url}")

      if data["success"]
        success(data, status, xhr)
        Migu.loading.hide()
      else
        Migu.loading.hide()
        if error
          error(xhr, status) 
        else if data["error"]
          Migu.loading.info(data["error"])
        else
          Migu.loading.info("未知错误，请稍候重试...")

      complete(xhr, status) if complete
    
    error: (xhr, errorType, e) =>
      console.error("Ajax #{errorType}:", e)
      console.timeEnd("Ajax #{url}")

      Migu.loading.hide()
      if error
        error(xhr, errorType)
      else
        Migu.loading.info("网络错误，请稍候重试...")

      complete(xhr, errorType) if complete

  ajaxOptions = _.extend ajaxOptions, options

  console.debug("Create Ajax Request", { options: ajaxOptions })
  console.time("Ajax #{url}")
  
  return $.ajax ajaxOptions

Migu.get = Migu.loader = loader
Migu.post = (url, data, options) ->
  if typeof options is 'function'
    options = { success: options }
  ajaxOptions =
    type: "POST"
    data: data
  ajaxOptions = _.extend ajaxOptions, options
  loader url, ajaxOptions
