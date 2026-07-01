---@class Signal
---@field bindings function[]
local Signal = {}
Signal.__index = Signal

---@enum (key) ConnectionType
_G.ConnectionType = {
  DEFAULT = 1,
  ONESHOT = 2
}

---@return Signal
function Signal.new()
  local s = {}
  s.bindings = {}
  return setmetatable(s, Signal)
end

---@param binding function
---@param type ConnectionType | nil
function Signal:connect(binding, type)
  table.insert(self.bindings, {binding, type or "DEFAULT"})
end

---@param binding function
function Signal:disconnect(binding)
  local is_connected, index = self:is_connected(binding)
  if is_connected then
    table.remove(self.bindings, index)
  end
end

---@private
function Signal:clear_oneshot_signals()
  for index, _ in reverseipairs(self.bindings) do
    table.remove(self.bindings, index)
  end
end

function Signal:emit(...)
  for _, v in ipairs(self.bindings) do
    v[1](...)
  end
  self:clear_oneshot_signals()
end

function Signal:clear()
  for i in ipairs(self.bindings) do
    self.bindings[i] = nil
  end
  self.bindings = {}
end

---@param binding function
---@return boolean
---@return integer
function Signal:is_connected(binding)
  for index, value in ipairs(self.bindings) do
    if value[1] == binding then
      return true, index
    end
  end
  return false, -1
end

---@return integer
function Signal:get_connection_count()
  return #self.bindings
end

return Signal --[[@as Signal]]
