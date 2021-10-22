USE [galerie_sztuki_lab1]
GO

IF EXISTS (SELECT * FROM sys.tables WHERE name='galerie')
	DROP TABLE galerie
GO

Create table galerie
(
ID_galerii int IDENTITY(1,1) NOT NULL,
nazwa_galerii varchar(255) NOT NULL UNIQUE,
kraj varchar(255) NOT NULL ,
miasto varchar(255) NOT NULL ,
primary key (ID_galerii)
);



IF EXISTS (SELECT * FROM sys.tables WHERE name='arty�ci')
	DROP TABLE arty�ci
GO

Create table arty�ci
(
ID_artysty int IDENTITY(1,1) NOT NULL,
imie varchar(255) NOT NULL,
nazwisko varchar(255) NOT NULL,
data_urodzenia DATE NOT NULL,
data_�mierci DATE NULL,
primary key (ID_artysty)
);

ALTER TABLE arty�ci
    ADD CONSTRAINT ARTY�CI_DATA_URODZENIA CHECK (data_urodzenia < GETDATE());



IF EXISTS (SELECT * FROM sys.tables WHERE name='aukcje')
	DROP TABLE aukcje
GO

Create table aukcje
(
ID_aukcji int IDENTITY(1,1) NOT NULL,
ilo��_dzie� int NOT NULL,
data_rozpocz�cia DATE NOT NULL,
data_zako�czenia DATE NOT NULL,
ilo��_sprzedanych_dzie� int NOT NULL,
przych�d money NOT NULL,
ID_galerii int FOREIGN KEY REFERENCES galerie(ID_galerii) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
primary key (ID_aukcji)
);

IF EXISTS (SELECT * FROM sys.tables WHERE name='wystawy')
	DROP TABLE wystawy
GO

Create table wystawy
(
ID_wystawy int IDENTITY(1,1) NOT NULL,
data_otwarcia DATE NOT NULL,
data_zamkni�cia DATE NULL,
ilo��_dzie� int NOT NULL,
motyw_przewodni varchar(255) NULL,
ID_galerii int FOREIGN KEY REFERENCES galerie(ID_galerii) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
primary key (ID_wystawy)
);

IF EXISTS (SELECT * FROM sys.tables WHERE name='transakcje')
	DROP TABLE transakcje
GO

Create table transakcje
(
ID_transakcji int IDENTITY(1,1) NOT NULL,
cena_sprzeda�y money NOT NULL,
cena_wywo�awcza money NOT NULL,
czas_sprzeda�y datetime NOT NULL ,
ID_aukcji int FOREIGN KEY REFERENCES aukcje(ID_aukcji) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
primary key (ID_transakcji)
);

ALTER TABLE transakcje
    ADD CONSTRAINT TRANSAKCJE_CENA_SPRZEDA�Y CHECK (cena_sprzeda�y >= cena_wywo�awcza);





IF EXISTS (SELECT * FROM sys.tables WHERE name='dzie�a')
	DROP TABLE dzie�a
GO

Create table dzie�a
(
ID_dzie�a int IDENTITY(1,1) NOT NULL,
tytu� varchar(255) NOT NULL,
typ varchar(255) NOT NULL,
data_wykonania DATE NULL, 
pochodzenie varchar(255) NULL,
ID_artysty int FOREIGN KEY REFERENCES arty�ci(ID_artysty) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ID_transakcji int FOREIGN KEY REFERENCES transakcje(ID_transakcji) ON UPDATE NO ACTION ON DELETE NO ACTION NULL,
ID_wystawy int  FOREIGN KEY REFERENCES wystawy(ID_wystawy) ON UPDATE NO ACTION ON DELETE NO ACTION NULL,
ID_galerii int FOREIGN KEY REFERENCES galerie(ID_galerii) ON UPDATE NO ACTION ON DELETE NO ACTION NULL,
primary key (ID_dzie�a)
);

ALTER TABLE dzie�a
    ADD CONSTRAINT DZIE�A_DATA_WYKONANIA CHECK (data_wykonania < GETDATE());

IF EXISTS (SELECT * FROM sys.tables WHERE name='bilety')
	DROP TABLE bilety
GO

Create table bilety
(
ID_biletu int IDENTITY(1,1) NOT NULL,
cena money NOT NULL,
data_wydania DATETIME NOT NULL,
rodzaj_biletu varchar(255) DEFAULT 'Normalny' NOT NULL,
ID_wystawy int FOREIGN KEY REFERENCES wystawy(ID_wystawy) ON UPDATE CASCADE ON DELETE CASCADE NOT  NULL,
primary key (ID_biletu)
);

ALTER TABLE bilety
    ADD CONSTRAINT BILETY_DATA_WYDANIA CHECK (data_wydania <= GETDATE());

ALTER TABLE bilety
    ADD CONSTRAINT BILETY_CENA CHECK (cena > 0);


IF EXISTS (SELECT * FROM sys.tables WHERE name='konserwatorzy')
	DROP TABLE konserwatorzy
GO

Create table konserwatorzy
(
ID_konserwatora int IDENTITY(1,1) NOT NULL,
typ_dzie� varchar(255) NOT NULL,
ilo��_konserwacji int DEFAULT 0 NOT NULL ,
primary key (ID_konserwatora)
);



IF EXISTS (SELECT * FROM sys.tables WHERE name='pracownicy')
	DROP TABLE pracownicy
GO

Create table pracownicy
(
ID_pracownika int IDENTITY(1,1) NOT NULL,
imie varchar(255) NOT NULL,
nazwisko varchar(255) NOT NULL,
data_przyj�cia_do_pracy DATE DEFAULT GETDATE() NOT NULL ,
ID_aukcji int FOREIGN KEY REFERENCES aukcje(ID_aukcji) ON UPDATE NO ACTION ON DELETE NO ACTION NULL,
ID_wystawy int FOREIGN KEY REFERENCES wystawy(ID_wystawy) ON UPDATE NO ACTION ON DELETE NO ACTION NULL,
ID_galerii int FOREIGN KEY REFERENCES galerie(ID_galerii) ON UPDATE CASCADE ON DELETE CASCADE NULL,
ID_konserwatora int FOREIGN KEY REFERENCES konserwatorzy(ID_konserwatora) ON UPDATE CASCADE ON DELETE CASCADE NULL,
primary key (ID_pracownika)
);


IF EXISTS (SELECT * FROM sys.tables WHERE name='konserwacje')
	DROP TABLE konserwacje
GO

Create table konserwacje
(
ID_konserwacji int IDENTITY(1,1) NOT NULL,
data_rozpocz�cia DATE NOT NULL,
data_ko�ca DATE NULL,
koszt_konserwacji money NOT NULL ,
ID_dzie�a int FOREIGN KEY REFERENCES dzie�a(ID_dzie�a) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ID_konserwatora int FOREIGN KEY REFERENCES konserwatorzy(ID_konserwatora)ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
primary key (ID_konserwacji)
);

IF EXISTS (SELECT * FROM sys.tables WHERE name='klienci')
	DROP TABLE klienci
GO

Create table klienci
(
ID_klienta int IDENTITY(1,1) NOT NULL UNIQUE,
imie varchar(255) NOT NULL,
nazwisko varchar(255) NOT NULL,
rodzaj_p�atno�ci varchar(255) NOT NULL,
ID_transakcji int FOREIGN KEY REFERENCES transakcje(ID_transakcji) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
primary key (ID_klienta)
);

	