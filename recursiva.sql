CREATE DATABASE recursiva;

use recursiva;

CREATE TABLE teatro(
    id_teatro int auto_increment,
    nombre varchar(50) not null,
    anio year not null,
    salas int not null,
    primary key (id_teatro)
);

CREATE TABLE sala(
    id_sala int auto_increment,
    nombre varchar(50) not null,
    capacidad int not null,
    microfono BOOLEAN,
    maquina_humo BOOLEAN,
    fk_teatro int,
    primary key (id_sala),
    foreign key (fk_teatro) references teatro (id_teatro)
);

create table cartelera(
    id_cartelera int auto_increment,
    fk_sala int,
    fecha date not null,
    primary key(id_cartelera),
    foreign key(fk_sala) references sala(id_sala)
);



create table espectaculo(
    id_espectaculo int auto_increment,
    fk_cartelera int,
    nombre varchar(50),
    director varchar(50),
    descripcion varchar(100),
    primary key(id_espectaculo),
    foreign key (fk_cartelera) references cartelera(id_cartelera)
);

create table funcion(
    id_funcion int auto_increment,
    programacion BOOLEAN,
    fk_sala int not null,
    fk_espectaculo int not null,
    reservadas int not null,
    vendidas int not null,
    espectadores int not null,
    primary key(id_funcion),
    foreign key(fk_sala) references sala (id_sala), 
    foreign key(fk_espectaculo) references espectaculo (id_espectaculo)
);

insert into teatro(nombre,anio,salas) values 
("colon",'1970',1),
("ambasador",'2000',3),
("roxy",'2002',2),
("ramdon",'2019',3),
("teatrix",'1995',1);

insert into sala(nombre,capacidad,microfono,maquina_humo,fk_teatro) values
("san martin",100,true,true,1),
("san miguel",50,true,true,2),
("san ignacio",100,false,false,2),
("rio de la plata",70,false,true,2),
("sara",50,true,false,3),
("connor",50,true,true,3),
("artistica",10,false,false,4),
("artistica 2",15,true,true,4),
("artistica 3",20,true,false,4),
("san cayetano",200,true,true,5);

insert into cartelera(fk_sala,fecha) values 
(1,"2019-01-23"),
(2,"2019-04-02"),
(3,"2019-01-05"),
(4,"2019-03-30"),
(4,"2019-01-09"),
(6,"2019-12-12"),
(7,"2019-12-04"),
(3,"2019-11-29"),
(2,"2019-10-22"),
(1,"2019-06-02"),
(8,"2019-08-20");

insert into espectaculo(fk_cartelera,nombre,director,descripcion) values
(1,"circo du soleil","gustavo","espectaculo de circo"),
(2,"daddy yanque","daddy","espectaculo de musica"),
(3,"obra de teatro","ezequiel","obra de teatro amateur"),
(4,"infragantti","roberto","obra de teatro comica"),
(5,"charla","silvina","charla sobre actualidad"),
(6,"Concierto","j balvin","concierto de j balvin"),
(7,"torneo cs","mauricia","torneo fps"),
(8,"opera para todos","romeo","espectaculo de opera");

insert into funcion(programacion,fk_sala,fk_espectaculo,reservadas,vendidas,espectadores) values
(false,1,1,50,50,100),
(false,2,6,50,50,45),
(true,3,3,20,50,0),
(true,4,7,50,50,0),
(false,5,2,70,50,29),
(false,7,1,5,50,15),
(true,6,5,6,50,0),
(false,8,8,1,50,50);



select e.nombre,e.director,c.fecha from espectaculo as e inner join cartelera as c on e.fk_cartelera=c.id_cartelera order by c.fecha desc;

select e.nombre,f.espectadores from espectaculo as e inner join funcion as f on e.id_espectaculo=f.fk_espectaculo where programacion is false;

select e.nombre,f.reservadas,f.vendidas from espectaculo as e inner join funcion as f on e.id_espectaculo=f.fk_espectaculo where programacion is false and f.reservadas>f.vendidas;


