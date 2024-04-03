CREATE TABLE uzytkownicy (
    id_u INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(30),
    nazwisko VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    haslo VARCHAR(255)
);

CREATE TABLE obiekty (
    id_o INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(100),
    lokalizacja VARCHAR(50),
    typ_obiektu VARCHAR(30) CHECK (typ_obiektu IN ('Orlik','Hala sportowa','Boisko do koszykówki','Basen','Kort tenisowy')),
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
    rodzaj_aktywnosci varchar(30) CHECK (rodzaj_aktywnosci in ('piłka nożna','siatkówka','koszkówka','tenis','pływanie')),
    FOREIGN KEY (id_obiektu) REFERENCES obiekty(id_o),
    FOREIGN KEY (id_uzytkownika) REFERENCES uzytkownicy(id_u)
);

insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Basen Rosir','ul. ks.Jałowego 23a','Basen',150,200,'zdalnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Pływalnia Delfin','al. Rejtana 30','Basen',140,180,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Pływalnia Karpik','ul. Solarza 12','Basen',145,180,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Basen Muszelka','ul. Starzyńskiego 17','Basen',120,160,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Pływalnia Matuszczaka','ul. A. Matuszczaka 9','Basen',130,175,'dowolnie');

insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kompleks boisk sportowych Orlik przy IV Liceum Ogólnokształcącym im. M. Kopernika','ul. Dąbrowskiego 82','Orlik',60,85,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kompleks boisk sportowych Orlik przy Szkole Podstawowej Nr 13 im. św. Jana Kantego','ul. Skrajna 1','Orlik',60,85,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kompleks boisk sportowych Orlik przy Szkole Podstawowej Nr 25','ul. Starzyńskiego 17','Orlik',60,85,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kompleks boisk sportowych Orlik przy Szkole Podstawowej Nr 5 im. Bohaterów 27 Pułku Piechoty','ul. Słocińska 4','Orlik',60,85,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kompleks boisk sportowych Orlik przy Zespole Szkolno-Przedszkolnym Nr 7','ul. Budziwojska 154','Orlik',60,85,'dowolnie');

insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala ROSiR','ul. Pułaskiego 13','Hala sportowa',100,120,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala sportowa przy IV Liceum Ogólnokształcącego im. Mikołaja Kopernika przy ul. Dąbrowskiego','ul. Dąbrowskiego 82','Hala sportowa',95,110,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala sportowa Szkoła Mistrzostwa Sportowegow Rzeszowie','ul. Hetmańska 38','Hala sportowa',110,135,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala sportowa przy Zespole Szkół Elektronicznych','ul. Hetmańska 120','Hala sportowa',100,115,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Społecznych nr 1','ul. Bohaterów 26','Hala sportowa',100,130,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Ogólnokształcących nr 3','ul. Wyspiańskiego 16a','Hala sportowa',90,115,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Ogólnokształcących nr 4','ul. Rejtana 30','Hala sportowa',100,125,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa II LO','ul. ks. Jałowego 22','Hala sportowa',100,125,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Zespołu Szkół Technicznych','ul. Matuszczaka 7','Hala sportowa',100,120,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Ogólnokształcących nr 1','ul. Towarnickiego 4','Hala sportowa',100,135,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Energetycznych','ul. Dąbrowskiego 66a','Hala sportowa',110,145,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Gospodarczych','ul. Spytka Ligęzy 12','Hala sportowa',100,115,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Ekonomicznych','ul. Hoffmanowej 13','Hala sportowa',100,120,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Mechaniczych','ul. Hetmańska 45a','Hala sportowa',100,125,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy Zespole Szkół Samochodowych','ul. Warszawska 26a','Hala sportowa',110,130,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Hala Sportowa przy I Liceum Ogólnokształcącym','ul. 3 Maja 16','Hala sportowa',120,145,'dowolnie');

insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Korty Tenisowe ROSiR','ul. ks.Jałowego 23a','Kort tenisowy',65,80,'dowolnie');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Korty tenisowe przy Szkole Podstawowej Nr 25','ul. Starzyńskiego 17','Kort tenisowy',60,70,'na miejscu');
insert into obiekty (nazwa,lokalizacja,typ_obiektu,cena_1,cena_2,mozliwosc_zaplaty) values ('Kort tenisowy przy IX Liceum Ogólnokształcącym','ul. Orzeszkowej 8a','Kort tenisowy',55,75,'dowolnie');