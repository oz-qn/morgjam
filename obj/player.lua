---@class Player
---@field x number
---@field y number
---@field speed number
---@field jump_strength number
---@field shape Rect2
---@field char string
local Player = {}
Player.__index = Player

---@param x number
---@param y number
---@param speed number
---@param jump_strength number
---@return Player
function Player.new(x, y, speed, jump_strength)
  local p = {}
  p.x = x or 0
  p.y = y or 0
  p.char = "P"
  p.shape = Rect2(x, y, 10, 11)
  p.speed = speed or 200
  p.jump_strength = jump_strength or 300
  return setmetatable(p, Player)
end

---@param dt number
function Player:update(dt)
  local ix, iy = Input.get_vector("a", "d", "w", "s", false)
  local dx= self.x + ix * self.speed * dt
  local dy= self.y + iy * self.speed * dt

  self.x, self.y = current_scene.physics:move(self, dx, dy)
end

return Player --[[@as Player]]
