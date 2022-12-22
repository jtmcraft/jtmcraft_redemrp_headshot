create table if not exists jtmcraft_headshot (
    id int not null auto_increment,
    shooter_first_name varchar(255) not null,
    shooter_last_name varchar(255) not null,
    shooter_x double(11,2) not null,
    shooter_y double(11,2) not null,
    shooter_z double(11,2) not null,
    victim_is_player int not null default 0,
    victim_x double(11,2) not null,
    victim_y double(11,2) not null,
    victim_z double(11,2) not null,
    weapon_hash int not null,
    created_date int(11) not null default unix_timestamp(),
    primary key (id)
) engine=InnoDB default charset=utf8;
