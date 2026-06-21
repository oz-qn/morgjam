function love.load()
  love.window.setTitle("ozqngine")

  _G.Engine = require "engine.engine"
  Engine:init()

  _G.Game = require "game"
  Game:load()
end

function love.update(dt)
  Game:update(dt)
end

function love.draw()
  Game:draw()
end

function love.keypressed(key, scancode, isrepeat)
  Game:keypressed(key, scancode, isrepeat)
end

