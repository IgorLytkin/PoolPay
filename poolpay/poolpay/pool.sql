create table poolpay.pool
(
    id               integer generated always as identity,
    name             varchar(50) not null,
    number_of_tracks integer     not null,
    track_length     integer     not null,
    bank_details     varchar     not null
);

comment on column poolpay.pool.id is 'Идентификатор';

comment on column poolpay.pool.name is 'Название бассейна';

comment on column poolpay.pool.number_of_tracks is 'Количество дорожек';

comment on column poolpay.pool.track_length is 'Длина дорожки в метрах';

alter table poolpay.pool
    owner to poolpay;

