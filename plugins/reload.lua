function run(msg, matches)
  plugins = {}
  load_plugins()
  return 'Plugins erfolgreich geladen!'
end

return {
    description = "Läd die Plugins neu", 
    usage = {"/reload (kann nur Akamaru)"},
    patterns = {"^/reload$"}, 
    run = run,
  privileged = true
}