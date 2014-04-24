# Local Storage
Migu.local =
  set: (key, value) ->
    try
      localStorage.setItem key, JSON.stringify(value)
    catch e
      console.error("Local Storage error:", e)

  get: (key) ->
    try
      JSON.parse localStorage.getItem(key)
    catch e
      console.error("Local Storage error:", e)
    
  remove: (key) ->
    try
      localStorage.removeItem key
    catch e
      console.error("Local Storage error:", e)
