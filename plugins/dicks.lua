do


local dicks = {
  "http://i.imgur.com/A5IdNU7.jpg",
  "http://i.imgur.com/0pEACyI.jpg",
  "http://i.imgur.com/x2NNn9P.jpg",
  "http://i.imgur.com/9FA7NJr.jpg",
  "http://t.co/7LOy7LNSzV",
}


function getRandomDicks()
  return dicks[ math.random( #dicks ) ]
end


function run(msg, matches)
  local url = nil
  url = getRandomDicks()

  if url ~= nil then
    local receiver = get_receiver(msg)
    send_photo_from_url(receiver, url)
  else
    return 'Huch, da lief was falsch.'
  end
end


return {
  description = "Das dümmste Plugin ever [NSFW]",
  usage = {"/dicks"},
  patterns = {"^/dicks$"},
  run = run
}

end