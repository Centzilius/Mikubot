--[[
-- Translate text using Google Translate.
-- http://translate.google.com/translate_a/t?client=z&ie=UTF-8&oe=UTF-8&hl=en&tl=en&text=hello
--]]
do

function translate(source_lang, target_lang, text)
  local path = "http://translate.google.com/translate_a/t"
  -- URL query parameters
  local params = {
    client = "z", -- JSON
    ie = "UTF-8",
    oe = "UTF-8",
    hl = "de",
    tl = target_lang or "de",
    sl = source_lang or "",
    text = URL.escape(text)
  }

  local query = format_http_params(params, true)
  local url = path..query

  local res, code = https.request(url)
  if res == nil then
    return 'Text kann momentan nicht übersetzt werden. Probiere es später erneut. URL: '..url
  end
  -- Return nil if error
  if code > 200 then return nil end
  
  local trans = json:decode(res)
  
  local sentences = ""
  -- Join multiple sencentes
  for k,sentence in pairs(trans.sentences) do
    sentences = sentences..sentence.trans..'\n'
  end

  return sentences
end

function run(msg, matches)
  -- Third pattern
  if #matches == 1 then
    print("First")
    local text = matches[1]
    return translate(nil, nil, text)
  end

  -- Second pattern
  if #matches == 2 then
    print("Second")
    local target = matches[1]
    local text = matches[2]
    return translate(nil, target, text)
  end

  -- Frist pattern
  if #matches == 3 then
    print("Third")
    local source = matches[1]
    local target = matches[2]
    local text = matches[3]
    return translate(source, target, text)
  end

end

return {
  description = "Übersetze Text", 
  usage = {"/translate [Text]"},
  patterns = {"^/translate ([%w]+),([%a]+) (.+)","^/translate ([%w]+) (.+)","^/translate (.+)",}, 
  run = run 
}

end