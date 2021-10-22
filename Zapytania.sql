-- ilo�� wydanych bilet�w normalnych i ulgowych, ich ceny oraz zarobek ze sprzedamych bilet�w
SELECT bilety.rodzaj_biletu,avg(bilety.cena) AS [cena_za_jeden_bilet],COUNT(bilety.ID_biletu)
AS [ilo��_wydanych_bilet�w],SUM(bilety.cena) AS [zarobek_z_bilet�w]
FROM bilety
INNER JOIN wystawy
ON wystawy.ID_wystawy = bilety.ID_wystawy
WHERE wystawy.ID_wystawy = '2'
GROUP BY rodzaj_biletu

--z kt�rego kraju pochodzi najwi�cej obraz�w
SELECT pochodzenie AS [Kraj(e)_z_kt�rych_pochodzi_najwi�cej_dzie�]
FROM dzie�a 
GROUP BY pochodzenie
HAVING COUNT(*) = (
	SELECT TOP 1 COUNT(ID_dzie�a) AS [ilo��_dzie�]
	FROM dzie�a
	GROUP BY pochodzenie
	ORDER BY 1 DESC);

--pracownicy kt�rzy zostali niedawno zatrudnieni
SELECT DISTINCT imie,nazwisko
FROM pracownicy
WHERE data_przyj�cia_do_pracy in (
	SELECT data_przyj�cia_do_pracy
	FROM pracownicy
	WHERE data_przyj�cia_do_pracy > '2017-12-31'
	);

--�redni koszt konserwacji w zale�no�ci od typu dzie�a
SELECT konserwatorzy.typ_dzie�,ROUND(AVG(konserwacje.koszt_konserwacji),2) AS [sredni_koszt_konserwacji]
FROM konserwatorzy
INNER JOIN konserwacje
ON konserwacje.ID_konserwatora = konserwatorzy.ID_konserwatora
GROUP BY konserwatorzy.typ_dzie�

--2 najbardziej do�wiadczonych konserwator�w obraz�w
SELECT TOP 2 pracownicy.imie,pracownicy.nazwisko,konserwatorzy.ilo��_konserwacji
FROM pracownicy
INNER JOIN konserwatorzy
ON pracownicy.ID_konserwatora = konserwatorzy.ID_konserwatora
WHERE typ_dzie�='Obraz'
ORDER BY ilo��_konserwacji DESC

-- ilo�� dzie� znajduj�cych si� w poszczeg�lnych galeriach
SELECT galerie.nazwa_galerii,COUNT(dzie�a.ID_dzie�a) AS [ilo�� dzie� w galerii]
FROM galerie
INNER JOIN dzie�a
ON galerie.ID_galerii = dzie�a.ID_galerii
GROUP BY galerie.nazwa_galerii
ORDER BY [ilo�� dzie� w galerii] DESC;

-- przych�d z bilet�w w zale�no�ci od wystawy
SELECT wystawy.ID_wystawy,wystawy.motyw_przewodni, SUM(bilety.cena) AS [przych�d z bilet�w]
FROM bilety
INNER JOIN wystawy
ON bilety.ID_wystawy = wystawy.ID_wystawy
GROUP BY wystawy.ID_wystawy,motyw_przewodni

-- dzie�a kt�re zosta�y sprzedane conajmniej 20000 dro�ej od ceny wywo�awczej
CREATE VIEW [roznica_cen]
AS 
	SELECT dzie�a.tytu�,transakcje.cena_sprzeda�y,transakcje.cena_wywo�awcza,  (transakcje.cena_sprzeda�y-transakcje.cena_wywo�awcza) AS [r�nica_cen]
	FROM dzie�a
		INNER JOIN transakcje
	ON dzie�a.ID_transakcji = transakcje.ID_transakcji 
	WHERE transakcje.cena_sprzeda�y-transakcje.cena_wywo�awcza  > 20000

DROP VIEW roznica_cen

--8 zapyta�
--1 view done (1)
--2 join done (6)
--2 podzapytania done (2)
--2(sum, count) done (8)
--2 group by done (5)
--1 order by done (3)