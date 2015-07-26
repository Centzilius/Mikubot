do

local BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

local function get_weather(location)
  print("Finde Wetter in ", location)
  local location = string.gsub(location," ","+")
  local url = BASE_URL
  url = url..'?q='..location
  url = url..'&lang=de&units=metric'

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.name
  local country = weather.sys.country
  local temp = 'Die Temperatur in '..city..' (' ..country..')'..' beträgt '..weather.main.temp..'°C'
  local conditions = 'Die aktuelle Wetterlage ist: '
    .. weather.weather[1].description
  
  if weather.weather[1].main == 'Clear' then
    conditions = conditions .. ' ☀'
  elseif weather.weather[1].main == 'Clouds' then
    conditions = conditions .. ' ☁☁'
  elseif weather.weather[1].main == 'Rain' then
    conditions = conditions .. ' ☔'
  elseif weather.weather[1].main == 'Thunderstorm' then
    conditions = conditions .. ' ☔☔☔☔'
  end

  return temp .. '\n' .. conditions
end

local function run(msg, matches)
  local city = 'Berlin'

  if matches[1] ~= '/wetter' then 
    city = matches[1]
  end
  local text = get_weather(city)
  if not text then
    text = 'Konnte das Wetter dieser Stadt nicht bekommen.'
  end
  return text
end

return {
    description = "Wetter in dieser Stadt (Berlin ist Standard)", 
    usage = "/wetter (Stadt)",
    patterns = {
	    "^/wetter$",
		"^/wetter(.*)$"}, 
    run = run 
}

end