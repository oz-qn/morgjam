---@class Signal
---@field bindings function[]
local Signal = {}
Signal.__index = Signal

---@return Signal
function Signal.new()
  local s = {}
  s.bindings = {}
  return setmetatable(s, Signal)
end

function Signal:connect(binding)
  table.insert(self.bindings, binding)
end

function Signal:disconnect(binding)
  for i in ipairs(self.bindings) do
    if self.bindings[i] == binding then
      table.remove(self.bindings, i)
    end
  end
end

function Signal:emit(...)
  for _, v in ipairs(self.bindings) do
    v(...)
  end
end

function Signal:clear()
  for i in ipairs(self.bindings) do
    self.bindings[i] = nil
  end
end

return Signal --[[@as Signal]]
