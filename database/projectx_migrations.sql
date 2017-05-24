-- 1 up

create table venues(
    id serial not null,
    name character varying(100),
    address text,

    constraint venues_pkey primary key (id)
);

create table conferences(
	id serial not null,
  	name character varying(100),
    venue integer,

    constraint conferences_pkey primary key (id),
    foreign key (venue) references venues (id)
);

create table users(
	id serial not null,
	email character varying(100),
    name character varying(100),
    full_name character varying(100),
    cpan_id character varying(100),

	constraint users_pkey primary key (id)
);

create table talks(
    id serial not null,
    title character varying(100),
    description text,
    conference integer not null,
    speaker integer not null,

    constraint talks_pkey primary key (id),
    foreign key (conference) references conferences (id),
    foreign key (speaker) references users (id)
);

create table conferences_atendees(
    conference integer not null,
    "user" integer not null,

    constraint conferences_atendees_pkey primary key (conference, "user"),
    foreign key (conference) references conferences (id),
    foreign key ("user") references users (id)
);

create table conferences_staff(
    conference integer not null,
    "user" integer not null,

    constraint conferences_staff_pkey primary key (conference, "user"),
    foreign key (conference) references conferences (id),
    foreign key ("user") references users (id)
);

create table conferences_admins(
    conference integer not null,
    "user" integer not null,

    constraint conferences_admins_pkey primary key (conference, "user"),
    foreign key (conference) references conferences (id),
    foreign key ("user") references users (id)
);

create table talks_atendees(
    talk integer not null,
    "user" integer not null,

    constraint talks_atendees_pkey primary key (talk, "user"),
    foreign key (talk) references talks (id),
    foreign key ("user") references users (id)
);

create table schedules(
    id serial not null,

    constraint schedules_pkey primary key (id)
);

create table slots(
    id serial not null,
    schedule integer not null,
    talk integer,

    constraint slots_pkey primary key (id),
    foreign key (schedule) references schedules (id),
    foreign key (talk) references talks (id)
);

create table sponsors(
    id serial not null,
    name character varying(100),

    constraint sponsors_pkey primary key (id)
);

create table conferences_sponsors(
    conference integer not null,
    sponsor integer not null,
    level character varying(50),

    constraint conference_sponsor_pkey primary key (conference, sponsor),
    foreign key (conference) references conferences (id),
    foreign key (sponsor) references sponsors (id)
);

-- 1 down
drop table if exists conferences_sponsors;
drop table if exists sporsors;
drop table if exists venues;
drop table if exists slots;
drop table if exists schedules;
drop table if exists talks_atendees;
drop table if exists conferences_admins;
drop table if exists conferences_staff;
drop table if exists conferences_atendees;
drop table if exists users;
drop table if exists talks;
drop table if exists conferences;
