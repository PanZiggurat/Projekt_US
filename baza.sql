CREATE TABLE uzytkownicy (
    id_u INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    email VARCHAR(30) UNIQUE,
    haslo VARCHAR(50)
);

CREATE TABLE obiekty (
    id_o INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(30),
    lokalizacja VARCHAR(30),
    typ_obiektu VARCHAR(20) CHECK (typ_obiektu IN ('Orlik','Hala sportowa','Boisko do koszykówki','Basen','Kort tenisowy')),
    cena_1 FLOAT,
    cena_2 FLOAT,
    mozliwosc_zaplaty VARCHAR(25) CHECK (mozliwosc_zaplaty IN ('zdalnie', 'na miejscu','dowolnie'))
);

CREATE TABLE rezerwacje (
    id_r INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE,
    godzina_p TIME,
    godzina_z TIME,
    platnosc VARCHAR(25) CHECK (platnosc IN ('zdalnie', 'na miejscu','dowolnie')),
    status_platnosci VARCHAR(20) CHECK (status_platnosci IN ('zaplacone','niezaplacone')),
    id_obiektu INT,
    id_uzytkownika INT,
    rodzaj_aktywnosci varchar(30) CHECK (rodzaj_aktywnosci in ('piłka nożna','siatkówka','koszkówka','tenis','pływanie'))
    FOREIGN KEY (id_obiektu) REFERENCES obiekty(id_o),
    FOREIGN KEY (id_uzytkownika) REFERENCES uzytkownicy(id_u)
);