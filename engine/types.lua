local Types = {}

function Types.init()
  _G.Signal = require("lib.signal")
  _G.Vector2 = require("lib.vector")
  _G.Rect2 = require("lib.rect2")
  _G.Object = require("lib.object")
  _G.Circle = require "lib.circle"
  _G.Color = require("lib.color")
  _G.ObjectPool = require("lib.pool")
  _G.Canvas = require("lib.canvas")
end

return Types
