function love.load()
  one =   newButton({x = 0, y = 220}, {width = 50, height = 50})
  two =   newButton({x = 60, y = 220}, {width = 50, height = 50})
  three = newButton({x = 120, y = 220}, {width = 50, height = 50})
  four =  newButton({x = 0, y = 160}, {width = 50, height = 50})
  five =  newButton({x = 60, y = 160}, {width = 50, height = 50})
  six =   newButton({x = 120, y = 160}, {width = 50, height = 50})
  seven = newButton({x = 0, y = 100}, {width = 50, height = 50})
  eight = newButton({x = 60, y = 100}, {width = 50, height = 50})
  nine =  newButton({x = 120, y = 100}, {width = 50, height = 50})
  zero =  newButton({x = 60, y = 280}, {width = 50, height = 50})
end

function love.draw()
  one.draw()
  two.draw()
  three.draw()
  four.draw()
  five.draw()
  six.draw()
  seven.draw()
  eight.draw()
  nine.draw()
  zero.draw()
end

function love.update(dt)
  print('called: ', dt)
end

function newButton(location, size)
  local self = {}

  self.color = {131, 192, 240}
  self.x = location.x
  self.y = location.y
  self.width = size.width
  self.height = size.height

  self.draw = function()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  end

  return self
end
