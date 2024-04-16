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

ALTER TABLE obiekty
ADD COLUMN link VARCHAR(510);

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2562.479359252392!2d21.99093647691841!3d50.03985091684234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb060cc90a87%3A0x5fe01feeba44852d!2sBasen%20OTWARTY%20-%20ROSIR%20Rzeszow!5e0!3m2!1spl!2spl!4v1713259732941!5m2!1spl!2spl'
WHERE id_o = 1;

UPDATE obiekty
SET wspolrzedne = '50.02560098122804, 22.011381750974042'
WHERE id_o = 2;

UPDATE obiekty
SET wspolrzedne = '50.044738540471606, 21.97601641232518'
WHERE id_o = 3;

UPDATE obiekty
SET wspolrzedne = '50.06011742642689, 21.982268283490306'
WHERE id_o = 4;

UPDATE obiekty
SET wspolrzedne = '50.015714953875644, 21.9782040258159'
WHERE id_o = 5;

UPDATE obiekty
SET wspolrzedne = '50.021684336746475, 21.980580681636983'
WHERE id_o = 6;

UPDATE obiekty
SET wspolrzedne = '50.06199254753048, 21.997034808660892'
WHERE id_o = 7;

UPDATE obiekty
SET wspolrzedne = '50.06011742642689, 21.982268283490306'
WHERE id_o = 8;

UPDATE obiekty
SET wspolrzedne = '50.0255108039374, 22.047642483488204'
WHERE id_o = 9;

UPDATE obiekty
SET wspolrzedne = '49.96940508594129, 21.98770615464887'
WHERE id_o = 10;

UPDATE obiekty
SET wspolrzedne = '50.03889818734295, 21.99285828163809'
WHERE id_o = 11;

UPDATE obiekty
SET wspolrzedne = '50.021663656986725, 21.980634325816222'
WHERE id_o = 12;

UPDATE obiekty
SET wspolrzedne = '50.023068715970226, 21.994217825816296'
WHERE id_o = 13;

UPDATE obiekty
SET wspolrzedne = '50.03430553223948, 21.97848788163779'
WHERE id_o = 14;

UPDATE obiekty
SET wspolrzedne = '50.039820947377216, 21.986872241160754'
WHERE id_o = 15;

UPDATE obiekty
SET wspolrzedne = '50.025990031737166, 22.01037786814483'
WHERE id_o = 16;

UPDATE obiekty
SET wspolrzedne = '50.04107024307407, 21.994260339309957'
WHERE id_o = 17;

UPDATE obiekty
SET wspolrzedne = '50.01561204245852, 21.977774425815884'
WHERE id_o = 18;

UPDATE obiekty
SET wspolrzedne = '50.04221472946133, 21.99503208163822'
WHERE id_o = 19;

UPDATE obiekty
SET wspolrzedne = '50.022480489235036, 21.980815883488013'
WHERE id_o = 20;

UPDATE obiekty
SET wspolrzedne = '50.03633921235291, 22.01167481047375'
WHERE id_o = 21;

UPDATE obiekty
SET wspolrzedne = '50.03397202696212, 21.993629481637843'
WHERE id_o = 22;

UPDATE obiekty
SET wspolrzedne = '50.02439682896244, 21.996036725816456'
WHERE id_o = 23;

UPDATE obiekty
SET wspolrzedne = '50.05562076253781, 21.996936068146642'
WHERE id_o = 24;

UPDATE obiekty
SET wspolrzedne = '50.03620409507573, 22.00095146999641'
WHERE id_o = 25;

UPDATE obiekty
SET wspolrzedne = '50.03992326855389, 21.99346848163818'
WHERE id_o = 26;

UPDATE obiekty
SET wspolrzedne = '50.06011742642689, 21.982268283490306'
WHERE id_o = 27;

UPDATE obiekty
SET wspolrzedne = '50.040772619841704, 22.01401216629478'
WHERE id_o = 28;



