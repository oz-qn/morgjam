---@class Color
---@field r number
---@field g number
---@field b number
---@field a number
local Color = {}

---@param r number|nil
---@param g number|nil
---@param b number|nil
---@param a number|nil
---@return Color
function Color.new(r, g, b, a)
  local color = {}
  color.r = r or 1
  color.g = g or 1
  color.b = b or 1
  color.a = a or 1
  return color
end

---@param r number|nil
---@param g number|nil
---@param b number|nil
---@param a number|nil
function Color.newArray(r, g, b, a)
  return {r or 0.0, g or 0.0, b or 0.0, a or 1.0}
end

Color.BLACK = Color.newArray(0, 0, 0, 1)
Color.WHITE = Color.newArray(1, 1, 1, 1)
Color.BLUE = Color.newArray(0, 0, 1, 1)
Color.RED = Color.newArray(1, 0, 0, 1)
Color.GREEN = Color.newArray(0, 1, 0, 1)

return Color ---@return Color
