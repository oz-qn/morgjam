---@param value boolean
---@return integer
function _G.bool2num(value)
  return value and 1 or 0
end

---@param speed number
---@param dt number
function _G.exp_decay(a, b, speed, dt)
  return b + (a - b) * math.exp(-speed * dt)
end

---@param a number
---@param min number
---@param max number
function _G.in_range(a, min, max)
  return (a >= min) and (a <= max)
end

---@param a number
---@param min number
---@param max number
---@return number
function _G.clamp(a, min, max)
  if a < min then
    return min
  elseif a > max then
    return max
  end
  return a
end

---@param x number
---@param y number
---@return number
function _G.length(x, y)
  return math.sqrt(x*x + y*y)
end

---@param x number
---@param y number
---@return number
---@return number
function _G.normalize(x, y)
  local length = _G.length(x, y)
  if length == 0 then return x, y end
  return (x/length), (y/length)
end


