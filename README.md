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

## Posities, richting en keerpunten
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

De positieX kan elke positie zijn op de x-as. Dat is dus van de linkerkant naar rechterkant van het scherm. De positieX 0 is helemaal aan de rechterkant. De rechterkant van het scherm is 800 (de breedte van het scherm). De positieY is de positie van boven naar beneden. Hier is 0 de bovenkant van het scherm en 600 de onderkant van het scherm.

De richtingX en de richtingY kan 0, -1 of 1 zijn. Als de richtingX -1 is, gaat de slang naar links. Als de richtingX 1 is gaat de slang naar rechts. En als de richtingX 0 is, gaat de slang niet naar rechts of naar links. De richtingY is precies hetzelfde maar dan voor de richting boven en beneden.

Nu staan alle waarden op 0. Maar dit is tijdelijk. We gaan nu kijken welke pijltjestoets is ingedrukt om de richting te veranderen.

Voeg de volgende code toe onder de code waar we het `nieuwKeerPunt` hebben toegvoegd en boven de `end` van de `if` die we hiervoor hebben toegevoegd.

```
    if key == "left" then
      nieuwKeerPunt.richtingX = -1
      nieuwKeerPunt.richtingY = 0
    elseif key == "right" then
      nieuwKeerPunt.richtingX = 1
      nieuwKeerPunt.richtingY = 0
    elseif key == "up" then
      nieuwKeerPunt.richtingY = -1
      nieuwKeerPunt.richtingX = 0
    elseif key == "down" then
      nieuwKeerPunt.richtingY = 1
      nieuwKeerPunt.richtingX = 0
    end
```

Deze code verandert nu de richting van het `nieuwKeerPunt`.

Nu moeten we nog de positie van het `nieuwKeerPunt` aanpassen. Hiervoor gebruiken we de positie van de kop van de slang. Hiervoor hebben we de volgende twee regels code nodig. Voeg deze toe onder de code die je net hebt toegevoegd. Dus tussen de `end` die hoort bij de laatste `elseif` en de eerstvolgende `end`.

```
    nieuwKeerPunt.positieX = slang[#slang].positieX
    nieuwKeerPunt.positieY = slang[#slang].positieY

    if not extra.bestaatKeerPunt(keerPunten, nieuwKeerPunt) then
      table.insert(keerPunten, nieuwKeerPunt)
    end
```

Deze code verandert de positie van `nieuwKeerPunt` naar de positie van het laatste stukje van de slang. Daarna wordt er gecontroleerd of het nieuwKeerPunt al bestaat in het keerPunten object en hieraan toegevoegd als dat niet zo is. Nu bestaat het woord `slang` nog niet in de code, dus dat zal foutmeldingen opleveren.

Hiervoor moeten we terug naar de `love.load()` functie. We kunnen dit woord (slang) niet in de `love.keypressed(key)` functie zetten omdat deze functie elke keer als er op een toets gedrukt wordt, wordt uitgevoerd. Dit zou betekenen dat het woord slang op elke toets vernieuwd wordt. Maar dat willen we niet. We willen hier alle stukjes van de slang gaan bijhouden. Dus, scroll naar boven, naar de `love.load()` functie.

Voeg de volgende regel toe aan de `love.load()` functie - op een nieuwe regel onder `love.load()`.

`slang = {}`

Deze regel maakt een leeg object met de naam slang.

In de `love.keypressed(key)` functie hebben we het nieuwKeerPunt de positie van het laatste stukje van de slang gegeven. Alleen de positie van de slang bestaat nog niet. Om deze toe te voegen. Moeten we een aantal stukjes toevoegen aan het slang object. Sla een regel over en voeg de volgende regels toe onder de vorige code.

```
  for i = 1, 2 do
    slangStukje = {
      positieX = 5+1*i,
      positieY = 5,
      richtingX = 1,
      richtingY = 0
    }
    table.insert(slang, slangStukje)
  end
```

Deze code voegt stukjes van de slang toe aan het slang object. Bovenaan zie je `for i = 1, 2 do` staan. Net als bij de `if` wordt ook `for` een `end`. Als je code tussen `for` en `end` zet, wordt deze code 2 keer uitgevoerd. Dus in dit geval worden er 2 stukjes van de slang toegevoegd aan het slang object. De laatste functie `table.insert(slang, slangStukje)` voegt het stukje toe aan het slang object.

Eerder maakten we een nieuwKeerPunt aan (in de `love.keypressed(key)` functie). Ook nieuwKeerPunt wordt toegevoegd aan een object. Het verschil tussen het slang object is, dat het nieuwKeerPunt wordt toegevoegd elke keer als je een pijltjestoets indrukt. Maar ook hier missen we het object waaraan het toegevoegd moet worden, het `keerPunten` object.

Daarom voegen we de volgende regel toe onder wat we zonet hebben toegevoegd:

`keerPunten = {}`

## Tekenen op de positie van een slangstukje
Nu houden we de positie bij van twee slangstukjes, maar we gebruiken deze posities nog niet om hier een plaatje te tekenen.

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
