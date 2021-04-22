create table trademarks (
    id serial primary key,
    name varchar(500)
);

create table models (
    id serial primary key,
    name varchar(500),
    trademark_id int references trademarks(id)
);

insert into trademarks (name) values ('Toyota'), ('VAZ'), ('BMW');

insert into models (name, trademark_id)
values
('LandCruiserPrado', 1),('LandCruiser 200', 1),('Corolla', 1),('Camry', 1),('Highlander', 1),
('2101', 2),('2107', 2),('2109', 2),('Priora', 2),('Vesta', 2),
('X1', 3),('X2', 3),('X5', 3),('3 series', 3),('5 series', 3);



