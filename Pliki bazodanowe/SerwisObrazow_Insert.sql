USE [SerwisObrazow]
GO

INSERT INTO dbo.Rola(nazwa)
VALUES('Użytkownik'), ('Subskrybent'), ('Administrator')

INSERT INTO dbo.Panstwo(nazwa)
VALUES('Włochy'), ('Francja'), ('Polska'), ('Hiszpania'), ('USA')

INSERT INTO dbo.Epoka(nazwa)
VALUES('renesans'), ('impresjonizm'), ('surrealizm') 

INSERT INTO dbo.Medium(nazwa)
VALUES('olej na płótnie'), ('olej + tempera na desce'), ('malowidło ścienne'), ('olej na desce')

INSERT INTO dbo.Rodzaj(nazwa)
VALUES ('malowidło'), ('portret'), ('obraz')

INSERT INTO dbo.Osoba(imie, nazwisko, data_urodzenia, id_panstwo)
VALUES
('Artur', 'Górecki', '1998-12-17', 3),
('Jan', 'Nowak', '1990-01-02', 3),
('Claude', 'Monet', '1840-11-14', 2),
('Salvador', 'Dali', '1904-05-11', 4),
('Leonardo', 'da Vinci', '1452-04-15', 1)

INSERT INTO dbo.Uzytkownik(id_osoba, data_dolaczenia, id_rola, adres_email, login, haslo)
VALUES 
(1, '2022-06-12', 3, 'agorecki@gmail.com', 'agorecki', '4xcSEIzSk47aGnDvKYNB2atQSTs='),
(2, '2022-06-13', 1, 'jnowak@gmail.com', 'jnowak', 'Rb7oCtBzkiboO45MN/YAkMxfx3I=')

INSERT INTO dbo.Artysta(id_osoba, data_smierci, id_epoka)
VALUES
(3, '1926-12-05', 2),
(4, '1989-01-23', 3),
(5, '1519-05-02', 1)

INSERT INTO dbo.Galeria(id_panstwo, nazwa, miasto, adres)
VALUES
(2, 'Luwr', 'Paryż', '75058 Paris cedex 01'),
(2, 'Musée Marmottan Monet', 'Paryż', '2, rue Louis-Boilly 75016 Paris'),
(5, 'Museum of Modern Art', 'Nowy Jork', '11 West 53rd Street'),
(3, 'Muzeum Książąt Czartoryskich', 'Kraków', 'ul. Pijarska 15'),
(1, 'Santa Maria delle Grazie', 'Mediolan', 'Piazza di Santa Maria delle Grazie, 20123 Milano')


INSERT INTO dbo.Obraz(nazwa, id_artysta, id_rodzaj, data_powstania, id_epoka, id_medium, rozmiar, id_galeria)
VALUES
('Mona Lisa', 3, 2, '1507-01-01', 1, 4, '77 x 53 cm', 1),
('Dama z gronostajem', 3, 2, '1490-01-01', 1, 2, '54.7 x 40.3 cm', 4),
('Ostatnia Wieczerza', 3, 1, '1498-01-01', 1, 3, '460 x 880 cm', 5),
('Impresja, wschód słońca', 1, 3, '1872-01-01', 2, 1, '48 x 63 cm', 2),
('Trwałość pamięci', 2, 3, '1931-01-01', 3, 1, '24.1 x 33 cm', 3)

INSERT INTO dbo.Ocena(id_uzytkownik, id_obraz, wartosc, data_wystawienia)
VALUES
(1, 1, 7, '2022-06-12'),
(1, 2, 8, '2022-06-12'),
(1, 3, 8, '2022-06-12'),
(1, 4, 5, '2022-06-12'),
(1, 5, 8, '2022-06-12'),
(2, 3, 6, '2022-06-13'),
(2, 4, 9, '2022-06-13'),
(2, 5, 4, '2022-06-13')

INSERT INTO dbo.Kolekcja(id_uzytkownik, id_obraz, status, data_dodania)
VALUES
(1, 1, 'Chcę zobaczyć', '2022-06-12'),
(1, 2, 'Chcę zobaczyć', '2022-06-12'),
(1, 3, 'Chcę zobaczyć', '2022-06-12'),
(1, 4, 'Chcę zobaczyć', '2022-06-12'),
(1, 5, 'Chcę zobaczyć', '2022-06-12'),
(2, 3, 'Widziane', '2022-06-13'),
(2, 4, 'Widziane', '2022-06-13'),
(2, 5, 'Widziane', '2022-06-13')

INSERT INTO dbo.Recenzja(id_uzytkownik, id_obraz, opis, data_wystawienia)
VALUES
(2, 3, 'Ładne malowidło w kościele.', '2022-06-13'),
(2, 4, 'Opus magnum impresjonizmu!', '2022-06-13'),
(2, 5, 'Nie rozumiem dzieł Salvadora Dalego', '2022-06-13')

INSERT INTO dbo.Rekomendacja(id_uzytkownik_nadawca, id_uzytkownik_odbiorca, id_obraz, id_artysta, opis)
VALUES
(1, 2, 1, NULL, 'Genialny obraz da Vinciego.'),
(1, 2, 2, NULL, NULL)

INSERT INTO dbo.Lista(id_uzytkownik, nazwa, data_utworzenia)
VALUES
(1, 'Moje ulubione obrazy', '2022-06-12'),
(2, 'My favourite artists', '2022-06-13')

INSERT INTO dbo.Pozycja(id_lista, data_dodania, id_obraz)
VALUES
(1, '2022-06-12', 1),
(1, '2022-06-12', 2),
(1, '2022-06-12', 3),
(1, '2022-06-12', 5)

INSERT INTO dbo.Pozycja(id_lista, data_dodania, id_artysta)
VALUES
(2, '2022-06-13', 1)