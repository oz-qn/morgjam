---@class Rect2Module
local module = {}

---@class Rect2
---@field x number
---@field y number
---@field w number
---@field h number
local Rect2 = {}
Rect2.__index = Rect2
---@diagnostic disable-next-line
Rect2.__tostring = function(self) return "position: ("..self.x..", "..self.y..") size: ("..self.w..", "..self.h..")" end

---@param x number
---@param y number
---@param w number
---@param h number
function Rect2.new(x, y, w, h)
  local rect = {}
  rect.x = x or 0
  rect.y = y or 0
  rect.w = w or 0
  rect.h = h or 0
  return setmetatable(rect, Rect2)
end

---@diagnostic disable 
---@param rect Rect2
---@return boolean
function Rect2:check_rect(rect)
  return self.x < rect.x+rect.w and
         rect.x < self.x+self.w and
         self.y < rect.y+rect.h and
         rect.y < self.y+self.h
end

---@param rect Rect2
---@return boolean
function Rect2:check_rect_border(rect)
  return self.x <= rect.x+rect.w and
         rect.x <= self.x+self.w and
         self.y <= rect.y+rect.h and
         rect.y <= self.y+self.h
end

---@param point Vector.lua
---@return boolean
function Rect2:check_point(point)
  return self.x < point.x and
         point.x < self.x+self.w and
         self.y < point.y and
         point.y < self.y + self.h
end

---@param point Vector.lua
---@return boolean
function Rect2:check_point_border(point)
  return self.x <= point.x and
         point.x <= self.x+self.w and
         self.y <= point.y and
         point.y <= self.y + self.h
end

return setmetatable(module,{__call = function(_,...) return Rect2.new(...) end}) ---@return Rect2Module
