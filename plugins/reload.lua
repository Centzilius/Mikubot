function run(msg, matches)
  plugins = {}
  load_plugins()
  return 'Plugins reloaded'
end

return {
    description = "Reloads Bot Plugins", 
    usage = "/reload",
    patterns = {"^/reload$"}, 
    run = run 
}