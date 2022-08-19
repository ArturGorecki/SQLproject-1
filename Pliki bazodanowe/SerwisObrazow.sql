USE [master]
CREATE DATABASE SerwisObrazow
GO
 
USE [SerwisObrazow]
GO
-- tabele
CREATE TABLE [dbo].[Pozycja](
	[id_pozycja] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_lista] [int] NOT NULL,
	[data_dodania] [date] NOT NULL,
	[id_artysta] [int] NULL,
	[id_obraz] [int] NULL,
	[id_galeria] [int] NULL)
GO

CREATE TABLE [dbo].[Lista](
	[id_lista] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_uzytkownik] [int] NOT NULL,
	[nazwa] [nvarchar](100) NOT NULL,
	[data_utworzenia] [date] NOT NULL)
GO

CREATE TABLE [dbo].[Ocena](
	[id_ocena] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_uzytkownik] [int] NOT NULL,
	[id_obraz] [int] NOT NULL,
	[wartosc] [int] NOT NULL,
	[data_wystawienia] [date] NOT NULL)
GO

CREATE TABLE [dbo].[Kolekcja](
	[id_kolekcja] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_uzytkownik] [int] NOT NULL,
	[id_obraz] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[data_dodania] [date] NOT NULL)
GO

CREATE TABLE [dbo].[Recenzja](
	[id_recenzja] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_uzytkownik] [int] NOT NULL,
	[id_obraz] [int] NOT NULL,
	[opis] [nvarchar](2000) NOT NULL,
	[data_wystawienia] [date] NOT NULL)
GO

CREATE TABLE [dbo].[Rekomendacja](
	[id_rekomendacja] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_uzytkownik_nadawca] [int] NOT NULL,
	[id_uzytkownik_odbiorca] [int] NOT NULL,
	[id_obraz] [int] NULL,
	[id_artysta] [int] NULL,
	[opis] [nvarchar](2000) NULL)
GO

CREATE TABLE [dbo].[Obraz](
	[id_obraz] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](250) NOT NULL,
	[id_artysta] [int] NOT NULL,
	[id_rodzaj] [int] NOT NULL,
	[data_powstania] [date] NOT NULL,
	[id_epoka] [int] NOT NULL,
	[id_medium] [int] NOT NULL,
	[rozmiar] [nvarchar](50) NOT NULL,
	[id_galeria] [int] NOT NULL)
GO

CREATE TABLE [dbo].[Rodzaj](
	[id_rodzaj] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[Medium](
	[id_medium] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[Epoka](
	[id_epoka] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[Panstwo](
	[id_panstwo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[Galeria](
	[id_galeria] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL,
	[id_panstwo] [int] NOT NULL,
	[miasto] [nvarchar](100) NOT NULL,
	[adres] [nvarchar](255) NOT NULL)
GO

CREATE TABLE [dbo].[Artysta](
	[id_artysta] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_osoba] [int] NOT NULL,
	[data_smierci] [date] NULL,
	[id_epoka] [int] NOT NULL)
GO

CREATE TABLE [dbo].[Osoba](
	[id_osoba] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[imie] [nvarchar](100) NOT NULL,
	[nazwisko] [nvarchar](255) NOT NULL,
	[data_urodzenia] [date] NOT NULL,
	[id_panstwo] [int] NOT NULL)
GO

CREATE TABLE [dbo].[Rola](
	[id_rola] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nazwa] [nvarchar](100) NOT NULL)
GO

CREATE TABLE [dbo].[Uzytkownik](
	[id_uzytkownik] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[id_osoba] [int] NOT NULL,
	[data_dolaczenia] [date] NOT NULL,
	[id_rola] [int] NOT NULL,
	[adres_email] [nvarchar](255) NOT NULL,
	[login] [nvarchar](255) NOT NULL,
	[haslo] [nvarchar](255) NOT NULL)
GO

-- klucze obce
ALTER TABLE [dbo].[Pozycja]
ADD CONSTRAINT FK_Pozycja_Lista
FOREIGN KEY (id_lista) REFERENCES [dbo].[Lista](id_lista);

ALTER TABLE [dbo].[Pozycja]
ADD CONSTRAINT FK_Pozycja_Artysta
FOREIGN KEY (id_artysta) REFERENCES [dbo].[Artysta](id_artysta);

ALTER TABLE [dbo].[Pozycja]
ADD CONSTRAINT FK_Pozycja_Obraz
FOREIGN KEY (id_obraz) REFERENCES [dbo].[Obraz](id_obraz);

ALTER TABLE [dbo].[Pozycja]
ADD CONSTRAINT FK_Pozycja_Galeria
FOREIGN KEY (id_galeria) REFERENCES [dbo].[Galeria](id_galeria);

ALTER TABLE [dbo].[Lista]
ADD CONSTRAINT FK_Lista_Uzytkownik
FOREIGN KEY (id_uzytkownik) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);

ALTER TABLE [dbo].[Ocena]
ADD CONSTRAINT FK_Ocena_Uzytkownik
FOREIGN KEY (id_uzytkownik) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);

ALTER TABLE [dbo].[Ocena]
ADD CONSTRAINT FK_Ocena_Obraz
FOREIGN KEY (id_obraz) REFERENCES [dbo].[Obraz](id_obraz);

ALTER TABLE [dbo].[Kolekcja]
ADD CONSTRAINT FK_Kolekcja_Uzytkownik
FOREIGN KEY (id_uzytkownik) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);

ALTER TABLE [dbo].[Kolekcja]
ADD CONSTRAINT FK_Kolekcja_Obraz
FOREIGN KEY (id_obraz) REFERENCES [dbo].[Obraz](id_obraz);

ALTER TABLE [dbo].[Recenzja]
ADD CONSTRAINT FK_Recenzja_Uzytkownik
FOREIGN KEY (id_uzytkownik) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);

ALTER TABLE [dbo].[Recenzja]
ADD CONSTRAINT FK_Recenzja_Obraz
FOREIGN KEY (id_obraz) REFERENCES [dbo].[Obraz](id_obraz);

ALTER TABLE [dbo].[Rekomendacja]
ADD CONSTRAINT FK_Rekomendacja_UzytkownikNadawca
FOREIGN KEY (id_uzytkownik_nadawca) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);

ALTER TABLE [dbo].[Rekomendacja]
ADD CONSTRAINT FK_Rekomendacja_UzytkownikOdbiorca
FOREIGN KEY (id_uzytkownik_odbiorca) REFERENCES [dbo].[Uzytkownik](id_uzytkownik);


ALTER TABLE [dbo].[Rekomendacja]
ADD CONSTRAINT FK_Rekomendacja_Obraz
FOREIGN KEY (id_obraz) REFERENCES [dbo].[Obraz](id_obraz);

ALTER TABLE [dbo].[Rekomendacja]
ADD CONSTRAINT FK_Rekomendacja_Artysta
FOREIGN KEY (id_artysta) REFERENCES [dbo].[Artysta](id_artysta);

ALTER TABLE [dbo].[Obraz]
ADD CONSTRAINT FK_Obraz_Artysta
FOREIGN KEY (id_artysta) REFERENCES [dbo].[Artysta](id_artysta);


ALTER TABLE [dbo].[Obraz]
ADD CONSTRAINT FK_Obraz_Rodzaj
FOREIGN KEY (id_rodzaj) REFERENCES [dbo].[Rodzaj](id_rodzaj);

ALTER TABLE [dbo].[Obraz]
ADD CONSTRAINT FK_Obraz_Epoka
FOREIGN KEY (id_epoka) REFERENCES [dbo].[Epoka](id_epoka);

ALTER TABLE [dbo].[Obraz]
ADD CONSTRAINT FK_Obraz_Medium
FOREIGN KEY (id_medium) REFERENCES [dbo].[Medium](id_medium);

ALTER TABLE [dbo].[Obraz]
ADD CONSTRAINT FK_Obraz_Galeria
FOREIGN KEY (id_galeria) REFERENCES [dbo].[Galeria](id_galeria);

ALTER TABLE [dbo].[Galeria]
ADD CONSTRAINT FK_Galeria_Panstwo
FOREIGN KEY (id_panstwo) REFERENCES [dbo].[Panstwo](id_panstwo);

ALTER TABLE [dbo].[Artysta]
ADD CONSTRAINT FK_Artysta_Osoba
FOREIGN KEY (id_osoba) REFERENCES [dbo].[Osoba](id_osoba);

ALTER TABLE [dbo].[Artysta]
ADD CONSTRAINT FK_Artysta_Epoka
FOREIGN KEY (id_epoka) REFERENCES [dbo].[Epoka](id_epoka);

ALTER TABLE [dbo].[Osoba]
ADD CONSTRAINT FK_Osoba_Panstwo
FOREIGN KEY (id_panstwo) REFERENCES [dbo].[Panstwo](id_panstwo);

ALTER TABLE [dbo].[Uzytkownik]
ADD CONSTRAINT FK_Uzytkownik_Osoba
FOREIGN KEY (id_osoba) REFERENCES [dbo].[Osoba](id_osoba);

ALTER TABLE [dbo].[Uzytkownik]
ADD CONSTRAINT FK_Uzytkownik_Rola
FOREIGN KEY (id_rola) REFERENCES [dbo].[Rola](id_rola);

  ALTER TABLE dbo.panstwo
  ADD UNIQUE (Nazwa)