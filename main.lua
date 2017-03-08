
function love.load()
  -- deze variabele zal straks alle stukjes bevatten
  slang = {}

  -- grootte van een stukje
  stukGrootte = 15

  -- beginlengte van de slang in stukjes
  lengte = 2

  -- eerste paar stukjes van de slang
  for i = 1, lengte do
    slangStukje = {
      x = love.graphics.getWidth()/2-stukGrootte*i,
      y = love.graphics.getHeight()/2,
      richtingX = 1,
      richtingY = 0
    }
    table.insert(slang, slangStukje)
  end

  -- beginsnelheid van de slang
  snelheid = 1

  -- het punt waar een stukje van de slang
  -- van richting moet veranderen
  keerPunt = slang[1]
end

function love.draw()
  love.graphics.setColor(120, 200, 0, 255)

  -- teken de slang
  for k, slangStukje in pairs(slang) do
    love.graphics.circle("fill", slangStukje.x, slangStukje.y, stukGrootte, 16)
  end
end

function love.update()
  -- Verander de beweging om naar links, rechts, onder of boven te bewegen
  if love.keyboard.isDown("left") or
    love.keyboard.isDown("right") or
    love.keyboard.isDown("up") or
    love.keyboard.isDown("down") then

    if love.keyboard.isDown("left") then
      keerPunt.richtingX = -1
      keerPunt.richtingY = 0
    elseif love.keyboard.isDown("right") then
      keerPunt.richtingX = 1
      keerPunt.richtingY = 0
    elseif love.keyboard.isDown("up") then
      keerPunt.richtingY = -1
      keerPunt.richtingX = 0
    elseif love.keyboard.isDown("down") then
      keerPunt.richtingY = 1
      keerPunt.richtingX = 0
    end

    keerPunt.x = slang[1].x
    keerPunt.y = slang[1].y
  end

  -- Verander de positie van elk stukje van de slang
  -- als dit stukje bij het keerpunt is
  for k, slangStukje in pairs(slang) do
    if slangStukje.x == keerPunt.x and slangStukje.y == keerPunt.y then
      slangStukje = keerPunt
    end

    slangStukje.x = slangStukje.x + slangStukje.richtingX * snelheid
    slangStukje.y = slangStukje.y + slangStukje.richtingY * snelheid
  end

end
