function run(msg, matches)
   return os.date("Heute ist der %d.%m.%Y und es ist %H:%M:%S")
end

return {
    description = "Zeigt das aktuelle Datum und Zeit an", 
    usage = {"/date"},
    patterns = {"^/date$"}, 
    run = run 
}
