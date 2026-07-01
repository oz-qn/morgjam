---@class JumpScene : Scene
local Jump = {}

local sti = require("lib.sti")
local map

local game_canvas ---@type Canvas

local player ---@type Player

function Jump:enter()

  _G.current_scene = self
  map = sti("maps/test.lua")

  self.physics = Bump.newWorld()

  if map.layers["Colliders"] then
    for i, obj in pairs(map.layers["Colliders"].objects) do
      self.physics:add({id = i}, obj.x, obj.y, obj.width, obj.height)
    end
  end

  game_canvas = Canvas.new(640, 480, "nearest")

  _G.Player = require("obj.player")
  player = Player.new(50, 0, 200, 300)
  player:snap_to_floor()
  self.physics:add(player, player.x, player.y, player.shape.w, player.shape.h)
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

  map:draw()

  graphics.print(player.char, player.x, player.y)

  game_canvas:detach()

  local scale = ScreenHeight/game_canvas:getHeight()
  local x_offset= (ScreenWidth/2) - (game_canvas:getWidth()/2 * scale)
  game_canvas:draw(x_offset, 0, 0, scale, scale)

  graphics.print(love.timer.getFPS())
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
