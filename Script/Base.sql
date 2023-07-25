create table Province(
                         idProvince Serial,
                         province VARCHAR(30) PRIMARY KEY
);

insert into Province(province) values ('Tananarive,Antananarivo'),('Diego-Suarez,Antsiranana'),('Fianarantsoa'),('Majunga,Mahajanga'),('Tamatave,Toamasina'),('Tulear,Toliara');

create table Societe(
    idSociete serial PRIMARY KEY,
    nomSociete varchar(50),
    lieu varchar(30),
    contact varchar(100),
    adresse varchar(100),
    mail varchar(100),
    mdp varchar(50)
);
alter table Societe add FOREIGN KEY (lieu) references Province(province);

create table Categorie(
    idCateg serial PRIMARY KEY,
    nomCateg varchar(100)
);

insert into Categorie(nomCateg) values ('directeur general'),('directeurs des finances'),('directeurs des ressources humaines'),
                                       ('directeurs du marketing et des operations'),
                                       ('directeurs de division'),('directeurs des chefs de projet'),
                                       ('directeurs des responsables de service'),
                                       ('directeurs des superviseurs'),('employes des finances'),
                                       ('employes des ressources humaines'),('employes du marketing et des operations'),('employes de division'),
                                       ('employes des projets'),('employes des responsables de service'),('employes superviseurs');

create table PosteSociete(
    idSociete integer,
    idCateg integer
);

alter table PosteSociete add FOREIGN KEY (idSociete) references Societe(idSociete);
alter table PosteSociete add FOREIGN KEY (idCateg) references Categorie(idCateg);

create table IF NOT EXISTS Genre(
    idGenre serial primary key,
    nomGenre varchar(15)
);

INSERT INTO Genre(nomGenre) values ('Homme'),('Femme');

create table Employe(
    idEmp serial PRIMARY KEY,
    nomEmp varchar(50),
    prenom varchar(50),
    dtn date,
    genre integer,
    contact varchar(100),
    adresse varchar(100)
);

alter table Employe add FOREIGN KEY (genre) references Genre(idGenre);

create table CategEmploye(
    idEmploye integer,
    idCategorie integer,
    idSociete integer,
    identifiant varchar(100)
);

alter table CategEmploye add FOREIGN KEY (idEmploye) references Employe(idEmp);
alter table CategEmploye add FOREIGN KEY (idCategorie) references Categorie(idCateg);
alter table CategEmploye add FOREIGN KEY (idSociete) references Societe(idSociete);


create view V_employe as
    select E.*, Ce.* from Employe E
    join CategEmploye CE on E.idEmp = CE.idEmploye;

create view V_Societecateg as
select PosteSociete.idSociete, C2.idCateg  from PosteSociete
join Categorie C2 on PosteSociete.idCateg = C2.idCateg;


create table Discussion(
    idSociete integer,
    idSender integer,
    message text,
    temps timestamp default CURRENT_TIMESTAMP
);

SELECT * FROM Societe WHERE idSociete NOT IN (SELECT idSociete FROM PosteSociete);
SELECT * FROM Employe WHERE idEmp NOT IN (SELECT idEmp FROM CategEmploye);

create view V_Orga as
select e.nomEmp, e.prenom, c.nomCateg, c.idCateg, cate.idSociete, e.idEmp from Employe e
join CategEmploye cate on cate.idEmploye=e.idEmp
join Categorie c on c.idCateg = cate.idCategorie order by c.idCateg;


create table TypeActualite(
    idTypes Serial primary key,
    nomTypes varchar(15)
);

INSERT INTO TypeActualite(nomTypes) values ('Publication'),('Details');

create table Actualite(
    idSociete integer,
    annonce text,
    types int,
    temps timestamp default CURRENT_TIMESTAMP
);
alter table Actualite add FOREIGN KEY (idSociete) references Societe(idSociete);
alter table Actualite add FOREIGN KEY (types) references TypeActualite(idTypes);
