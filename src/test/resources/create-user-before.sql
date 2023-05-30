delete from user_role;
delete from users;

ALTER TABLE message AUTO_INCREMENT=1;

insert into users(id, active, password, username) values
(1, true, '$2a$08$qcKVIX3.Gd95ciiAkGyfheFVkeiqtWVmXPM6AOnLwOcKHYD/zbO7m', 'admin'),
(2, true, '$2a$08$qcKVIX3.Gd95ciiAkGyfheFVkeiqtWVmXPM6AOnLwOcKHYD/zbO7m', 'user4');

insert into user_role(user_id, roles) values
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');