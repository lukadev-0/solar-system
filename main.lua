function love.load()
  earth = {}
  earth.x, earth.y = 500, 300

  sun = {}
  sun.x, sun.y = 0, 300

  moon = {}
  moon.x, moon.y = 600, 300

  blue = 255
end

dtotal = 0
function love.update(dt)
  dtotal = dtotal + dt

  if math.floor(dtotal) % 2 == 0 then
    blue = 117
    moon.x = moon.x - 100 * dt
    moon.y = moon.y - 100 * dt
  else 
    blue = 255
    moon.x = moon.x - 100 * dt
    moon.y = moon.y + 100 * dt
  end

  if checkSunCollision(moon.x, sun.x, moon.y, sun.y) < 25 then
    moon.x = 10000
    moon.y = 10000
  end
end

function love.draw()
  love.graphics.setColor(0, 0, 0)

  love.graphics.setColor(255, 255, 0)
  love.graphics.circle("fill", sun.x, sun.y, 100)

  love.graphics.setColor(0, 0, blue)
  love.graphics.circle("fill", earth.x, earth.y, 50)

  love.graphics.setColor(169, 169, 169)
  love.graphics.circle("fill", moon.x, moon.y, 25)

  love.graphics.print(dtotal)
end

function checkSunCollision(x1, y1, x2, y2)
  return math.sqrt( (x2 - x1)^2 + (y2 - y1) )
end
