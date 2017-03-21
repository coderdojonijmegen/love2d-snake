# Snake in Love2D

# 1. Intro

Vandaag gaan we aan de slag met het spel Snake. Begin met het downloaden van het [lesmateriaal](love2d-snake.zip) en volg daarna de instructies hieronder.

## Spelregels
Het doel van het spel Snake is om zoveel mogelijk fruit te eten (dit is je score).  Hoe meer je eet hoe langer de slang wordt en ook beweegt de slang sneller. Als de slang tegen zichzelf botst of buiten het scherm gaat is het game over.

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

# 2. Start
We beginnen door het `main.lua` bestand te openen. Je moet dit bestand in het programma Atom openen. Als je het juiste bestand hebt geopend zie je de volgende code:

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
