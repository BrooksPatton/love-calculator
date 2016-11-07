function love.load()
  one =   newButton('1', {x = 0, y = 220}, {width = 50, height = 50})
  two =   newButton('2', {x = 60, y = 220}, {width = 50, height = 50})
  three = newButton('3', {x = 120, y = 220}, {width = 50, height = 50})
  four =  newButton('4', {x = 0, y = 160}, {width = 50, height = 50})
  five =  newButton('5', {x = 60, y = 160}, {width = 50, height = 50})
  six =   newButton('6', {x = 120, y = 160}, {width = 50, height = 50})
  seven = newButton('7', {x = 0, y = 100}, {width = 50, height = 50})
  eight = newButton('8', {x = 60, y = 100}, {width = 50, height = 50})
  nine =  newButton('9', {x = 120, y = 100}, {width = 50, height = 50})
  zero =  newButton('0', {x = 60, y = 280}, {width = 50, height = 50})
  plus =  newButton('+', {x = 0, y = 280}, {width = 50, height = 50}, {246,	135, 44})
  equals =  newButton('=', {x = 120, y = 280}, {width = 50, height = 50}, {246,	135, 44})

  display = 0
  operator = nil
  operandOne = nil
  operandTwo = nil
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
  plus.draw()
  equals.draw()
end

function love.update(dt)

end

function newButton(text, location, size, color)
  local self = {}

  self.color = color or {131, 192, 240}
  self.x = location.x
  self.y = location.y
  self.width = size.width
  self.height = size.height

  local text = text

  local font = love.graphics.getFont()

  self.draw = function()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, self.x, self.y + ((self.height / 2) - (font:getHeight() / 2)), self.width, 'center')
  end

  return self
end
