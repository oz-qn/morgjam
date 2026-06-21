---@class JumpScene : Scene
local Jump = {}

local player ---@type Player

function Jump:enter()
  _G.Player = require("obj.player")
  player = Player.new(0, 0, 200, 300)
end

function Jump:update(dt)
  player:update(dt)
end

function Jump:draw()
  local graphics = love.graphics
  graphics.print(player.char, player.x, player.y)
  graphics.setColor(Color.RED)
  graphics.rectangle("line", player.x,  player.y + 2, player.shape.w, player.shape.h)
  graphics.setColor(Color.WHITE)
end

function Jump:exit()

end

---@diagnostic disable-next-line
function Jump:keypressed(key, scancode, isrepeat)

end

return Jump --[[@as Scene]]
