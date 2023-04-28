# Dokumentacja bazy danych księgarni
Opis projektu
Projekt bazy danych księgarni jest oparty na relacyjnym modelu danych i ma na celu przechowywanie informacji o produktach, klientach oraz zamówieniach. Baza danych została zaprojektowana w sposób umożliwiający łatwe i intuicyjne zarządzanie produktami i klientami, a także umożliwiający generowanie raportów sprzedażowych.

# Struktura bazy danych
Baza danych składa się z następujących tabel:

tabela produkty przechowująca informacje o `produktach`, takie jak tytuł, autor, wydawca, cena i dostępna ilość
tabela klienci przechowująca informacje o `klientach`, takie jak imię, nazwisko, adres i adres e-mail
tabela zamówienia przechowująca informacje o `zamówieniach`, takie jak data zamówienia, identyfikator klienta i identyfikator produktu
tabela autorzy prechowywująca informacje o `autorach`, takie jak imie i nazwiskio, data urodzenia, czy biografia
Baza danych księgarni została zaprojektowana z myślą o łatwym i intuicyjnym zarządzaniu produktami i klientami. Interfejs użytkownika umożliwia dodawanie nowych produktów, edytowanie istniejących produktów, przeglądanie listy produktów oraz zarządzanie klientami. Dodatkowo, interfejs umożliwia generowanie raportów sprzedażowych na podstawie danych przechowywanych w bazie danych.

![diagram](https://github.com/DBOYttt/ksiengarniadb/blob/main/diagram.png)

# instalacja 
zainstaluj najnowszą wersje oprogramowania `xampp`
następnie pobierz repozytorium 
uruchom program `xampp` 
urochom `mysql`
uruchom `phpmyadmin` 
inportuj pliki z końcówką `.sql`
gotowe :- )

#przydatna wiedza 

w projekcie do masowego generowania 4 różnych od siebie zmiennych użyłem generatora Mackaroo a następnie w varchar(50) zapisałem numery od 1 do 100 co pozwoliło mi na użycie
```
UPDATE zamowienia
SET status_zamowienia =
    CASE
        WHEN status_zamowienia BETWEEN 1 AND 25 THEN 'Nowe'
        WHEN status_zamowienia BETWEEN 26 AND 50 THEN 'W trakcie realizacji'
        WHEN status_zamowienia BETWEEN 51 AND 75 THEN 'Zakończone'
        WHEN status_zamowienia BETWEEN 76 AND 100 THEN 'Anulowane'
    END;

```
dzięki czemu mogłem losowo zapisać masowo informacje 
