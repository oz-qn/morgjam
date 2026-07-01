local Physics = {}

---@alias PhysicsLayer integer
Physics.Layers = {
  WORLD = 1,
  PLAYER = 2,
  ENEMY = 3,
}

Physics.colliders = {}

for _, v in pairs(Physics.Layers) do
  Physics.colliders[v] = {}
end

function Physics:register_collider(collider)
  table.insert(self.colliders[collider.layer], collider)
end

---@return boolean
---@return CircleShape | nil
function Physics:check_collision(collider)
  ---@diagnostic disable-next-line
  for index, other in ipairs(Physics.colliders[collider.mask]) do
    local check = collider:is_overlapping(other)
    if check then return true, other end
  end
  return false, nil
end

---@param world table
---@param startx integer
---@param starty integer
---@param endx integer
---@param endy integer
---@param filter function | nil
---@return table
---@return integer
function Physics.raycast(world, startx, starty, endx, endy, filter)
  return world:querySegmentWithCoords(startx, starty, endx, endy, filter or nil)
end

return Physics
