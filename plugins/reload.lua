function run(msg, matches)
  plugins = {}
  load_plugins()
  return 'Plugins erfolgreich geladen!'
end

return {
    description = "", 
    usage = "",
    patterns = {"^/reload$"}, 
    run = run,
  privileged = true
}