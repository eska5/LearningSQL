-- iloœæ wydanych biletów normalnych i ulgowych, ich ceny oraz zarobek ze sprzedamych biletów
SELECT bilety.rodzaj_biletu,avg(bilety.cena) AS [cena_za_jeden_bilet],COUNT(bilety.ID_biletu)
AS [iloœæ_wydanych_biletów],SUM(bilety.cena) AS [zarobek_z_biletów]
FROM bilety
INNER JOIN wystawy
ON wystawy.ID_wystawy = bilety.ID_wystawy
WHERE wystawy.ID_wystawy = '2'
GROUP BY rodzaj_biletu

--z którego kraju pochodzi najwiêcej obrazów
SELECT pochodzenie AS [Kraj(e)_z_których_pochodzi_najwiêcej_dzie³]
FROM dzie³a 
GROUP BY pochodzenie
HAVING COUNT(*) = (
	SELECT TOP 1 COUNT(ID_dzie³a) AS [iloœæ_dzie³]
	FROM dzie³a
	GROUP BY pochodzenie
	ORDER BY 1 DESC);

--pracownicy którzy zostali niedawno zatrudnieni
SELECT DISTINCT imie,nazwisko
FROM pracownicy
WHERE data_przyjêcia_do_pracy in (
	SELECT data_przyjêcia_do_pracy
	FROM pracownicy
	WHERE data_przyjêcia_do_pracy > '2017-12-31'
	);

--œredni koszt konserwacji w zale¿noœci od typu dzie³a
SELECT konserwatorzy.typ_dzie³,ROUND(AVG(konserwacje.koszt_konserwacji),2) AS [sredni_koszt_konserwacji]
FROM konserwatorzy
INNER JOIN konserwacje
ON konserwacje.ID_konserwatora = konserwatorzy.ID_konserwatora
GROUP BY konserwatorzy.typ_dzie³

--2 najbardziej doœwiadczonych konserwatorów obrazów
SELECT TOP 2 pracownicy.imie,pracownicy.nazwisko,konserwatorzy.iloœæ_konserwacji
FROM pracownicy
INNER JOIN konserwatorzy
ON pracownicy.ID_konserwatora = konserwatorzy.ID_konserwatora
WHERE typ_dzie³='Obraz'
ORDER BY iloœæ_konserwacji DESC

-- iloœæ dzie³ znajduj¹cych siê w poszczególnych galeriach
SELECT galerie.nazwa_galerii,COUNT(dzie³a.ID_dzie³a) AS [iloœæ dzie³ w galerii]
FROM galerie
INNER JOIN dzie³a
ON galerie.ID_galerii = dzie³a.ID_galerii
GROUP BY galerie.nazwa_galerii
ORDER BY [iloœæ dzie³ w galerii] DESC;

-- przychód z biletów w zale¿noœci od wystawy
SELECT wystawy.ID_wystawy,wystawy.motyw_przewodni, SUM(bilety.cena) AS [przychód z biletów]
FROM bilety
INNER JOIN wystawy
ON bilety.ID_wystawy = wystawy.ID_wystawy
GROUP BY wystawy.ID_wystawy,motyw_przewodni

-- dzie³a które zosta³y sprzedane conajmniej 20000 dro¿ej od ceny wywo³awczej
CREATE VIEW [roznica_cen]
AS 
	SELECT dzie³a.tytu³,transakcje.cena_sprzeda¿y,transakcje.cena_wywo³awcza,  (transakcje.cena_sprzeda¿y-transakcje.cena_wywo³awcza) AS [ró¿nica_cen]
	FROM dzie³a
		INNER JOIN transakcje
	ON dzie³a.ID_transakcji = transakcje.ID_transakcji 
	WHERE transakcje.cena_sprzeda¿y-transakcje.cena_wywo³awcza  > 20000

DROP VIEW roznica_cen

--8 zapytañ
--1 view done (1)
--2 join done (6)
--2 podzapytania done (2)
--2(sum, count) done (8)
--2 group by done (5)
--1 order by done (3)