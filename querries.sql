-- ilość wydanych biletów normalnych i ulgowych, ich ceny oraz zarobek ze sprzedamych biletów
SELECT bilety.rodzaj_biletu,avg(bilety.cena) AS [cena_za_jeden_bilet],COUNT(bilety.ID_biletu)
AS [ilość_wydanych_biletów],SUM(bilety.cena) AS [zarobek_z_biletów]
FROM bilety
INNER JOIN wystawy
ON wystawy.ID_wystawy = bilety.ID_wystawy
WHERE wystawy.ID_wystawy = '2'
GROUP BY rodzaj_biletu

--z którego kraju pochodzi najwięcej obrazów
SELECT pochodzenie AS [Kraj(e)_z_których_pochodzi_najwięcej_dzieł]
FROM dzieła 
GROUP BY pochodzenie
HAVING COUNT(*) = (
	SELECT TOP 1 COUNT(ID_dzieła) AS [ilość_dzieł]
	FROM dzieła
	GROUP BY pochodzenie
	ORDER BY 1 DESC);

--pracownicy którzy zostali niedawno zatrudnieni
SELECT DISTINCT imie,nazwisko
FROM pracownicy
WHERE data_przyjęcia_do_pracy in (
	SELECT data_przyjęcia_do_pracy
	FROM pracownicy
	WHERE data_przyjęcia_do_pracy > '2017-12-31'
	);

--średni koszt konserwacji w zależności od typu dzieła
SELECT konserwatorzy.typ_dzieł,ROUND(AVG(konserwacje.koszt_konserwacji),2) AS [sredni_koszt_konserwacji_obrazow]
FROM konserwatorzy
INNER JOIN konserwacje
ON konserwacje.ID_konserwatora = konserwatorzy.ID_konserwatora
GROUP BY konserwatorzy.typ_dzieł

--2 najbardziej doświadczonych konserwatorów obrazów
SELECT TOP 2 pracownicy.imie,pracownicy.nazwisko,konserwatorzy.ilość_konserwacji
FROM pracownicy
INNER JOIN konserwatorzy
ON pracownicy.ID_konserwatora = konserwatorzy.ID_konserwatora
WHERE typ_dzieł='Obraz'
ORDER BY ilość_konserwacji DESC

-- ilość dzieł znajdujących się w poszczególnych galeriach
SELECT galerie.nazwa_galerii,COUNT(dzieła.ID_dzieła) AS [ilość dzieł w galerii]
FROM galerie
INNER JOIN dzieła
ON galerie.ID_galerii = dzieła.ID_galerii
GROUP BY galerie.nazwa_galerii
ORDER BY [ilość dzieł w galerii] DESC;

-- przychód z biletów w zależności od wystawy
SELECT wystawy.ID_wystawy,wystawy.motyw_przewodni, SUM(bilety.cena) AS [przychód z biletów]
FROM bilety
INNER JOIN wystawy
ON bilety.ID_wystawy = wystawy.ID_wystawy
GROUP BY wystawy.ID_wystawy,motyw_przewodni

-- dzieła które zostały sprzedane conajmniej 20000 drożej od ceny wywoławczej
CREATE VIEW [roznica_cen]
AS 
	SELECT dzieła.tytuł,transakcje.cena_sprzedaży,transakcje.cena_wywoławcza,(transakcje.cena_sprzedaży-transakcje.cena_wywoławcza) AS [różnica_cen]
	FROM dzieła
		INNER JOIN transakcje
	ON dzieła.ID_transakcji = transakcje.ID_transakcji 
	WHERE transakcje.cena_sprzedaży-transakcje.cena_wywoławcza  > 20000

DROP VIEW roznica_cen
--1 view done
--2 join done
--2 podzapytania done
--2(sum, count) done
--2 group by done
--1 oreder by done
--
--
