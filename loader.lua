local GamesURL = "https://raw.githubusercontent.com/FlorzyyH4X/thinkware/main/games/"
local PlaceId = game.PlaceId

local ScriptURL = GamesUrl .. PlaceId .. ".lua"
local Loaded = loadstring(game:HttpGet(ScriptURL))

if Loaded then
  Loaded()
end
