delete from message;
delete from hibernate_sequence;

ALTER TABLE message AUTO_INCREMENT=1;

insert into message(id, text, tag, user_id) values
(2, 'first', 'my-tag', 1),
(3, 'second', 'more', 1),
(4, 'third', 'my-tag', 1),
(5, 'fourth', 'another', 1);

insert into hibernate_sequence values (11);