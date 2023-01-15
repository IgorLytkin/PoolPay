create table poolpay.visitor
(
    id         integer generated always as identity
        constraint visitor_pk
            primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    patronymic varchar(50) not null,
    phone      varchar(10)
);

comment on table poolpay.visitor is 'Посетитель';

comment on column poolpay.visitor.id is 'Идентификатор';

comment on column poolpay.visitor.first_name is 'Имя';

comment on column poolpay.visitor.last_name is 'Фамилия';

comment on column poolpay.visitor.patronymic is 'Отчество';

comment on column poolpay.visitor.phone is 'Номер телефона';

alter table poolpay.visitor
    owner to poolpay;

