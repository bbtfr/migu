window.required = (obj, key) ->
  if obj[key]?
    obj[key]
  else
    console.error("Parameter '#{key}' is required for ", obj)

window.deleted = (obj, key) ->
  value = obj[key]
  delete obj[key]
  value

# For JST
Migu.loadTemplate = (path) ->
    if template = $("[id='#{path}']").html()
      JST[path] = _.template(template)
    required(JST, path)

DebugLevel = 0

if DebugLevel > 0
  console.debug = -> undefined
  console.time = -> undefined
  console.timeEnd = -> undefined
if DebugLevel > 1
  console.info = -> undefined
