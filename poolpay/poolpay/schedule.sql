create table poolpay.schedule
(
    id         serial
        constraint schedule_pk
            primary key,
    start_time char(5) not null,
    end_time   char(5) not null,
    track      integer not null,
    visitor_id integer not null
        constraint visitor_fk
            references poolpay.visitor
);

comment on table poolpay.schedule is 'Расписание занятий';

comment on column poolpay.schedule.start_time is 'Время начала занятия';

comment on column poolpay.schedule.end_time is 'Время конца занятия';

alter table poolpay.schedule
    owner to postgres;

