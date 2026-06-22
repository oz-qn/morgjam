---@class JumpScene : Scene
local Jump = {}

local game_canvas ---@type Canvas

local player ---@type Player
local test = {name="b"}

function Jump:enter()
  _G.current_scene = self

  self.physics = Bump.newWorld()

  game_canvas = Canvas.new(640, 480, "nearest")

  _G.Player = require("obj.player")
  player = Player.new(0, 0, 200, 300)
  self.physics:add(player, player.x, player.y, player.shape.w, player.shape.h)
  self.physics:add(test, 200, 300, 100, 100)
end

function Jump:update(dt)
  player:update(dt)
end

function Jump:draw()
  local graphics = love.graphics

  game_canvas:attach()

  graphics.clear(0, 0, 0, 0)
  graphics.setColor(0.2, 0.2, 0.2)
  graphics.rectangle("fill", 0, 0, 640, 480)
  graphics.setColor(1, 1, 1)
  graphics.print(player.char, player.x, player.y)
  graphics.setColor(Color.RED)

  self:drawBow(self.physics:getRect(player))

  graphics.setColor(Color.GREEN)
  self:drawBow(self.physics:getRect(test))

  graphics.setColor(Color.WHITE)
  game_canvas:detach()

  local scale = ScreenHeight/game_canvas:getHeight()
  local x_offset= (ScreenWidth/2) - (game_canvas:getWidth()/2 * scale)
  game_canvas:draw(x_offset, 0, 0, scale, scale)
end

function Jump:drawBow(x, y, w, h)
  love.graphics.rectangle("line", x, y, w, h)
end

function Jump:exit()

end

---@diagnostic disable-next-line
function Jump:keypressed(key, scancode, isrepeat)

end

return Jump --[[@as Scene]]
