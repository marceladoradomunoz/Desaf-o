
+++++++++++++++++++++++++++++ DESAFÍO3_MARCELA_MUÑOZ_131 ++++++++++++++++++++++++++++++++++++++++++++


1. Crea y agrega al entregable las consultas para completar el setup de acuerdo a lo
pedido.

	select * from Usuarios;

	select * from Posts;

	select * from Comentarios;

2. Cruza los datos de la tabla usuarios y posts, mostrando las siguientes columnas:
nombre y email del usuario junto al título y contenido del post.

select u.nombre, u.email, p.título, p.contenido
from Usuarios as u
inner join Posts as p
on u.id = p.usuario_id;

select u.nombre, u.email, p.título, p.contenido
from Usuarios as u
right join Posts as p
on u.id = p.usuario_id;

NOTA: Ingreso dos formas dado que no me queda claro si deben o no figurar los campos null, toda vez que si bien
se desconoce el usuario, existe en la tabla título y contenido. 

3. Muestra el id, título y contenido de los posts de los administradores.
a. El administrador puede ser cualquier id.

select p.usuario_id, p.título, p.contenido
from Posts p
inner join Usuarios u
on p.usuario_id = u.id
where rol = 'admin';

4. Cuenta la cantidad de posts de cada usuario.
a. La tabla resultante debe mostrar el id e email del usuario junto con la
cantidad de posts de cada usuario.

select p.usuario_id, u.email, count(u.id) as cant_posts
from Posts p
left join Usuarios u
on u.id = p.usuario_id
group by u.id, u.email, p.usuario_id
order by u.id;

5. Muestra el email del usuario que ha creado más posts.
a. Aquí la tabla resultante tiene un único registro y muestra solo el email.

select u.email, count(p.usuario_id) as maximo_posts
from Usuarios u
join Posts p  
on u.id = p.usuario_id	
group by u.email 
having max(p.usuario_id) < 2 

select u.email, count(p.usuario_id) as maximo_posts
from Usuarios u
join Posts p  
on u.id = p.usuario_id	
group by u.email
order by maximo_posts desc
limit 1

NOTA: La acompaño de las dos formas dado que se nos solicita le uso de la sentencia HAVING, sin embargo no me
funcionó en mi computadora con otro simbología, y agregué la posibilidad de que me arroje más resultados pero 
limitando, bajo la hipótesis de que se ingresen más registros en la tabla, en cuyo caso la primera sintáxis
arrojaría más resultados si aumentan los valores. Lamentablemente, no me quedó muy clara la sintáxis.

6. Muestra la fecha del último post de cada usuario.
Hint: Utiliza la función de agregado MAX sobre la fecha de creación.

select u.id, u.nombre, u.apellido, max(p.fecha_creacion) as ultimo_post
from Usuarios u
inner join Posts p
on u.id = p.usuario_id
group by u.id, u.nombre, u.apellido
order by ultimo_post desc

7. Muestra el título y contenido del post (artículo) con más comentarios.

select posts.id as post_id, posts.título, posts.contenido, count(comentarios.id) as cantidad_comentarios
from posts 
inner join comentarios on posts.id = comentarios.post_id
group by posts.id, posts.título, posts.contenido
order by cantidad_comentarios desc limit 1


select posts.título, posts.contenido, count(comentarios.id) as cantidad_comentarios
from posts 
inner join comentarios on posts.id = comentarios.post_id
group by posts.título, posts.contenido
having count(comentarios.id) = 3

NOTA: Me ocurrió lo mismo que en la query 5, por ende preferí realizarlo de dos formas diferentes.

8. Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
de cada comentario asociado a los posts mostrados, junto con el email del usuario
que lo escribió.

select posts.título as título_post, posts.contenido as contenido_posts, comentarios.contenido as contenido_comentario, usuarios.email as email
from comentarios 
right join posts on posts.id = comentarios.post_id
inner join usuarios on usuarios.id = posts.usuario_id

9. Muestra el contenido del último comentario de cada usuario.

select comentarios.contenido, t2.fecha_mas_reciente, t2.email 
from     (select t.fecha_mas_reciente, usuarios.email, usuarios.id
			from (select comentarios.usuario_id, max(comentarios.fecha_creacion) as fecha_mas_reciente
			from comentarios
			group by comentarios.usuario_id) as t inner join usuarios on t.usuario_id = usuarios.id     
		 ) as t2 inner join comentarios on t2.id = comentarios.usuario_id 
		 where t2.fecha_mas_reciente = comentarios.fecha_creacion	
		 
10. Muestra los emails de los usuarios que no han escrito ningún comentario.

select u.id, u.emaiL, c.contenido, c.usuario_id
from Usuarios as u 
left join Comentarios as c
on u.id = c.usuario_id
where c.contenido is null	
order by u.id asc		




