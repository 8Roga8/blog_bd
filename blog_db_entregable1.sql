----- table users -----

create table users (
	id serial primary key,
	firstname varchar(30),
	lastname varchar(30),
	email varchar(40)
);

insert into users (firstname, lastname, email) values
('Rodrigo', 'Meza', 'rodrigo11@hotmail.com'), --id 1
('Amelia', ' Bolivar', 'boLIvar@hotmail.com'), --id 2
('Cristian', 'Barreto', 'Cristia_z@hotmail.com'); --id 3

select * from users;


----- table posts -----

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(40),
	comment text
);

insert into posts (creator_id, title, comment) values
(1, 'Increibles enses', 'Wow impresionante como quedo la cancion del team loked'), --id 1
(2, 'Pregunta', '¿donde se indican los patrones? no los encuentro'), --id 2
(1, 'Sorteo', 'ligando la suerte para ganar esa switch'), --id 3
(3, 'El bingo', 'hoy no tuve suerte, para la proxima se gana'), --id 4
(3, 'Cartones', 'aunque jugue 5 cartones y ni estuve cerca'); --id 5

select * from posts;

-- inner join -- user -- post --

select
U.firstname, U.lastname,
P.creator_id, P.title, P.comment 
from users U inner join posts P
on U.id = P.creator_id; 


----- table likes -----

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);
 
insert into likes ( user_id, post_id) values
(1, 4),
(3, 3),
(1, 5),
(2, 1),
(2, 4);

select * from likes;

-- inner join -- users -- likes -- posts --

select
L.user_id, U.firstname, U.lastname, 
L.post_id, P.title, P.comment
from users U inner join likes L
on U.id = L.user_id inner join posts P
on P.id = L.post_id;









