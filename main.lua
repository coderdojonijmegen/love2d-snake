
function love.load()
  -- beginpositie van snake
  positieX = love.graphics.getWidth()/2;
  positieY = love.graphics.getHeight()/2;

  -- grootte van snake
  grootte = 15

  -- lengte van snake
  lengte = 4

  -- snelheid van snake
  snelheid = 2

  -- beginsnelheid van snake
  bewegingX = snelheid
  bewegingY = 0
end

function love.draw()
  love.graphics.setColor(120, 200, 0, 255)

  --[[
  for i = 0, lengte do
    love.graphics.circle("fill", positieX + i * grootte, positieY + i * grootte, grootte, 16)
  end
  ]]

  love.graphics.circle("fill", positieX, positieY, grootte, 16)
end

function love.update()
  -- Verander de beweging om naar links, rechts, onder of boven te bewegen
  if love.keyboard.isDown("left") then
    bewegingX = -snelheid
    bewegingY = 0
  elseif love.keyboard.isDown("right") then
    bewegingX = snelheid
    bewegingY = 0
  elseif love.keyboard.isDown("up") then
    bewegingY = -snelheid
    bewegingX = 0
  elseif love.keyboard.isDown("down") then
    bewegingY = snelheid
    bewegingX = 0
  end

  -- Verander de positie van snake
  positieX = positieX + bewegingX
  positieY = positieY + bewegingY
end
