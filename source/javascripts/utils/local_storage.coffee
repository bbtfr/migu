# Local Storage
Migu.local =
  set: (key, value) ->
    try
      localStorage.setItem key, JSON.stringify(value)
    catch e
      console.error("Local Storage error: #{e.message}")

  get: (key) ->
    try
      JSON.parse localStorage.getItem(key)
    catch e
      console.error("Local Storage error: #{e.message}")
    
  remove: (key) ->
    try
      localStorage.removeItem key
    catch e
      console.error("Local Storage error: #{e.message}")
