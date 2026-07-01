function _G.reverseipairs(array)
  local function reverse(array, i)
    i = i - 1
    if i ~= 0 then
      return i, array[i]
    end
  end
  return reverse, array, #array+1
end
