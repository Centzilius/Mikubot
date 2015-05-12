
function run(msg, matches)
   return os.date("%d.%m.%Y")
end

return {
    description = "Zeigt das aktuelle Datum an", 
    usage = {"/date"},
    patterns = {"^/date$"}, 
    run = run 
}
