---@class CircleShape
---@field x number
---@field y number
---@field radius number
---@field layer PhysicsLayer
---@field mask PhysicsLayer
---@field is_overlapping function

local Circle = {}

---@param x number
---@param y number
---@param radius number
---@param layer PhysicsLayer
---@param mask PhysicsLayer|nil
---@return CircleShape
function Circle.new(x, y, radius, layer, mask)
  local circle = {}
  circle.x = x or 0
  circle.y = y or 0
  circle.radius = radius
  circle.layer = layer or Physics.Layers.WORLD
  circle.mask = mask or Physics.Layers.WORLD
  ---@param other CircleShape
  ---@return boolean
  function circle:is_overlapping(other)
    if self.mask ~= other.layer then return false end
    local dist_sqrd = (other.x - self.x)^2 + (other.y-self.y)^2
    return dist_sqrd <= (self.radius + other.radius)^2
  end
  Physics:register_collider(circle)
  return circle
end

return Circle ---@return CircleShape
