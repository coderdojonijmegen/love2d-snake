# Snake in Love2D

# 1. Introductie

Vandaag gaan we aan de slag met het spel Snake. Begin met het downloaden van het [materiaal](love2d-snake.zip) en pak daarna de bestanden uit. Open daarna het programma Atom en sleep het mapje met de uitgepakte bestanden op Atom. Als het goed is zie je nu aan de linkerkant een lijstje met alle bestanden. Met deze bestanden gaan we straks aan de slag. Maar laten we eerst kijken naar de spelregels.

## Spelregels
Het doel van het spel Snake is om zoveel mogelijk fruit te eten (dit is je score).  Hoe meer je eet, hoe langer de slang wordt en ook beweegt de slang sneller. Als de slang tegen zichzelf botst of buiten het scherm gaat is het game over.

Dus om Snake te bouwen moet het spel het volgende doen:
- Beeweeg de slang met de pijltjestoetsen;
- Plaats op een willekeurige plek fruit;
- De slang moet het fruit kunnen eten;
  - Als er fruit gegeten is moet de slang sneller bewegen;
  - Als er fruit gegeten is moet de slang langer worden;
  - Als er fruit gegeten is krijg je een punt;
- Als de slang tegen zichzelf botst is het game over;
- Ook als de slang buiten het scherm gaat is het game over;

Nu we de spelregels duidelijk hebben en weten wat het spel moet gaan doen, is het tijd om Snake te gaan bouwen!

# 2. Aan de slag!
We beginnen door het `main.lua` bestand te openen. Klik hierop in de lijst die je aan de linkerkant ziet. Als je het juiste bestand hebt geopend zie je de volgende code:

```
extra = require "extrafuncties"

function love.load()

end

function love.draw()

end

function love.update(dt)

end

function love.keypressed(key)

end
```

De zogenaamde `function`s (in het Nederlands functie(-s)) die je hier ziet worden uitgevoerd zodra zij nodig zijn. Zo is er een functie die `love.load()` heet, waarbinnen we de code zetten om bijvoorbeeld onze plaatjes te laden.

# 3. Slangenkop

Dus als we bijvoorbeeld de kop van de slang willen laden, typen we de volgende regel tussen `function love.load()` en de eerstvolgende `end`.

`slangKopPlaatje = love.graphics.newImage("plaatjes/slangkop.png")`

Als je het goed getypd hebt, ziet je code er zo uit:

```
extra = require "extrafuncties"

function love.load()
  slangKopPlaatje = love.graphics.newImage("plaatjes/slangkop.png")
end

function love.draw()

end

function love.update(dt)

end

function love.keypressed(key)

end
```

Als je goed kijkt zie je in het voorbeeld hierboven dat de regel iets verder staat dan alle andere tekst. Dit noemen we _inspringen_. Als programmeur gebruik je dit om je code beter leesbaar te maken. Je kunt dit zelf doen door je tekstcursor aan het begin van de regel te plaatsen en dan op de toets `Tab` te drukken.

Als we nu opslaan (Ctrl + S) en op de speelknop drukken (de knop met het driehoekje), krijgen we als het goed is een zwart scherm. Krijg je een blauw scherm? Dan heb je een foutje in je code zitten.

We hebben nu de slangenkop geladen, maar we zien hem nog niet. Hiervoor moeten we naar de `love.draw()` functie.

Onder de regel `function love.draw()` typen we de volgende regel:

`love.graphics.draw(slangKopPlaatje, 350, 250)`

Als we nu weer opslaan (Ctrl + S) en op de speelknop drukken zie je (als je de code goed hebt overgetypd) de kop van de slang!

# 4. De rest van de slang
De slang moet steeds langer worden, dus laten we daarom een stukje aan de slang toevoegen. Ook hier hebben we een plaatje voor nodig. Voeg de volgende regel toe aan de `love.load()` functie, onder de regel voor het slangKopPlaatje.

`slangLichaamPlaatje = love.graphics.newImage("plaatjes/slanglichaam.png")`

Ook hier moeten het plaatje na het laden tekenen op het scherm. Dit doen we door de volgende regel toe te voegen aan de `love.draw()` functie, onder de regel voor het tekenen van het slangKopPlaatje.

`love.graphics.draw(slangLichaamPlaatje, 300, 250)`

Als je nu het bestand opslaat en op de speelknop drukt zie je als het goed is nu twee plaatjes van de slang.

# 5. Bewegen
Om de slang te kunnen bewegen is het goed om te weten wanneer de slang moet bewegen. Bijvoorbeeld wanneer de pijltjestoetsen worden ingedrukt. De code voor de bediening zetten we in de `love.keypressed(key)` functie. Deze functie wordt uitgevoerd zodra je een knop indrukt. Laten we beginnen met te controleren of er een pijltjestoets is ingedrukt. Voeg de volgende twee regels toe aan de `love.keypressed(key)` functie.

```
if key == "left" or key == "right" or key == "up" or key == "down" then
end
```

De eerste regel zegt eigenlijk het volgende `Als toets links is, of toets rechts is, of toets boven is, of toets beneden is, dan...`. Zie je de vergelijkenis?

Net als bij functies, wordt op de tweede regel ook het woord `end` gebruikt. Dit wordt gebruikt om aan te geven dat alleen binnen `if ...` en `end` iets zal worden uitgevoerd. Hiertussen gaan we de volgende code zetten, altijd op een nieuwe regel.

## Keerpunten
Nu we weten wanneer een pijltjestoets is ingedrukt, willen we de slang een andere richting op laten gaan. Dit doen we door een aantal waarden bij te houden. We houden de positie en de richting bij.
Dit doen we in een object. Dit object geven we dan de naam nieuwKeerPunt.

Voeg de volgende regels toe onder de `if` en boven de eerstvolgende `end`.

```
nieuwKeerPunt = {
  positieX = 0,
  positieY = 0,
  richtingX = 0,
  richtingY = 0
}
```

In nieuwKeerPunt houden we nu vier waarden bij - de `positieX`, `positieY`, `richtingX` en `richtingY`.

<!--
- Beeweeg de slang met de pijltjestoetsen;
- Plaats op een willekeurige plek fruit;
- De slang moet het fruit kunnen eten;
  - Als er fruit gegeten is moet de slang sneller bewegen;
  - Als er fruit gegeten is moet de slang langer worden;
  - Als er fruit gegeten is krijg je een punt;
- Als de slang tegen zichzelf botst is het game over;
- Ook als de slang buiten het scherm gaat is het game over;
-->
