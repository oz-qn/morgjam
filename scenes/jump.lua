---@class JumpScene : Scene
local Jump = {}

local game_canvas = love.graphics.newCanvas(640,480)
game_canvas:setFilter("nearest", "nearest", 1)

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

  graphics.setCanvas(game_canvas)
    graphics.clear(0, 0, 0, 0)
    graphics.setColor(0.2, 0.2, 0.2)
    graphics.rectangle("fill", 0, 0, 640, 480)
    graphics.setColor(1, 1, 1)
    graphics.print(player.char, player.x, player.y)
    graphics.setColor(Color.RED)
    graphics.rectangle("line", player.x,  player.y + 2, player.shape.w, player.shape.h)
    graphics.setColor(Color.WHITE)
  graphics.setCanvas()

  local scale = ScreenHeight/game_canvas:getHeight()
  local x_offset = (ScreenWidth/2) - (game_canvas:getWidth()/2 * scale)
  graphics.draw(game_canvas, x_offset, 0, 0, scale, scale)
end

function Jump:exit()

end

---@diagnostic disable-next-line
function Jump:keypressed(key, scancode, isrepeat)

end

return Jump --[[@as Scene]]
