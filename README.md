# my-entrepreneurship

Repozytorium na konkurs 100 commitów by **devmentors**.

## Table of contents

[1. About the project](#1-about-the-project)

[2. Technology](#2-technology)

[3. Main functionality](#3-main-functionality)

[4. Detailed functionality](#4-detailed-functionality)

&nbsp;&nbsp;[4.1 Podgląd na obecnie trzymane pieniądze](#41-podgląd-na-obecnie-trzymane-pieniądze)

&nbsp;&nbsp;[4.2 Badanie budżetu użytkownika](#42-badanie-budżetu-użytkownika)

&nbsp;&nbsp;[4.3 Podgląd na spodziewane zyski](#43-podgląd-na-spodziewane-zyski)

&nbsp;&nbsp;[4.4 Propozycje inwestycji na podstawie podanej kwoty](#44-propozycje-inwestycji-na-podstawie-podanej-kwoty)

[5. Predicted timetable](#5-predicted-timetable)



## 1. About the project

Projekt ma pomagać użytkownikowi zbierać informacje na temat jego finansów i budować podgląd na własne środki pieniężne.

Projektem jest aplikacja mobilna docelowo na system iOS, w kolejnych etapach na Android oraz jako strona internetowa do korzystania na komputerach.

## 2. Technology

Cross-platformowy framework Flutter bazujący na języku programowania Dart.

State management: BLoC

https://bloclibrary.dev
https://github.com/felangel/bloc

Database: Firebase

https://firebase.google.com/docs/storage/flutter/start?hl=pl

Inspirations:

- iOS app - Money Coach

https://github.com/Solido/awesome-flutter?tab=readme-ov-file

Examples of project in general:

https://www.youtube.com/watch?v=e_A_dBteN9Q
https://github.com/devmentors/group-flights-ddd
https://github.com/kgrzybek/modular-monolith-with-ddd\


## 3. Main functionality

- podgląd na obecnie trzymane pieniadze, gdzie są przechowywane, jakie narzędzia są wykorzystywane do przechowywania pieniędzy,
- podgląd na spodziewane zyski z użytych metod oszczędzania i inwestowania,
- propozycje inwestycji na podstawie podanej kwoty, którą użytkownik dysponuje,
- badanie budżetu użytkownika,

Podstawowa wersja aplikacji ma zapewnić funkcje:
- wprowadzenia danych o trzymanych pieniądzach i ich obrocie. Funkcja ma dawać podgląd na stan oszczędności oraz porównać stan z wybranym innym punktem czasu.
- wprowadzenie danych o kosztach i dochodach w ciągu danego okresu. Funkcja ma dawać podgląd na koszty w pewnych okresach czasu oraz porównywać je z kosztami z innych okresów.

## 4. Detailed functionality

### 4.1 Podgląd na obecnie trzymane pieniądze

Wizualny podgląd na stan oszczędności i inwestycji. 

**Funkcjonalność priorytetowa.**

Przewidziane narzędzia użyte do pracy pieniądzem (akcje, obligacje, ETFy, kryptowaluta, lokaty, obce waluty, złoto, gotówka, konto oszczęnościowe). 

- wprowadzenie danych na temat oszczędności: 
    - wysokość kwoty,
    - waluta,
    - miejsce przechowywania,
    - rodzaj użytego narzędzia,
    - oprocentowanie (opcja dostępna w przypadku wybranych narzędzi),
    - data wprowadzenia tych danych,
    - typowanie danych (poduszka finansowa, oszczędność emerytalna, inwestycja)

- edycja danych:
    - wprowadzenie nowych danych,
    - usunięcie danych z odpowiednim komentarzem dlaczego dokonano takiej zmiany,
    - zmiana w już istniejących danych z dodaniem komentarza dlaczego zmiana została dokonana,
    - data wprowadzenia danych.

- usunięcie całego zestawu danych.

- wyświetlenie danych na wykresie kołowym w dwóch trybach:
    - inwestycje w procentach lub w wysokości kwot i w stopniach niskiego, średniego i wysokiego ryzyka,
    - inwestycje w procentach lub w wysokości kwot i rozróżnienie na typy zbieranych pieniędzy (poduszka finansowa, oszczędność emerytalna, inwestycja możliwa do stracenia).
    
- wyświetlenie danych w tabelce:
    - możliwy podział na kategorie lub ustawienie danych priorytetowych.

- wyświetlenie danych z różnych punktów czasu:
    - podgląd na wykres kołowy oszczędności w poprzednich okresach,
    - możliwość wyboru okresu przez użytkownika,
    - możliwość porównania stanu oszczędności z dwóch wybranych punktów czasu za pomocą wykresów i tabelek.
    - funkcja dostępna, jeśli dane zostały wprowadzone więcej niż raz. 

### 4.2 Badanie budżetu użytkownika

Funkcja ma zbierać informacje na temat kosztów stałych, kosztów rocznych, dochodów użytkownika ze źródeł stałych i dodatkowych. 

**Funkcjonalność priorytetowa, do dopracowania.**

Funkcja ma zbudować podgląd na sposób zarządzania pieniędzmi przez użytkownika. Świadomość finansowa pozwoli użytkownikowi polepszyć swoją sytuację finansową. 

- wprowadzenie danych na temat kosztów: 
    - wysokość kwoty,
    - rodzaj kosztu (np. zakupy spożywcze),
    - typ kosztu (koszt stały, roczny, niestały),
    - data wykonania transakcji,
    - okres czasu.

- wprowadzenie danych na temat dochodów: 
    - wysokość kwoty,
    - rodzaj dochodu,
    - typ dochodu,
    - data wykonania transakcji,
    - okres czasu.

- edycja danych:
    - edycja odpowiednich danych,
    - data edycji danych.

- usunięcie całego zestawu danych.

- wyświetlenie danych:
    - koszty i dochody na wykresie słupkowym, dwa słupki obok siebie,
    - koszty na wykresie kołowym w dwóch trybach: w procentach lub w wysokości kwot,
    - wybór typu prezentacji danych: podział na rodzaj kosztów, podział na typ kosztu.
    
- wyświetlenie danych w tabelce:
    - możliwy podział na kategorie lub ustawienie danych priorytetowych.

- wyświetlenie danych z różnych okresów czasu:
    - możliwość wyboru okresu przez użytkownika,
    - podgląd na wykres kołowy oszczędności w wybranych okresach czasu,
    - możliwość porównania kosztów z dwóch wybranych okresów czasu za pomocą wykresów i tabelek.
    - funkcja dostępna, jeśli dane zostały wprowadzone więcej niż raz. 


### 4.3 Podgląd na spodziewane zyski

Funkcja ma obliczyć i wyświetlić informacje na temat spodziewanych zysków w przypadku narzędzi typu obligacje skarbowe i lokaty.

**Funkcjonalność niepriorytetowa, do dopracowania.**

*W miarę rozwoju aplikacji dodawane będą funkcje obliczania zysków z pozostałych narzędzi (akcje, ETFy, złoto, inne waluty, itd.), nie jest to jednak przewidziane na okres 100 dni.*

- wyświetlenie danych szczegółowych w tabelce:
    - wysokość kwoty,
    - wysokość oprocentowania narzędzia,
    - data rozpoczęcia inwestycji,
    - data zakończenia inwestycji,
    - miejsce trzymania środków,
    - zysk brutto,
    - zysk netto,
    - informacja czy trzeba się rozliczyć z zysku w PIT.

Celem funkcjonalności jest zbudowanie informacji pomocnej w dalszych decyzjach o korzystaniu z danego narzędzia, budowaniu opinii na temat narzędzia, jego stabilności i opłacalności.

Przykładowo - porównanie oprocentowania obecnie używanej lokaty z zatwierdzoną stopą procentową, czy oprocentowanie obligacji jest lepsze niż lokata, czy nie lepiej włożyć więcej wysiłku i poszukać czegoś lepszego lub czy zostać przy obecnym.

### 4.4 Propozycje inwestycji na podstawie podanej kwoty

Funkcja ma przedstawić propozycje inwestycji na podstawie podanej kwoty użytkownika.

**Funkcjonalność niepriorytetowa, do dopracowania.**

Przygotowane zostaną min. 3 scenariusze (nisko, średnio, i wysokoryzykowne) propozycji przeznaczenia pieniędzy na inwestycje. 

Kryteria:
- wiek użytkownika,
- liczba osób do utrzymania,
- wysokość zarobku miesięcznie,
- rodzaj umowy o pracę,
- wysokość podanej kwoty przez użytkownika.

Propozycja będzie się składać z nazwy narzędzia, stopnia ryzyka użycia narzędzia oraz wysokości kwoty do wyznaczenia. 

*W początkowej fazie obliczenia będą wykonywane w algorytmie, za pomocą kilku przygotowanych schematów, w kolejnych fazach przewidziane jest rozbudowanie funkcjonalności.*

## 5. Predicted timetable:

1. March:
    - dopracowywanie pomysłów i funkcjonalności,
    - postawienie basicowej wersji aplikacji na emulatorze lub na telefonie iOS,
    - budowa ogólnego okna działania z logo i dwoma zakładkami,
    - budowa formularza w basicowej wersji dla oszczędności,
    - budowa wizualizacji danych w postaci diagramu i tabelki,
    - szukanie informacji na temat testów,
    - szukanie informacji na temat bazy danych do trzymania informacji,
    - analiza działań i wprowadzenie zmian w dalszym planowaniu.

2. April:
    - dopracowywanie pomysłów i funckjonalności,
    - testowanie manualne formularza i wyświetlania danych o oszczędnościach,
    - dodanie kategoryzacji, sortowania, zmiany typów wykresów,
    - budowa formularza w basicowej wersji dla budżetu użytkownika,
    - budowa wizualizacji danych budżetu w postaci diagramu i tabelki,
    - decyzja o pomysłach niepriorytetowych,
    - analiza działań i wprowadzenie zmian w dalszym planowaniu.

3. May:
    - dopracowywanie pomysłów i funckjonalności,
    - // TODO
    - analiza działań i wprowadzenie zmian w dalszym planowaniu.

4. June:
    - dopracowywanie pomysłów i funckjonalności,
    - // TODO
    - oddanie projektu.