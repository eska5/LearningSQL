USE [galerie_sztuki_lab1]

delete from konserwatorzy where ID_konserwatora=6;
delete from pracownicy where ID_pracownika=1;
delete from artyœci where ID_artysty=1;
delete from dzie³a where ID_dzie³a=1;
delete from wystawy where ID_wystawy=1;



UPDATE galerie
SET nazwa_galerii = 'NOWA GALERIA'
where ID_galerii = 5;

UPDATE dzie³a
SET tytu³ = 'Tak'
where ID_dzie³a = 5;

UPDATE transakcje
SET cena_sprzeda¿y = '243000.00'
where ID_transakcji = 2;

UPDATE artyœci
SET imie = 'CheckTheUpdate'
where data_œmierci > '2012-02-02';

UPDATE bilety
SET cena = '26.00'
where rodzaj_biletu = 'normalny';