---
title: "Löve2D - Snake"
headercolor: "teal-background"
date: 2020-02-06T21:15:23+01:00
toc: true
draft: false
onderwerp: Löve2D
---

We gaan met 2D game framework Löve2D het klassieke spel [Snake](https://nl.wikipedia.org/wiki/Snake_(computerspel)) bouwen.

<!--more-->

## 0. Voorbereiding

1. Download en installeer LÖVE: https://love2d.org; voor meer informatie, zie [/instructies/love2d-shooter/#installatie-löve](/instructies/love2d-shooter/#installatie-löve).
2. Download en installeer Visual Studio Code: https://code.visualstudio.com/download


## 1. Introductie

Vandaag gaan we aan de slag met het spel Snake. Begin met het downloaden van het [materiaal](love2d-snake.zip) en pak daarna de bestanden uit. Open daarna Visual Studio Code en sleep het mapje met de uitgepakte bestanden in het scherm van Visual Studio Code. Als het goed is zie je nu aan de linkerkant een lijstje met alle bestanden. Met deze bestanden gaan we straks aan de slag. Maar laten we eerst kijken naar de spelregels.

### Spelregels
Het doel van het spel Snake is om zoveel mogelijk fruit te eten (dit is je score).  Hoe meer je eet, hoe langer de slang wordt en ook beweegt de slang sneller. Als de slang tegen zichzelf botst of buiten het scherm gaat is het game over.

Dus om Snake te bouwen moet het spel het volgende doen:
- Beweeg de slang met de pijltjestoetsen;
- Plaats op een willekeurige plek fruit;
- De slang moet het fruit kunnen eten;
  - Als er fruit gegeten is moet de slang sneller bewegen;
  - Als er fruit gegeten is moet de slang langer worden;
  - Als er fruit gegeten is krijg je een punt;
- Als de slang tegen zichzelf botst, is het game over;
- Ook als de slang buiten het scherm gaat is het game over;

Nu we de spelregels duidelijk hebben en weten wat het spel moet gaan doen, is het tijd om Snake te gaan bouwen!

## 2. Aan de slag!
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

## 3. Slangenkop

![Slangenkop](plaatjes/slangkop.png)

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

Als je goed kijkt, zie je in het voorbeeld hierboven dat de regel iets verder staat dan alle andere tekst. Dit noemen we _inspringen_. Als programmeur gebruik je dit om je code beter leesbaar te maken. Je kunt dit zelf doen door je tekstcursor aan het begin van de regel te plaatsen en dan op de toets `Tab` te drukken.

Sla het programma nu op (Ctrl/Cmd + S).
Als je op Windows werkt doe je nu het volgende:
* open een opdrachtprompt door "cmd" in te typen in het startmenu.
* voer het volgende commando uit: "c:\Program Files\LOVE\love.exe" "c:\<de_map_waar_jouw_programma_staat>\love\snake"

Als je op een Mac werkt:
* Start LÖVE
* sleep de map met je Lua-programma op het LÖVE-scherm.

Deze stap doe je vanaf nu elke keer als je iets hebt veranderd aan je programma en je wilt kijken wat er is veranderd.

Als je een blauw scherm met een "Error" krijgt dan klopt er iets niet aan je code, controleer die nog een keer.

We hebben nu de slangenkop geladen, maar we zien hem nog niet. Hiervoor moeten we naar de `love.draw()` functie.

Onder de regel `function love.draw()` typen we de volgende regel:

`love.graphics.draw(slangKopPlaatje, 100, 50)`

Als we nu weer opslaan (Ctrl + S) en opnieuw laden zie je (als je de code goed hebt overgetypd) de kop van de slang!

## 4. De rest van de slang

![Slangen lichaam](plaatjes/slanglichaam.png)

De slang moet steeds langer worden, dus laten we daarom een stukje aan de slang toevoegen. Ook hier hebben we een plaatje voor nodig. Voeg de volgende regel toe aan de `love.load()` functie, onder de regel voor het slangKopPlaatje.

`slangLichaamPlaatje = love.graphics.newImage("plaatjes/slanglichaam.png")`

Ook hier moeten het plaatje na het laden tekenen op het scherm. Dit doen we door de volgende regel toe te voegen aan de `love.draw()` functie, onder de regel voor het tekenen van het slangKopPlaatje.

`love.graphics.draw(slangLichaamPlaatje, 50, 50)`

Als je nu het bestand opslaat en opnieuw laden zie je als het goed is nu twee plaatjes van de slang.

### Achtergrond

![Achtergrond](plaatjes/achtergrond.png)

Laten we het spel ook een achtergrondje geven. Dit gaat precies op dezelfde manier als het toevoegen van het slangKopPlaatje.

In de `love.load()` functie voeg je de volgende regel toe, boven het `slangKopPlaatje`:

`achtergrondPlaatje = love.graphics.newImage("plaatjes/achtergrond.png")`

Daarna voeg je deze regel toe aan de `love.draw()` functie, ook boven het `slangKopPlaatje`:

`love.graphics.draw(achtergrondPlaatje)`

## 5. Bediening en beweging
Om de slang te kunnen bewegen is het goed om te weten wanneer de slang moet bewegen. Bijvoorbeeld wanneer de pijltjestoetsen worden ingedrukt. De code voor de bediening zetten we in de `love.keypressed(key)` functie. Deze functie wordt uitgevoerd zodra je een knop indrukt. Laten we beginnen met te controleren of er een pijltjestoets is ingedrukt. Voeg de volgende twee regels toe aan de `love.keypressed(key)` functie.

```
if key == "left" or key == "right" or key == "up" or key == "down" then
end
```

De eerste regel zegt eigenlijk het volgende `Als toets links is, of toets rechts is, of toets boven is, of toets beneden is, dan...`. Zie je de vergelijkenis?

Net als bij functies, wordt op de tweede regel ook het woord `end` gebruikt. Dit wordt gebruikt om aan te geven dat alleen binnen `if ...` en `end` iets zal worden uitgevoerd. Hiertussen gaan we de volgende code zetten, altijd op een nieuwe regel.

### Posities, richting en keerpunten
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
  kop = slang[#slang]
```

Deze code voegt stukjes van de slang toe aan het slang object. Bovenaan zie je `for i = 1, 2 do` staan. Net als bij de `if` wordt ook `for` een `end`. Als je code tussen `for` en `end` zet, wordt deze code 2 keer uitgevoerd. Dus in dit geval worden er 2 stukjes van de slang toegevoegd aan het slang object. De laatste functie `table.insert(slang, slangStukje)` voegt het stukje toe aan het slang object. En de laatste regel geeft aan waar de kop van de slang zit (het laatste stukje).

Eerder maakten we een nieuwKeerPunt aan (in de `love.keypressed(key)` functie). Ook nieuwKeerPunt wordt toegevoegd aan een object. Het verschil tussen het slang object is, dat het nieuwKeerPunt wordt toegevoegd elke keer als je een pijltjestoets indrukt. Maar ook hier missen we het object waaraan het toegevoegd moet worden, het `keerPunten` object.

Daarom voegen we de volgende regel toe onder wat we zonet hebben toegevoegd:

`keerPunten = {}`

### Tekenen op de positie van een slangstukje
Nu houden we de positie bij van twee slangstukjes, maar we gebruiken deze posities nog niet om hier een plaatje te tekenen. Voor het tekenen van plaatjes moeten we weer terug naar beneden scrollen, naar de `love.draw()` functie.

Om de positie te gebruiken om een stukje te tekenen moeten we de twee regels die we in de `love.draw()` functie hebben gezet vervangen door de volgende code (zorg er voor dat deze code onder `love.draw()` en boven `end` staat):

```
  for k, slangStukje in pairs(slang) do
    if k == #slang then
      love.graphics.draw(slangKopPlaatje, slangStukje.positieX*slangKopPlaatje:getWidth(), slangStukje.positieY*slangKopPlaatje:getHeight())
    else
      love.graphics.draw(slangLichaamPlaatje, slangStukje.positieX*slangLichaamPlaatje:getWidth(), slangStukje.positieY*slangLichaamPlaatje:getHeight())
    end
  end
```

Als je de code juist hebt toegevoegd, het bestand hebt opgeslagen (Ctrl + S) en opnieuw hebt geladen, zou je nu de slang ongeveer in het midden van het scherm moeten zien.

### Bewegen
Nu is het tijd om de slang daadwerkelijk te laten bewegen. Hiervoor moeten we naar de functie `love.update(dt)`. Deze functie zorgt er voor alles wordt berekend. Dus ook de beweging moet berekend worden. Voeg de volgende regels toe aan de `love.update(dt)` functie:

```
  if not gameOver and tellerSlang > tijdSlang then
    beweegSlang()
    extra.controleerKeerPunten(keerPunten, slang)
    tellerSlang = 0
  end
  tellerSlang = tellerSlang + dt
```

Aan de `love.load()` moet je de volgende regels toevoegen. Doe dit onderaan in de `love.load()` functie, boven de `end`.

```
  tijdSlang = 1
  tellerSlang = 0
  gameOver = false
```

In de love.update(dt) functie mist alleen nog de beschrijving van de functie beweegSlang(). Deze moeten we zelf schrijven. Dit doen we helemaal onderaan. Op een nieuwe regel voeg je de volgende regels toe:

```
function beweegSlang()
  for k, slangStukje in pairs(slang) do
    for k, keerPunt in pairs(keerPunten) do
      if slangStukje.positieX == keerPunt.positieX and slangStukje.positieY == keerPunt.positieY then
        slangStukje.richtingX = keerPunt.richtingX
        slangStukje.richtingY = keerPunt.richtingY
      end
    end

    slangStukje.positieX = slangStukje.positieX + slangStukje.richtingX
    slangStukje.positieY = slangStukje.positieY + slangStukje.richtingY
  end
end
```

Als je deze code opslaat en het programma opnieuw laadt zal de slang nu langzaam over het scherm bewegen!

## 6. Fruit

### Fruit plaatsen

![Appel](plaatjes/appel.png)

Nu de slang kan bewegen, kunnen we hem fruit laten eten. Laten we hiervoor teruggaan naar de `love.load()` functie en een fruit object aanmaken. Dit doen we door de volgende regels toe te voegen, waar je wilt, in de `love.load()` functie:

```
fruit = {}
tellerFruit = 0
tijdFruit = 3
appelPlaatje = love.graphics.newImage("plaatjes/appel.png")
```

Nu we alle waarden en het plaatje hebben geladen moeten we ergens het `fruit` object vullen met fruit. Dit doen we in de `love.update(dt)` functie.

```
  if not gameOver and tellerFruit > tijdFruit then
    plaatsFruit()
    tellerFruit = 0
  end
  tellerFruit = tellerFruit + dt
```

Nu hoeven we alleen nog de missende, `plaatsFruit()` functie maken. Net als bij de `beweegSlang()` functie, plaatsen we de `plaatsFruit()` functie helemaal onderaan. Voeg deze code toe:

```
function plaatsFruit()
  nieuwFruit = {
    positieX = math.random(0, math.floor(love.graphics.getWidth()/appelPlaatje:getWidth())),
    positieY = math.random(0, math.floor(love.graphics.getHeight()/appelPlaatje:getHeight()))
  }
  table.insert(fruit, nieuwFruit)
end
```

Deze functie voegt op een willekeurige plaats een stuk fruit toe. We zien alleen het fruit nog niet op het scherm verschijnen. Hiervoor moeten we terug naar de `love.draw()` functie. De volgorde van je code in de `love.draw()` functie bepaald wat er eerst getekend moet worden. Dus als we de appels onder de slang willen tekenen, moeten we de volgende code, boven de code van de slang plaatsen (binnen de `love.draw()` functie):

```
  for k, stukFruit in pairs(fruit) do
    love.graphics.draw(appelPlaatje, stukFruit.positieX*appelPlaatje:getWidth(), stukFruit.positieY*appelPlaatje:getHeight())
  end
```

Als nu opslaan en het programma opnieuw laden, zien we nu appels verschijnen op het scherm. Omdat `tijdFruit` 3 is, wordt er elke 3 seconden een appel toegevoegd.

### Fruit eten
Als we nu met de slang over een stukje fruit bewegen, gebeurd er niets. Maar we willen dus het fruit opeten. Hiervoor moeten we weer zelf een functie schrijven, de functie `eetFruit()`. Voeg deze code toe, helemaal onderaan:

```
function eetFruit()
  for k, stukFruit in pairs(fruit) do
    if stukFruit.positieX == kop.positieX and stukFruit.positieY == kop.positieY then
      table.remove(fruit, k)
      score = score + 1
      tijdSlang = tijdSlang * 0.9
      maakSlangLanger()
    end
  end
end
```

Voeg daarna de volgende regel toe, na `extra.controleerKeerPunten(keerPunten, slang)`, in de `love.update(dt)` functie:

`eetFruit()`

Als de `eetFruit()` functie wordt uitgevoerd, gebeuren er een aantal dingen:
- Het fruit wordt verwijderd - `table.remove(fruit, k)`
- Je krijgt een score - `score = score + 1`
- De slang gaat sneller bewegen - `tijdSlang = tijdSlang * 0.9`
- En de slang wordt langer - `maakSlangLanger()`

De laatste functie ontbreekt nog, de `maakSlangLanger()` functie. Voeg deze toe, ook helemaal onderaan:

```
function maakSlangLanger()
  staartStukje = slang[1]
  nieuwSlangStukje = {
    positieX = staartStukje.positieX-staartStukje.richtingX,
    positieY = staartStukje.positieY-staartStukje.richtingY,
    richtingX = staartStukje.richtingX,
    richtingY = staartStukje.richtingY
  }
  table.insert(slang, 1, nieuwSlangStukje)
end
```

Deze code voegt een stukje van de slang toe, waar de staart is. Dit stukje wordt dan toegevoegd aan het `slang` object, waar zich ook alle andere stukjes bevinden.

## 7. Score
Als we nu onze code zouden uitvoeren, zouden we een foutmelding krijgen omdat het score object nog niet bestaat. Deze moeten we nog toevoegen aan de `love.load()` functie. Dus voeg de volgende regel toe aan je `love.load()` functie, op een nieuwe regel:

`score = 0`

En om de score op het scherm te tonen, voegen we de volgende regel toe aan de `love.draw()` functie:

`love.graphics.print(score .. " punten")`

Als we nu de code opslaan en opnieuw laden, zal de slang steeds langer worden en sneller gaan zodra je meer appels eet.

## 8. Game Over
Het spel mist nu alleen nog twee spelregels. Je moet game over gaan als de slang tegen zichzelf botst of buiten het scherm gaat.

Om dit te controleren maken we nog &eacute;&eacute;n functie. Voeg deze code toe, helemaal onderaan:

```
function controleerGameOver()
  if kop.positieX < 0 or kop.positieX > math.floor(love.graphics.getWidth()/slangKopPlaatje:getWidth()) or
    kop.positieY < 0 or kop.positieY > math.floor(love.graphics.getHeight()/slangKopPlaatje:getHeight()) then
    gameOver = true
  end

  for k, slangStukje in pairs(slang) do
    if slangStukje ~= kop and kop.positieX == slangStukje.positieX and kop.positieY == slangStukje.positieY then
      gameOver = true
    end
  end
end
```

Voeg daarna de volgende regel toe na `eetFruit()` in de `love.update(dt)` functie:

`controleerGameOver()`

En tot slot voegen we de volgende regels toe aan het einde van de `love.draw()` functie om een bericht te tonen dat je game over bent:

```
  if gameOver then
    love.graphics.print("Game Over!", love.graphics.getWidth()/2, love.graphics.getHeight()/2)
  end
```

## Goed gedaan!
En dat is het, je hebt het spel Snake gebouwd! Hoe lang hou jij het vol en wat is de hoogste score die je kunt krijgen?

Heb je iets niet goed begrepen, vraag het dan aan &eacute;&eacute;n van de mentoren, we helpen je natuurlijk graag!

Je kunt ook altijd een kijkje nemen bij de andere kinderen, misschien kan jij hun helpen!

{{< licentie rel="http://creativecommons.org/licenses/by-nc-sa/4.0/">}}
