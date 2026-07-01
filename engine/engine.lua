local Engine = {}

function Engine:init()
  ---@diagnostic disable-next-line
  if jit then
    print("INFO: LuaJit is enabled.")
  end
  _G.Config = require("engine.config")
  _G.Utils = require("engine.utils")

  _G.Bump = require("lib.bump")
  _G.Physics = require "engine.physics"

  _G.Types = require "engine.types"
  Types.init()

  _G.mathy = require "engine.mathy"
  _G.Input = require "engine.input"

  ScreenWidth, ScreenHeight = love.graphics.getDimensions()
end

return Engine
