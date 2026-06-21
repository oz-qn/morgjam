
local Game = {}

---@type boolean
Game.debug = true

function Game:load()
  local starting_scene = require("scenes.jump")
  self:set_scene(starting_scene)
end

---@param dt number
---@diagnostic disable-next-line
function Game:update(dt)
  self.current_scene:update(dt)
end

function Game:draw()
  self.current_scene:draw()
end

function Game:quit()
  self.current_scene:exit()
  love.event.quit()
end

---@param scene Scene
function Game:set_scene(scene)
  if self.current_scene then
    self.current_scene:exit()
  end
  self.current_scene = scene
  self.current_scene:enter()
end

--- @diagnostic disable-next-line
function Game:keypressed(key, scancode, isrepeat)
  if self.current_scene then
    self.current_scene:keypressed(key, scancode, isrepeat)
  end

  if key == "escape" and Game.debug == true then
    Game:quit()
  end
end

return Game
