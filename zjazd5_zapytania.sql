-- Zapytanie o tabelki w bazie danych
SHOW TABLES;

-- Zapytanie o wypisanie danych z tabeli `kierowca`
SELECT * FROM kierowca;

-- Zapytanie o wypisanie danych z tabeli `kierowca` dla kierowców z kategorią 'B'
SELECT *
FROM kierowca
WHERE kategoria = 'B';

-- Zapytanie o wypisanie danych z tabeli `kierowca` dla kierowców starszych niż 30 lat
SELECT *
FROM kierowca
WHERE wiek > 30;

-- Zapytanie o wypisanie danych z tabeli `kierowca` dla kierowców o nazwisku 'lis'
SELECT *
FROM kierowca
WHERE nazwisko = 'lis';

-- Zapytanie o wypisanie danych z tabeli `kierowca` dla kierowców o nazwisku o długości 3 liter
SELECT *
FROM kierowca
WHERE LENGTH(nazwisko) = 3;

-- Zapytanie o obliczenie średniego wieku wszystkich kierowców
SELECT AVG(wiek)
FROM kierowca;

-- Zapytanie o wypisanie unikalnych imion kierowców
SELECT DISTINCT imie
FROM kierowca;

-- Zapytanie o zliczenie unikalnych imion kierowców
SELECT COUNT(DISTINCT imie)
FROM kierowca;

-- Zapytanie o zliczenie unikalnych imion kierowców z nadaniem aliasu 'K7'
SELECT COUNT(DISTINCT imie) AS 'K7'
FROM kierowca;

-- Zapytanie o wypisanie imion i nazwisk kierowców z tabeli `kierowca`
SELECT kierowca.imie, kierowca.nazwisko
FROM kierowca;

-- Zapytanie o wypisanie nazwisk i wieku kierowców z tabeli `kierowca`
SELECT kierowca.nazwisko, kierowca.wiek
FROM kierowca;

-- Zapytanie o wypisanie nazwisk w małych literach z tabeli `kierowca`
SELECT LOWER(nazwisko)
FROM kierowca;

-- Zapytanie o wypisanie nazwisk w dużych literach z tabeli `kierowca`
SELECT UPPER(nazwisko)
FROM kierowca;

-- Zapytanie o wypisanie wszystkich informacji o kierowcach i pojazdach dla kierowcy o `id` równym 1
SELECT *
FROM kierowca
JOIN pojazd
ON kierowca.id = pojazd.id_kierowcy
WHERE kierowca.id = 1;

-- Zapytanie o wypisanie informacji o pojazdach i pasażerach dla pojazdu o `id` równym 2
SELECT *
FROM pojazd
JOIN pasazer
ON pojazd.id = pasazer.id_pojazdu
JOIN kierowca
ON pojazd.id_kierowcy = kierowca.id
WHERE pojazd.id = 2;

-- Zapytanie o obliczenie średniego wieku kierowców, którzy prowadzą pojazdy marki 'vw'
SELECT AVG(wiek)
FROM kierowca
JOIN pojazd
ON pojazd.id_kierowcy = kierowca.id
WHERE marka = 'vw';
