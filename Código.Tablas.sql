create table Usuarios (
	id serial,
	email varchar,
	nombre varchar,
	apellido varchar,
	rol varchar
	);
insert into Usuarios (id, email, nombre, apellido, rol) values (1,'a@gmail.com', 'Pedro','Rosales', 'admin');
insert into Usuarios (id, email, nombre, apellido, rol) values (2, 'b@gmail.com', 'Juana','Tapia', 'invitado');
insert into Usuarios (id, email, nombre, apellido, rol) values (3, 'c@gmail.com', 'Diego','Aguilar', ' invitado');
insert into Usuarios (id, email, nombre, apellido, rol) values (4, 'd@gmail.com', 'Maria','Gonzalez', ' invitado');
insert into Usuarios (id, email, nombre, apellido, rol) values (5, 'e@gmail.com', 'Alejandro','Vega', ' invitado');

	select * from Usuarios 

create table Posts (
	id serial,
	título varchar,
	contenido text,
	fecha_creacion timestamp,
	fecha_actualizacion timestamp,
	destacado boolean,
	usuario_id bigint
	);
insert into Posts (título, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('bienestar mental laboral', 'salud mental de empresas', '2023-10-14 15:33:38.673922-03', '2023-10-20 19:40:08.673922-03', TRUE, 1); 
insert into Posts (título, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('nasa', 'sismos en marte', '2023-10-15 09:00:00.673922-03', '2023-10-22 12:33:01.673922-03', TRUE, 1); 
insert into Posts (título, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('viajar solo', 'autoconocimiento y autoestima', '2023-10-03 22:33:28.673922-03', '2023-10-22 11:04:57.673922-03', FALSE, 4); 
insert into Posts (título, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('ataques al metro', 'fiscalia condeno a catorce personas', '2023-10-07 15:54:37.673922-03', '2023-10-19 22:44:07.673922-03', TRUE, 3); 
insert into Posts (título, contenido, fecha_creacion, fecha_actualizacion, destacado, usuario_id) values ('rendiciones servel', 'candidatos contrataron a familiares', '2023-10-17 02:51:03.673922-03', '2023-10-21 16:00:27.673922-03', TRUE, null);

	select * from Posts

create table Comentarios (
	id serial,
	contenido text,
	fecha_creacion timestamp,
	usuario_id bigint,
	post_id bigint
	);

insert into Comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('era absolutamente necesario', '2023-10-15 12:04:18.673922-03', 1 , 1);
insert into Comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('que interesante', '2023-10-15 22:18:03.673922-03', 2, 1);
insert into Comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('no veo para que', '2023-10-04 15:00:43.673922-03', 3, 1);
insert into Comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('me produce miedo', '2023-10-07 17:19:03.673922-03', 1, 2);
insert into Comentarios (contenido, fecha_creacion, usuario_id, post_id) values ('como pueden saber eso', '2023-10-18 07:05:52.673922-03', 2, 2);

	select * from Comentarios 

