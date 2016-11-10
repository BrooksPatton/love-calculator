function love.load()
  calculatorButtons = createButtons()

  -- TODO turn into closure for data storage
  calculator = {
    display = '',
    operator = nil,
    operandOne = '',
    operandTwo = '',
    resetdisplay = true,
    maxDisplayLength = 5
  }


  resultFont = love.graphics.newFont(50)
end

function love.draw()
  for k,v in pairs(calculatorButtons) do
    v.draw()
  end

  -- TODO put into its own function
  love.graphics.setFont(resultFont)
  love.graphics.setColor(255, 255, 255)
  love.graphics.printf(calculator.display, 0, 25, 170, 'right')
end

function love.mousepressed(x, y, button)
  if string.len(calculator.display) < calculator.maxDisplayLength then
    for k,v in pairs(calculatorButtons) do
      if v.clicked(x, y) then
        updateCalculator(k)
      end
    end
  end
end

function createButtons()
  local buttons = {}

  buttons[1] =   newButton('1', {x = 0, y = 220}, {width = 50, height = 50})
  buttons[2] =   newButton('2', {x = 60, y = 220}, {width = 50, height = 50})
  buttons[3] = newButton('3', {x = 120, y = 220}, {width = 50, height = 50})
  buttons[4] =  newButton('4', {x = 0, y = 160}, {width = 50, height = 50})
  buttons[5] =  newButton('5', {x = 60, y = 160}, {width = 50, height = 50})
  buttons[6] =   newButton('6', {x = 120, y = 160}, {width = 50, height = 50})
  buttons[7] = newButton('7', {x = 0, y = 100}, {width = 50, height = 50})
  buttons[8] = newButton('8', {x = 60, y = 100}, {width = 50, height = 50})
  buttons[9] =  newButton('9', {x = 120, y = 100}, {width = 50, height = 50})
  buttons[0] =  newButton('0', {x = 60, y = 280}, {width = 50, height = 50})
  buttons.plus =  newButton('+', {x = 0, y = 280}, {width = 50, height = 50}, {246,	135, 44})
  buttons.equals =  newButton('=', {x = 120, y = 280}, {width = 50, height = 50}, {246,	135, 44})

  return buttons
end

-- TODO Turn into class for oop instead of closure
function newButton(text, location, size, color)
  local self = {}

  self.color = color or {131, 192, 240}
  self.x = location.x
  self.y = location.y
  self.width = size.width
  self.height = size.height

  local text = text
  local font = love.graphics.newFont(12)

  self.draw = function()
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

    love.graphics.setFont(font)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(text, self.x, self.y + ((self.height / 2) - (font:getHeight() / 2)), self.width, 'center')
  end

  self.clicked = function(x, y)
    return (x > self.x) and (x < self.x + self.width) and (y > self.y) and (y < self.y + self.height)
  end

  return self
end

function updateCalculator(buttonKey)
  if not calculator.operator and (buttonKey ~= 'plus' and buttonKey ~= 'equals') then
    if calculator.esetdisplay then
      calculator.display = ''
      calculator.esetdisplay = false
    end

    calculator.display = calculator.display .. buttonKey
    calculator.operandOne = calculator.operandOne .. buttonKey
  elseif (buttonKey ~= 'plus' and buttonKey ~= 'equals') then
    if calculator.esetdisplay then
      calculator.display = ''
      calculator.esetdisplay = false
    end

    calculator.display = calculator.display .. buttonKey
    calculator.operandTwo = calculator.operandTwo .. buttonKey
  elseif buttonKey == 'plus' then
    calculator.operator = 'plus'
    calculator.esetdisplay = true
  else
    calculator.display = tonumber(calculator.operandOne) + tonumber(calculator.operandTwo)
    calculator.operandOne, calculator.operandTwo = '', ''
    calculator.operator = nil
    calculator.esetdisplay = true
  end
end
