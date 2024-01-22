# Engeto_SQL_project

Vypracování průvodní listiny projektu

## Zadání

### Úvod do projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

## Datové sady, které je možné použít pro získání vhodného datového podkladu

### Primární tabulky:
czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.

czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.

czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.

czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.

czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

### Dodatečné tabulky:
countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.

economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

## Výzkumné otázky
1) Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

2) Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

3) Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

4) Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

5) Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

## Postup při tvorbě tabulek

### Primární tabulka t_ondrej_kalvas_project_SQL_primary_final
Pro zhotovení primární tabulky jsem si vytvořil dvě tabulky, které jsem potom spojil. U pomocných tabulek jsem použil omezení, která mi pomohla zredukovat data, jen na ty potřebná k odpovědím na výzkumné otázky.
V pomocných tabulkách jsem pracoval s tabulkami:  
  czechia_payroll  
  czechia_payroll_industry_branch  
  czechia_payroll_value_type  
  czechia_payroll_unit  
  czechia_price  
  czechia_price_category  

  ### Sekundární tabulka t_ondrej_kalvas_project_SQL_secondary_final
  Sekundární tabulku jsem tvořil tak, aby obsahovala potřebná data jen pro evropské státy. Zde jsem pracoval s tabulkami economies a countries.

  ## Odpovědi na výzkumné otázky

  ### 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
  Z 19 zkoumaných ovětví v letech 2006-2013 vzrostly mzdy každoročně jen u:  
  Doprava a skladování  
  Ostatní činnosti  
  Zdravotní a sociální péče  
  Zpracovatelský průmysl  
  
  U ostatních odvětví vidíme minimálně vždy jeden meziroční pokles. Nejčastěji se jedná o rok 2013 a to hned v jedenácti případech.
  Těžba a dobývání zažilo meziroční pokles hned čtyřikrát.

  ### 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
  Zde porovnáváme roky 2006 a 2018. V roce 2006 si můžeme koupit 1297 kusů chleba a 1482 litrů mléka. Pro rok 2018 je to 1356 kusů chleba a 1627 litrů mléka. Vidíme, že stoupl počet který si můžeme koupit u obou položek, 
  pokud počítáme s průměrnou mzdou za všechny zkoumané odvětví. Ale pokud se koukneme zvlášť na jednotlivá odvětví a jejich půměrné mzdy, tak můžeme pozorovat pokles napříkald u Administrativní a podpůrné činnosti. 
  V tomto odvětví roku 2006 vychází chléb na 871 kusů a roku 2018 je to pouze 857 kusů.

  ### 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
  Nejnižší procentuální rozdíl je u položky rajská jablka červená kulatá v letech 2006 a 2007. Pokud budeme brát pouze nárůst cen, tak to budou položky šunkový salám(2015/2016), kapr živý(2007/2008, 2014/2015), 
  kuřata kuchaná celá(2017/2018), rostlinný roztíratelný tuk(2006/2007, 2011/2012), hovězí maso zadní bez kosti(2015/2016).
  
  ### 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
  V zkoumaném období byl největší meziroční nárůst cen potravin oproti mzdám v roce 2013, ale nebyl větší než 10%.

  ### 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?
  Z výsledku není vidět, že by nárůst HDP měl vliv na výšku mezd nebo potravin. Například v roce 2015 naroste výrazněji HDP, ale na změnu v cenách potravin to nemá vůbec žádný vliv.
