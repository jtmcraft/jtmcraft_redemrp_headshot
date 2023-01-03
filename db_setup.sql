create table if not exists jtmcraft_headshot (
    id int not null auto_increment,
    user_identifier varchar(50) not null,
    shooter_first_name varchar(255) not null,
    shooter_last_name varchar(255) not null,
    shooter_x double(11,2) not null,
    shooter_y double(11,2) not null,
    shooter_z double(11,2) not null,
    shooter_speed int not null,
    shooter_is_scoped_in int not null default 0,
    shooter_used_special_ability int not null default 0,
    victim_is_player int not null default 0,
    victim_is_mounted int not null default 0,
    victim_in_vehicle int not null default 0,
    victim_in_cover int not null default 0,
    victim_speed int not null,
    victim_x double(11,2) not null,
    victim_y double(11,2) not null,
    victim_z double(11,2) not null,
    weapon_hash int not null,
    ammo_hash int not null,
    xp int not null default 2,
    xp_bonus int not null default 0,
    distance double(11,2) not null,
    created_date int(11) not null default unix_timestamp(),
    primary key (id)
) engine=InnoDB default charset=utf8;

create table if not exists jtmcraft_ammo (
    id int not null auto_increment,
    ammo_name varchar(255) not null,
    ammo_hash int not null,
    created_date int(11) not null default unix_timestamp(),
    primary key (id)
) engine=InnoDB default charset=utf8;

create table if not exists jtmcraft_weapons (
    id int not null auto_increment,
    weapon_name varchar(255) not null,
    weapon_hash int not null,
    created_date int(11) not null default unix_timestamp(),
    primary key (id)
) engine=InnoDB default charset=utf8;
