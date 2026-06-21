---@class JumpScene : Scene
local Jump = {}

function Jump:enter()
  self.Player = require("obj.player")
  self.player = self.Player.new(0, 0, 200, 300)
end

function Jump:update(dt)
  self.player:update(dt)
end

function Jump:draw()
  local graphics = love.graphics
  graphics.print("D", self.player.x, self.player.y)
  graphics.setColor(Color.RED)
  graphics.rectangle("line", self.player.x,  self.player.y + 2, self.player.shape.w, self.player.shape.h)
  graphics.setColor(Color.WHITE)
end

function Jump:exit()

end

function Jump:keypressed(key, scancode, isrepeat)

end

return Jump --[[@as Scene]]
