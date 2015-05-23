do

local function get_pokemon(query)
  local url = "http://pokeapi.co/api/v1/pokemon/" .. query .. "/"
  local b,c = http.request(url)
  local pokemon = json:decode(b)

  if pokemon == nil then
    return 'Kein Pokemon gefunden.'
  end
  return  'Pokédex ID: ' .. pokemon.pkdx_id .. '\n'
        ..'Name: ' .. pokemon.name .. '\n'
        ..'Gewicht: ' .. pokemon.weight .. '\n'
        ..'Größe: ' .. pokemon.height .. '\n'
        ..'Speed: ' .. pokemon.speed .. '\n'
		..'Spezies: ' .. pokemon.species .. '\n'
end

local function run(msg, matches)
  return get_pokemon(matches[1])
end

return {
  description = "Pokedex für Telegram",
  usage = "/pokedex [Name/ID]",
  patterns = {"^/pokedex (.*)$"},
  run = run
  }
  
  end