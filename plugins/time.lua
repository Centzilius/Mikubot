-- Implement a command /time [area] which uses
-- 2 Google APIs to get the desired result:
--   1. Geocoding to get from area to a lat/long pair
--   2. Timezone to get the local time in that lat/long location

-- Globals
-- If you have a google api key for the geocoding/timezone api
api_key  = nil
base_api = "https://maps.googleapis.com/maps/api"
dateFormat = "%A, der %d. %B %Y und es ist %H:%M:%S Uhr [%p]"

-- Need the utc time for the google api
function utctime()
   return os.time(os.date("!*t"))
end

-- Use the geocoding api to get the lattitude and longitude with accuracy specifier
-- CHECKME: this seems to work without a key??
function get_latlong(area)
   local api        = base_api .. "/geocode/json?"
   local parameters = "address=".. (URL.escape(area) or "")
   if api_key ~= nil then
      parameters = parameters .. "&key="..api_key
   end

   -- Do the request
   local res, code = https.request(api..parameters)
   if code ~=200 then return nil  end
   local data = json:decode(res)
 
   if (data.status == "ZERO_RESULTS") then
      return nil
   end
   if (data.status == "OK") then
      -- Get the data
      lat  = data.results[1].geometry.location.lat
      lng  = data.results[1].geometry.location.lng
      acc  = data.results[1].geometry.location_type
      types= data.results[1].types
      return lat,lng,acc,types
   end
end

-- Use timezone api to get the time in the lat,
-- Note: this needs an API key
function get_time(lat,lng)
   local api  = base_api .. "/timezone/json?"

   -- Get a timestamp (server time is relevant here)
   local timestamp = utctime()
   local parameters = "location=" ..
      URL.escape(lat) .. "," ..
      URL.escape(lng) .. 
      "&timestamp="..URL.escape(timestamp)
   if api_key ~=nil then
      parameters = parameters .. "&key="..api_key
   end

   local res,code = https.request(api..parameters)
   if code ~= 200 then return nil end
   local data = json:decode(res)
   
   if (data.status == "ZERO_RESULTS") then
      return nil
   end
   if (data.status == "OK") then
      -- Construct what we want
      -- The local time in the location is:
      -- timestamp + rawOffset + dstOffset
      local localTime = timestamp + data.rawOffset + data.dstOffset
      return localTime, data.timeZoneId
   end
   return localTime
end

function getformattedLocalTime(area)
   if area == nil then
      return 'Die Zeit nirgendswo ist nirgendswo...'
   end

   lat,lng,acc = get_latlong(area)
   if lat == nil and lng == nil then
      return 'Sieht nicht so aus, als hätten sie in "'..area..'" eine Zeit.'
   end
   local localTime, timeZoneId = get_time(lat,lng)

	text = 'Die lokale Zeit in "'..timeZoneId..'" ist: '.. os.date(dateFormat,localTime)
	
	-- Days
	text = string.gsub(text, "Monday", "Montag")
	text = string.gsub(text, "Tuesday", "Dienstag")
	text = string.gsub(text, "Wednesday", "Mittwoch")
	text = string.gsub(text, "Thursday", "Donnerstag")
	text = string.gsub(text, "Friday", "Freitag")
	text = string.gsub(text, "Saturday", "Samsstag")
	text = string.gsub(text, "Sunday", "Sonntag")
	
	-- Months
	text = string.gsub(text, "January", "Januar")
	text = string.gsub(text, "February", "Februar")
	text = string.gsub(text, "March", "März")
	text = string.gsub(text, "April", "April")
	text = string.gsub(text, "May", "Mai")
	text = string.gsub(text, "June", "Juni")
	text = string.gsub(text, "July", "Juli")
	text = string.gsub(text, "August", "August")
	text = string.gsub(text, "September", "September")
	text = string.gsub(text, "October", "Oktober")
	text = string.gsub(text, "November", "November")
	text = string.gsub(text, "December", "Dezember")

	return text
end

function run(msg, matches)
  if string.match(msg.text, "^/[Z|z]eit$") or string.match(msg.text, "^/[T|t]ime$") then
  text = os.date("Es ist %H:%M:%S Uhr [%p]")
   return text
   else
   return getformattedLocalTime(matches[1])
end
end

return {
    description = "Zeigt die lokale Zeit in einer Zeitzone an", 
    usage = {'/zeit [Land/Ort]'},
    patterns = {'^/[Z|z]eit (.*)$','^/[T|t]ime (.*)$','^/[Z|z]eit$','^/[T|t]ime$'}, 
    run = run 
}
