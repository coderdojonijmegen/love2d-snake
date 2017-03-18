
function love.load()
  -- deze variabele zal straks alle stukjes bevatten
  slang = {}

  -- grootte van een stukje
  stukGrootte = 15

  -- beginlengte van de slang in stukjes
  lengte = 4

  -- eerste paar stukjes van de slang
  for i = 1, lengte do
    slangStukje = {
      positieX = 2*i,
      positieY = 30,
      richtingX = 1,
      richtingY = 0
    }
    table.insert(slang, slangStukje)
  end

  -- het punt waar een stukje van de slang
  -- van richting moet veranderen
  keerPunten = {}

  -- hoeveel seconden de slang er over doet om een stukje te bewegen
  tijd = 0.1

  -- de teller teld tot de tijd is bereikt
  teller = 0

  -- de score begint op 0
  score = 0
end

function love.draw()
  love.graphics.setColor(120, 200, 0, 255)

  -- teken de slang
  for k, slangStukje in pairs(slang) do
    love.graphics.circle("fill", slangStukje.positieX*stukGrootte, slangStukje.positieY*stukGrootte, stukGrootte, 16)
  end

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.print(score .. " punten")
end

function love.update()
  -- voeg een nieuw keerpunt toe als er een knop ingedrukt is
  if love.keyboard.isDown("left") or
    love.keyboard.isDown("right") or
    love.keyboard.isDown("up") or
    love.keyboard.isDown("down") then

    nieuwKeerPunt = {
      positieX = 0,
      positieY = 0,
      richtingX = 0,
      richtingY = 0
    }

    if love.keyboard.isDown("left") then
      nieuwKeerPunt.richtingX = -1
      nieuwKeerPunt.richtingY = 0
    elseif love.keyboard.isDown("right") then
      nieuwKeerPunt.richtingX = 1
      nieuwKeerPunt.richtingY = 0
    elseif love.keyboard.isDown("up") then
      nieuwKeerPunt.richtingY = -1
      nieuwKeerPunt.richtingX = 0
    elseif love.keyboard.isDown("down") then
      nieuwKeerPunt.richtingY = 1
      nieuwKeerPunt.richtingX = 0
    end

    nieuwKeerPunt.positieX = slang[#slang].positieX
    nieuwKeerPunt.positieY = slang[#slang].positieY

    -- voeg het nieuwe keerpunt toe aan de andere keerpunten
    table.insert(keerPunten, nieuwKeerPunt)
  end

  if teller > tijd then
    for k, slangStukje in pairs(slang) do
      -- verander van richting als een stukje bij een keerpunt komt
      for k, keerPunt in pairs(keerPunten) do
        if slangStukje.positieX == keerPunt.positieX and slangStukje.positieY == keerPunt.positieY then
          slangStukje.richtingX = keerPunt.richtingX
          slangStukje.richtingY = keerPunt.richtingY
        end
      end

      -- verander positie van elk slangstukje
      slangStukje.positieX = slangStukje.positieX + slangStukje.richtingX
      slangStukje.positieY = slangStukje.positieY + slangStukje.richtingY
    end
    teller = 0
  end

  teller = teller + love.timer.getAverageDelta()

end
