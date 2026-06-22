---@class Canvas
---@field buffer love.Canvas
---@field width number
---@field height number
local Canvas = {}
Canvas.__index = Canvas

local graphics = love.graphics

---@param x number
---@param y number
---@param type love.FilterMode
---@return Canvas
function Canvas.new(width, height, type)
  local c = {}
  c.buffer = graphics.newCanvas(width, height)
  c.buffer:setFilter(type, type, 1)
  return setmetatable(c, Canvas)
end

function Canvas:attach()
  graphics.setCanvas(self.buffer)
end

function Canvas:detach()
  graphics.setCanvas()
end

---@return number
function Canvas:getHeight()
  return self.buffer:getHeight()
end

---@return number
function Canvas:getWidth()
  return self.buffer:getWidth()
end

---@param x number
---@param y number
---@param r number
---@param sx number
---@param sy number
function Canvas:draw(x, y, r, sx, sy)
  graphics.draw(self.buffer, x or 0, y or 0, r or 0, sx or 1, sy or 1)
end

return Canvas
