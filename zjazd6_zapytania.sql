-- Ilu jest kierowców?
SELECT COUNT(*) AS 'Ilu jest kierowców?'
FROM kierowca;

-- Ilu kierowców ma kategorię B?
SELECT COUNT(*) AS 'Ilu kierowców ma kat. B?'
FROM kierowca
WHERE kategoria = 'B';

-- Średni wiek kierowców?
SELECT ROUND(AVG(wiek),0) AS 'Średni wiek kierowców'
FROM kierowca;

-- Średni wiek kierowców z kat. B?
SELECT ROUND(AVG(wiek),0) AS 'Średni wiek kierowców z kat. B'
FROM kierowca
WHERE kategoria = 'B';

-- Średni wiek kierowców per kategoria prawa jazdy
SELECT kategoria, ROUND(AVG(wiek),0) AS 'śr. wiek'
FROM kierowca
GROUP BY kategoria;

-- Średni wiek kierowców per marka pojazdu
SELECT marka, ROUND(AVG(wiek),0) AS 'śr. wiek'
FROM pojazd
JOIN kierowca
    ON pojazd.id_kierowcy = kierowca.id
GROUP BY marka;

-- Liczba pasazerów per marka pojazdu
SELECT marka, COUNT(pasazer.id) AS 'liczba pasazerow'
FROM pojazd
LEFT JOIN pasazer
    ON pasazer.id_pojazdu = pojazd.id
GROUP BY marka;

-- Liczba pasazerów per marka, kierowca
SELECT pojazd.marka, kierowca.imie AS 'imie kierowcy', kierowca.nazwisko AS 'nazwisko kierowcy', COUNT(pasazer.id) AS 'liczba pasazerow'
FROM pojazd
LEFT JOIN pasazer
    ON pasazer.id_pojazdu = pojazd.id
LEFT JOIN kierowca
    ON pojazd.id_kierowcy = kierowca.id
GROUP BY pojazd.marka, kierowca.imie, kierowca.nazwisko;

-- Ile lat mają kierowcy poszczególnych miast
SELECT miasto, SUM(wiek) AS 'Suma wieku kierowców'
FROM kierowca
GROUP BY miasto;

-- Najstarszy kierowca per miasto
SELECT imie, nazwisko, miasto, MAX(wiek)
FROM kierowca
GROUP BY miasto;

-- Najmłodszy kierowca
SELECT imie, nazwisko, MIN(wiek)
FROM kierowca;

-- Którzy kierowcy wiozą pasaerów z tego samego miasta co miasto kierowcy i ilu ich wiozą?
SELECT kierowca.imie, kierowca.nazwisko, kierowca.miasto, pasazer.miasto, COUNT(pasazer.id)
FROM kierowca
JOIN pojazd
    ON pojazd.id_kierowcy = kierowca.id
JOIN pasazer
    ON pasazer.id_pojazdu = pojazd.id
WHERE kierowca.miasto = pasazer.miasto
GROUP BY kierowca.imie, kierowca.nazwisko, kierowca.miasto;

-- Którymi markami pojazdów kierowcy wozą więcej niz jednego pasazera?
SELECT marka, COUNT(pasazer.id) AS 'liczba pasazerow'
FROM pojazd
LEFT JOIN pasazer
    ON pasazer.id_pojazdu = pojazd.id
GROUP BY marka
HAVING COUNT(pasazer.id) > 1;

-- pełna lista kierowcow i pasazerow (imie, nazwisko, miasto)
SELECT imie, nazwisko, miasto
FROM kierowca
UNION ALL
SELECT imie, nazwisko, miasto
FROM pasazer;

-- unikalna lista kierowcow i pasazerow (imie, nazwisko, miasto)
SELECT imie, nazwisko, miasto FROM kierowca
UNION
SELECT imie, nazwisko, miasto FROM pasazer;
