# For JST
Migu.loadTemplate = (path) ->
  if template = $("[id='#{path}']").html()
    JST[path] = _.template(template)
  required(JST, path)
