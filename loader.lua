local GamesURL = "https://raw.githubusercontent.com/FlorzyyH4X/thinkware/main/games/"
local PlaceId = game.PlaceId

local ScriptURL = GamesUrl .. PlaceId
local Loaded = loadstring(game:HttpGet(ScriptURL))

if Loaded then
  Loaded()
else
  return 1
end

return 0
