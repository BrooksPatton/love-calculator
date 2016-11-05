function love.load()
  box1 = createBox(100, 100, 250, 250, 'red')
  box2 = createBox(100, 100, 0, 0, 'red')

  font = 65

  isFullscreen = false
end

function love.draw()
  love.graphics.print('Testing', 100, 300)

  drawBox(box1, '1')
  drawBox(box2, '2')
end

function love.mousepressed(x, y, button, istouch)
  if boxClicked(box1, {x = x, y = y}) then
    isFullscreen = not isFullscreen
    love.window.setFullscreen(isFullscreen)
  end
end

function createBox(width, height, x, y, color)
  local box = {}

  box.x = x
  box.y = y
  box.width = width
  box.height = height

  if color == 'red' then
    box.color = {224, 108, 112}
  end

  return box
end

function drawBox(box, text)
  love.graphics.setColor(box.color[1], box.color[2], box.color[3])
  love.graphics.rectangle('fill', box.x, box.y, box.width, box.height)

  love.graphics.setColor(255,255,255, 255)
  love.graphics.setNewFont('Monoid-Regular.ttf', font)
  love.graphics.printf(text, box.x, box.y + (box.height / font), box.width, 'center')
end

function boxClicked(box, coordinates)
  return (coordinates.x > box.x and coordinates.x < box.x + box.width) and (coordinates.y > box.y and coordinates.y < box.y + box.height)
end
