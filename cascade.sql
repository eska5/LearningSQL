USE [galerie_sztuki_lab1]

delete from konserwatorzy where ID_konserwatora=6;
delete from pracownicy where ID_pracownika=1;
delete from arty�ci where ID_artysty=1;
delete from dzie�a where ID_dzie�a=1;
delete from wystawy where ID_wystawy=1;



UPDATE galerie
SET nazwa_galerii = 'NOWA GALERIA'
where ID_galerii = 5;

UPDATE dzie�a
SET tytu� = 'Tak'
where ID_dzie�a = 5;

UPDATE transakcje
SET cena_sprzeda�y = '243000.00'
where ID_transakcji = 2;

UPDATE arty�ci
SET imie = 'CheckTheUpdate'
where data_�mierci > '2012-02-02';

UPDATE bilety
SET cena = '26.00'
where rodzaj_biletu = 'normalny';