local module = {}

---@class Signal
---@field bindings function[]

local Signal = {}
Signal.__index = Signal

Signal.bindings = {}

---@return Signal
function Signal.new()
  return setmetatable({}, Signal)
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
  for i in ipairs(self.bindings) do
    self.bindings[i](...)
  end
end

function Signal:clear()
  for i in ipairs(self.bindings) do
    self.bindings[i] = nil
  end
end

---@return Signal
module.new = Signal.new

return setmetatable(module,{__call = Signal.new}) ---@return Signal
