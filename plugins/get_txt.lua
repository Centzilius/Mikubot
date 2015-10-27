local function run(msg, matches)
 local res,code = http.request(matches[1]..'.txt')
 if code ~= 200 then return nil end
 return res
end


return {
  description = "", 
  usage = "",
  patterns = {"^(.*).txt$"},
  run = run 
}