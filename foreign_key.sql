use prac_mysql;
drop table if exists zoo_fk2,zoo_fk1;
create table zoo_fk1 (
	animal_id_c1 varchar(8) not null,
	animal_c1 varchar(32),
	primary key(animal_id_c1)
);

create table zoo_fk2 (
	animal_id_c2 varchar(8),
	name_c2 varchar(32),
	index key_id ( animal_id_c2),
	foreign key ( animal_id_c2)
	references zoo_fk1 (animal_id_c1) 
	on delete set null
	on update set null
);

insert into zoo_fk1 (animal_id_c1,animal_c1) values('id-1','lion'),('id-2','kirin'),('id-3','kangaru'),('id-4','panda'),('id-5','tiger');
insert into zoo_fk2 (animal_id_c2,name_c2) values('id-1','indea-lion'),('id-2','ame-kirin'),('id-1','senegal-lion'),('id-4','big-panda'),('id-3','red-kangaru');

delete from zoo_fk1 where animal_id_ci='id-1';
//=>これでzoo_fk2のanimal_id_c2のid-1が削除されNULLが挿入される

