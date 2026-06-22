---@class ObjectPool
---@field elements any[]
---@field index integer
---@field size integer
local Pool = {}
Pool.__index = Pool

---@return ObjectPool
function Pool.new()
  local p = {}
  p.elements = {}
  p.index = 1
  p.size = 0
  return setmetatable(p, Pool)
end

---@param element any
function Pool:add(element)
  table.insert(self.elements, element)
  self.size = self.size + 1
end

---@return any
function Pool:get_next()
  local element = self.elements[self.index]
  self.index = self.index + 1
  if self.index > self.size then
    self.index = 1
  end
  return element
end

return Pool
