create table teams (
    team_id int auto_increment primary key
    ,team_name varchar(255) not null
    ,league varchar(100)
);

create table players (
    player_id int auto_increment primary key
    ,team_id int
    ,player_name varchar(255) not null
    ,position varchar(50)
    ,foreign key (team_id) references teams(team_id)
);

create table matches (
    match_id int auto_increment primary key
    ,date date
    ,location varchar(255)
    ,home_team_id int
    ,away_team_id int
    ,foreign key (home_team_id) references teams(team_id)
    ,foreign key (away_team_id) references teams(team_id)
);

create table results (
    match_id int
    ,home_score int
    ,away_score int
    ,winner varchar(50)
    ,foreign key (match_id) references matches(match_id)
);

create table player_stats (
    match_id int
    ,player_id int
    ,minutes_played int
    ,goals int
    ,assists int
    ,shots_off_target int
    ,shots_on_target int
    ,passes int
    ,accurate_passes int
    ,fouls_committed int
    ,fouls_received int
    ,yellow_cards int
    ,red_cards int
    ,foreign key (match_id) references matches(match_id)
    ,foreign key (player_id) references players(player_id)
);

create table match_stats (
    match_id int
    ,team_id int
    ,shots int
    ,shots_on_target int
    ,possession_percentage int
    ,accurate_passes int
    ,offsides int
    ,yellow_cards int
    ,red_cards int
    ,foreign key (match_id) references matches(match_id)
    ,foreign key (team_id) references teams(team_id)
);

alter table players
	add nationality varchar(50);

alter table match_stats 
	add fouls int;
alter table match_stats 
	add corners int;

