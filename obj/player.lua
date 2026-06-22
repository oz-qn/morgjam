---@class Player
---@field x number
---@field y number
---@field gravity number
---@field vx number
---@field vy number
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
  p.gravity = 980
  p.vx = 0
  p.vy = 0
  p.char = "P"
  p.shape = Rect2(x, y, 10, 11)
  p.speed = speed or 300
  p.jump_strength = jump_strength or 300
  return setmetatable(p, Player)
end

---@param dt number
function Player:update(dt)
  local ix, _ = Input.get_vector("a", "d", "w", "s", false)
  self.vx= ix * self.speed * dt
  self.vy = self.vy + self.gravity * dt
  if self:is_on_floor() then
    self.vy = 0
    if love.keyboard.isDown("space") then
      self.vy = -self.jump_strength
    end
  end
 self.x, self.y = current_scene.physics:move(self, self.x + self.vx, self.y + self.vy * dt)
end

---@return boolean
function Player:is_on_floor()
  ---@diagnostic disable-next-line
  local actualX, actualY, cols, len = current_scene.physics:check(self, self.x, self.y+0.1)
  if len~=0 then
    return true
  end
  return false
end

return Player --[[@as Player]]
