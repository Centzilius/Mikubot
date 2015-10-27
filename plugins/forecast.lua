do

local BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily"

local function get_condition_symbol(weather, n)
  if weather.list[n].weather[1].main == 'Clear' then
	return ' ?'
  elseif weather.list[n].weather[1].main == 'Clouds' then
	return ' ??'
  elseif weather.list[n].weather[1].main == 'Rain' then
    return ' ?'
  elseif weather.list[n].weather[1].main == 'Thunderstorm' then
	return ' ????'
  elseif weather.list[n].weather[1].main == 'Snow' then
	return ' ??'
  else
    return ''
  end
end

local function get_temp(weather, n)
  local day = string.gsub(round(weather.list[n].temp.day, 1), "%.", "%,")
  local night = string.gsub(round(weather.list[n].temp.night, 1), "%.", "%,")
  local condition = weather.list[n].weather[1].description
  return '?? '..day..'°C | ?? '..night..'°C | '..condition
end

local function get_forecast(location, days)
  print("Bekomme Wettervorhersage für ", location)
  local location = string.gsub(location," ","+")
  local url = BASE_URL
  local apikey = cred_data.owm_apikey
  local url = url..'?q='..location
  local url = url..'&lang=de&units=metric&cnt='..days..'&APPID='..apikey

  local b, c, h = http.request(url)
  if c ~= 200 then return nil end

  local weather = json:decode(b)
  local city = weather.city.name
  if weather.city.country == "" then
    country = ''
  else
    country = ' ('..weather.city.country..')'
  end
  local header = 'Vorhersage für '..city..country..':\n'
  
  local text = 'Heute: '..get_temp(weather, 1)..get_condition_symbol(weather, 1)
  
  if days > 1 then
    text = text..'\nMorgen: '..get_temp(weather, 2)..get_condition_symbol(weather, 2)
  end
  if days > 2 then
    text = text..'\nÜbermorgen: '..get_temp(weather, 3)..get_condition_symbol(weather, 3)
  end
  
  if days > 3 then
    for day in pairs(weather.list) do
	  if day > 3 then 
	    local actual_day = day-1
        text = text..'\n'..actual_day..' Tage: '..get_temp(weather, day)..get_condition_symbol(weather, day)
	  end
    end
  end
  
  return header..text
end

local function run(msg, matches)
  local city = 'Berlin'
  
  if matches[2] then
    days = matches[1]+1
    city = matches[2]
  elseif matches[1] ~= '!forecast' then
    days = 4
    city = matches[1]
  end
  
  if days > 17 then
    return 'Wettervorhersagen gehen nur von 1-16 Tagen!'
  end
  
  local text = get_forecast(city, days)
  if not text then
    text = 'Konnte die Wettervorhersage für diese Stadt nicht bekommen.'
  end
  return text
end

return {
  description = "Wettervorhersage für diese Stadt (Berlin ist Standard)", 
  usage = {
    "/forecast (Stadt): Wettervorhersage für diese Stadt",
	"/forecast [0-16] (Stadt): Wettervorhersage für X Tage für diese Stadt"
  },
  patterns = {
    "^/forecast$",
	"^/forecast (%d+) (.*)$",
	"^/forecast (.*)$"
  }, 
  run = run 
}

end