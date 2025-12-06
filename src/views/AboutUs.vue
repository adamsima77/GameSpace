<template>
<div class = "wrapper">
  <div class="aboutUs">
    <h1>O nás – GameSpace</h1>

    <p>
      GameSpace je moderná herná platforma a komunita, ktorá vznikla s cieľom 
      poskytnúť hráčom, tvorcom obsahu, vývojárom a fanúšikom digitálnej zábavy 
      jedno miesto, kde môžu objavovať nové hry, zapájať sa do turnajov, 
      sledovať novinky a budovať svoju hernú identitu. 
      Naším hlavným cieľom je prepojiť všetkých, ktorí milujú hry, a vytvoriť 
      prostredie, v ktorom majú priestor na rast, zábavu a spoluprácu.
    </p>

    <p>
      Za vznikom GameSpace stojí tím nadšencov, ktorí spájajú dlhoročné skúsenosti 
      v oblasti herného priemyslu, webového vývoja, grafického dizajnu a správy komunít. 
      Veríme, že hry sú viac než len voľnočasová aktivita – sú médiom, ktoré 
      dokáže spájať ľudí, vytvárať priateľstvá, podporovať kreativitu a posúvať 
      technologické hranice. Práve preto budujeme platformu, ktorá odráža tieto hodnoty.
    </p>

    <h2>Naša vízia</h2>

    <p>
      Chceme vytvoriť najväčšie a najaktívnejšie online herné centrum v regióne. 
      Platformu, ktorá bude nielen zdrojom zábavy, ale aj miestom vzdelávania, 
      súťaženia a prezentácie talentu. Veríme, že herný svet si zaslúži priestor, 
      ktorý je bezpečný, moderný, prehľadný a prispôsobený hráčom každého typu. 
      Náš cieľ je, aby sa GameSpace stal synonymom pre kvalitný herný obsah, 
      spravodajstvo, komunitu a profesionálnu organizáciu turnajov.
    </p>

    <p>
      Vízia GameSpace je dlhodobá. Nechceme byť len ďalším herným webom. 
      Budujeme komplexný ekosystém, ktorý bude schopný podporovať jednotlivcov, 
      tímy, tvorcov, organizátorov aj herné štúdiá. A to nielen technicky, 
      ale aj komunitne a vzdelávaco.
    </p>

    <h2>Naša misia</h2>

    <p>
      Naša misia je jednoduchá – vytvoriť miesto, kde sa každý hráč bude cítiť doma.  
      Chceme prinášať kvalitné články, aktuálne informácie, hodnotenia hier, 
      správy o turnajoch a udalosťach, ale tiež ponúknuť priestor pre súťaženie, 
      zlepšovanie zručností a nadväzovanie kontaktov. GameSpace je otvorený 
      všetkým bez ohľadu na vek, skúsenosti či preferovaný žáner.
    </p>

    <p>
      Sústredíme sa na moderný dizajn, intuitívne rozhranie, čistý obsah a vysokú 
      technickú kvalitu. Každý prvok platformy je vytváraný s ohľadom na používateľa, 
      aby bola jeho herná cesta čo najpríjemnejšia.
    </p>

    <h2>Náš tím</h2>

    <p>
      GameSpace nie je anonymný projekt. Je za ním skupina motivovaných ľudí, 
      ktorí denne pracujú na tom, aby platforma rástla a prinášala hodnotu. 
      Náš tím tvoria redaktori, grafici, weboví vývojári, správcovia sociálnych sietí, 
      organizátori turnajov a komunita moderátorov. Každý z nich vkladá do projektu 
      svoje skúsenosti a vášeň k hrám.
    </p>

    <p>
      Pravidelne sa rozrastáme a vždy radi privítame nových členov, ktorí chcú prispieť 
      k rozvoju hernej kultúry na Slovensku a v Česku. Snažíme sa vytvárať prostredie, 
      v ktorom môže každý člen tímu rozvíjať svoje talenty a zručnosti.
    </p>

    <h2>Naša komunita</h2>

    <p>
      Komunita je srdcom GameSpace. Bez nej by platforma nemala zmysel. 
      Snažíme sa budovať priateľské a otvorené prostredie, v ktorom môže každý 
      slobodne vyjadriť svoj názor, podeliť sa o skúsenosti, nájsť spoluhráčov 
      alebo sa zapojiť do našich projektov. Veríme, že práve komunita je tým, 
      čo robí herný svet výnimočným.
    </p>

    <h2>Do budúcnosti</h2>

    <p>
      GameSpace neustále rastieme a pripravujeme nové funkcie a projekty. 
      V blízkej budúcnosti plánujeme rozšírenie turnajovej platformy, 
      zavedenie systémov hodnotenia hráčov, podporu pre herné tímy, 
      ako aj nové multimediálne formáty, vrátane podcastov a videorecenzií.
    </p>

    <p>
      Našim dlhodobým plánom je vytvorenie najväčšej hernej databázy v regióne, 
      profesionálneho e-športového centra a nástroja pre tvorcov obsahu, 
      ktorí chcú rásť spolu s nami.
    </p>

    <h2>Ďakujeme, že ste súčasťou GameSpace</h2>

    <p>
      GameSpace nie je len projekt – je to vášeň, komunita a priestor, 
      ktorý budujeme spoločne. Každý používateľ, každý komentár, každý nápad 
      a každá spätná väzba nám pomáha rásť a zlepšovať sa. 
      Ďakujeme, že ste s nami na tejto ceste a že pomáhate vytvárať miesto, 
      kde majú hry skutočný domov.
    </p>

  </div>
  <h1>Najčastejšie otázky</h1>
  <Accordion :item = "[{title:'Nazov........',desc:'asdasdasdasdadasdasds'},{title:'ffffffffff',desc:'fasfasfsafasfs'}]"></Accordion>
  </div>
</template>

<script>
import Accordion from '../components/Accordion.vue';

    export default{


        components:{
              Accordion
        }
    }
    
</script>

<style scoped lang = "scss">
 .wrapper{
    display: flex;
    flex-direction: column;
    gap: 20px;
    
    h1{
         margin-top: 40px
    }
    .aboutUs{
        @include text_box();
    }

    .aboutUs h1,.aboutUs h2{
        @include text_box_heading();
    }
}
</style>