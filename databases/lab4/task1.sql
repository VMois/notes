USE Lab4

create table account (
    id int primary key,
    balance int
);

insert into account values(1, 5000);
insert into account values(2, 8500);
insert into account values(4, 6400);

select * from account;