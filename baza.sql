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
    rodzaj_aktywnosci varchar(30) CHECK (rodzaj_aktywnosci in ('piłka nożna','siatkówka','koszykówka','tenis','pływanie')),
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
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.2334057192593!2d22.009788774659086!3d50.025722117856674!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfa5767f0162b%3A0x33733a1fa8191faa!2sal.%20Tadeusza%20Rejtana%2030%2C%2035-310%20Rzesz%C3%B3w!5e0!3m2!1spl!2spl!4v1713271429695!5m2!1spl!2spl'
WHERE id_o = 2;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3047.0195617406425!2d21.973096108829566!3d50.04456331022987!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb731395d07d%3A0xcdaaf38396221070!2sP%C5%82ywalnia%20kryta%20Karpik!5e0!3m2!1spl!2spl!4v1713271494668!5m2!1spl!2spl'
WHERE id_o = 3;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.4046453622495!2d21.979661174662127!3d50.05998311540386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb43d354b0cd%3A0x906625fda18a73ba!2sStefana%20Starzy%C5%84skiego%2017%2C%2035-508%20Rzesz%C3%B3w!5e0!3m2!1spl!2spl!4v1713271536892!5m2!1spl!2spl'
WHERE id_o = 4;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.769705970819!2d21.9753840746581!3d50.01567151857599!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbb61f796a01%3A0xb95bbeabb34b9389!2sAdama%20Matuszczaka%209%2C%2035-083%20Rzesz%C3%B3w!5e0!3m2!1spl!2spl!4v1713271587308!5m2!1spl!2spl'
WHERE id_o = 5;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.456043984955!2d21.97804867465867!3d50.02154991815529!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbb11de20cbf%3A0x6788b0cf0a7301ac!2sGenera%C5%82a%20Jaros%C5%82awa%20D%C4%85browskiego%2082%2C%2035-036%20Rzesz%C3%B3w!5e0!3m2!1spl!2spl!4v1713271828188!5m2!1spl!2spl'
WHERE id_o = 6;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.3076500252705!2d21.997024099999994!3d50.061799799999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb3902d537d3%3A0xa37a68f0010fe398!2sSkrajna%201%2C%2035-231%20Rzesz%C3%B3w!5e0!3m2!1spl!2spl!4v1713271926124!5m2!1spl!2spl'
WHERE id_o = 7;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2561.4046453622495!2d21.979661174662134!3d50.05998311540386!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb43ae5ca9cb%3A0x7e3e8cb160e96600!2sKompleks%20Sportowy%20Orlik%202012!5e0!3m2!1spl!2spl!4v1713271988295!5m2!1spl!2spl'
WHERE id_o = 8;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.2670035058513!2d22.044413574658964!3d50.02509251790174!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfa87b182e3ef%3A0x6e3054593cedd3a2!2sOrlik%202012!5e0!3m2!1spl!2spl!4v1713272042703!5m2!1spl!2spl'
WHERE id_o = 9;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2566.2442734145475!2d21.98510977465389!3d49.969277421894965!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cf9c1d20a0e87%3A0xba4bdac6b0e2e010!2sOrlik%202012!5e0!3m2!1spl!2spl!4v1713272195192!5m2!1spl!2spl'
WHERE id_o = 10;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2562.5373827292606!2d21.990326274660198!3d50.03876381692321!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb05d7542859%3A0x921bc4e834df2690!2sHala%20sportowa%20ROSIR!5e0!3m2!1spl!2spl!4v1713272333712!5m2!1spl!2spl'
WHERE id_o = 11;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.447583905278!2d21.97776972492112!3d50.021708463131056!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbb0fee21917%3A0x2691929dca2f7458!2sZesp%C3%B3%C5%82%20Szkolno-Przedszkolny%20Nr%208!5e0!3m2!1spl!2spl!4v1713272255910!5m2!1spl!2spl'
WHERE id_o = 12;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.377757676773!2d21.991632174658818!3d50.02301701805031!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbad4d30238f%3A0x60d94c187e64cbd4!2zNSBMbyBPZ8OzbG5va3N6dGHFgmPEhWNl!5e0!3m2!1spl!2spl!4v1713272374729!5m2!1spl!2spl'
WHERE id_o = 13;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2563.6473850614375!2d21.990359874658367!3d50.01796401841185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfa4c770134f7%3A0x5263b5bb18f1d1c1!2zWmVzcMOzxYIgU3prw7PFgiBFbGVrdHJvbmljem55Y2ggdyBSemVzem93aWU!5e0!3m2!1spl!2spl!4v1713272439167!5m2!1spl!2spl'
WHERE id_o = 14;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d694.4985234392143!2d21.977576387594173!3d50.033829278241306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfba72c40d70b%3A0xeb2c38dfee90c61a!2sBohater%C3%B3w%2026%2C%2035-112%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272500584!5m2!1spl!2spl'
WHERE id_o = 15;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.6046262220846!2d21.98424367466032!3d50.03965901685907!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb092842f5fd%3A0xe9e864c18e453e45!2sStanis%C5%82awa%20Wyspia%C5%84skiego%2016A%2C%2035-111%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272562056!5m2!1spl!2spl'
WHERE id_o = 16;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1652.0792020046936!2d22.00781367465908!3d50.0258625178466!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfa573c58d10d%3A0xae800492b7f13807!2sal.%20Tadeusza%20Rejtana%2030%2C%2035-310%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272627285!5m2!1spl!2spl'
WHERE id_o = 17;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.5576639318258!2d21.992056174660476!3d50.04102411676129!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb05a1f6dedf%3A0x83190ef0b6806a6b!2zS3NpxJlkemEgSsOzemVmYSBKYcWCb3dlZ28gMjIsIDM1LTAxMCBSemVzesOzdw!5e1!3m2!1spl!2spl!4v1713272691890!5m2!1spl!2spl'
WHERE id_o = 18;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1652.4368360257813!2d21.975188774658132!3d50.01546381859087!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbb61a4c805d%3A0x2ec3c3fd8dfed769!2sAdama%20Matuszczaka%207%2C%2035-083%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272737686!5m2!1spl!2spl'
WHERE id_o = 19;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.52251126485!2d21.99250007466051!3d50.04204591668818!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb056d2decf1%3A0x245b158dca1c0887!2sAmbro%C5%BCego%20Towarnickiego%204%2C%2035-010%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272778441!5m2!1spl!2spl'
WHERE id_o = 20;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1652.1982497196702!2d21.978208774658764!3d50.02240121809438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfbb0ffadad8f%3A0x7d901956709fe5d1!2sGenera%C5%82a%20Jaros%C5%82awa%20D%C4%85browskiego%2066%20A%2C%2035-036%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272823309!5m2!1spl!2spl'
WHERE id_o = 21;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.7525662721025!2d22.009105974659903!3d50.035358517167005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfafc1d3089bf%3A0x9381d6b9938a4433!2sSpytka%20Lig%C4%99zy%2012%2C%2035-065%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272922518!5m2!1spl!2spl'
WHERE id_o = 22;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.8041719570879!2d21.991097474659764!3d50.03385831727432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb075adb7981%3A0xc3d8b8b0595d7615!2sKlementyny%20Hoffmanowej%2013%2C%2035-016%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713272982807!5m2!1spl!2spl'
WHERE id_o = 23;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1652.1342364838245!2d21.99345107465896!3d50.024262417961154!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfa52d1d95d81%3A0xf8ce95c3bc28895a!2sHetma%C5%84ska%2045A%2C%2035-078%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713273020341!5m2!1spl!2spl'
WHERE id_o = 24;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1651.0595981873446!2d21.994371874661756!3d50.05550021572492!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb3de6121a85%3A0x8316bb38c2397db!2sWarszawska%2026A%2C%2035-205%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713273055645!5m2!1spl!2spl'
WHERE id_o = 25;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d567.3531498341587!2d22.000049844203968!3d50.03575796683803!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb01a2154fef%3A0xa354e1e85e5d3fda!2s1%20Liceum%20Og%C3%B3lnokszta%C5%82c%C4%85ce%20w%20Rzeszowie!5e1!3m2!1spl!2spl!4v1713273199049!5m2!1spl!2spl'
WHERE id_o = 26;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3149.714438458795!2d21.990931112648628!3d50.03984747139798!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb05c21c54d1%3A0xdecdb9393e25af7!2zS3NpxJlkemEgSsOzemVmYSBKYcWCb3dlZ28gMjNBLCAzNS0wMTAgUnplc3rDs3c!5e1!3m2!1spl!2spl!4v1713635402451!5m2!1spl!2spl'
WHERE id_o = 27;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3148.3934359407303!2d21.97965581264958!3d50.05997967140153!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfb43d354b0cd%3A0x906625fda18a73ba!2sStefana%20Starzy%C5%84skiego%2017%2C%2035-508%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713635438592!5m2!1spl!2spl'
WHERE id_o = 28;

UPDATE obiekty
SET link = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3149.66097520386!2d22.011517712648587!3d50.04066237139805!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x473cfae331cc9937%3A0xbeeeb637bc6fc27e!2sElizy%20Orzeszkowej%208A%2C%2035-006%20Rzesz%C3%B3w!5e1!3m2!1spl!2spl!4v1713635250293!5m2!1spl!2spl'
WHERE id_o = 29;
