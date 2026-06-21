local Physics = {}

---@alias PhysicsLayer integer
Physics.Layers = {
  WORLD = 1,
  PLAYER = 2,
  ENEMY = 3,
}

Physics.colliders = {}

for k, v in pairs(Physics.Layers) do
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

return Physics
