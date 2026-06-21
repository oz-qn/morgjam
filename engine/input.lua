local Input = {}
---@param left string
---@param right string
---@param up string
---@param down string
---@param normalize boolean
---@return integer
---@return integer
function Input.get_vector(left, right, up, down, normalize)
  local x = -bool2num(love.keyboard.isDown(left)) + bool2num(love.keyboard.isDown(right))
  local y = -bool2num(love.keyboard.isDown(up)) + bool2num(love.keyboard.isDown(down))
  if normalize then return _G.normalize(x, y) end
  return x, y
end

return Input
