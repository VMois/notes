USE Lab4

create table exam ( 
    id int primary key,
    subject varchar(20),
    date datetime,
    limit int
);

create table signup(
    examid int references exam(id),
    studentid int,
    primary key (examid,studentid)
);

insert into exam 
values(1, 'Informatics2',convert(datetime,'2007.06.15',102),3);
insert into exam
values(2, 'Mathematics',convert(datetime,'2007.06.18',102),3);
insert into signup values(1,111);
insert into signup values(1,222);
select * from exam;