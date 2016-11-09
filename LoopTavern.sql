drop table ltuser cascade;--Done
drop table basketball_team_runned cascade;--Done
drop table searches cascade;--Done
drop table comment_written_about cascade;
drop table game cascade;--Done
drop table plays cascade;--done
drop table championship_achieved cascade;--Done
drop table player cascade;--Done
drop table position_composes_participates cascade;--Done
drop table manager_has cascade; --Done
drop table company cascade;  --Done

create table ltuser(--Done
userid int,
username varchar(50),
password varchar(100),
gender char(2),
emailaddress varchar(100),
age int,
primary key (userid),
check(age>0 and (gender='f' or gender='m')));

create table basketball_team_runned(--done
teamid int,
coach varchar(255),
mascot varchar(100),
languageregion varchar(100),
location_city varchar(100),
name varchar(255),
found_date date,
web varchar(255),
managerid int not null,
payment int,
primary key (teamid),
foreign key (managerid) references manager_has on delete no action,
check(found_date>'1891-12-21' and payment>0));

create table searches(--Done
userid int,
teamid int,
searchtime timestamp,
primary key (userid, teamid, searchtime),
foreign key (userid) references ltuser,
foreign key (teamid) references basketball_team_runned
);

create table game(--Done
gameid int,
place varchar(255),
gametime timestamp,
primary key(gameid)
);

create table comment_written_about(        
userid int not null,
gameid int not null,
commentid int,
commenttime timestamp,
content varchar(10000),
rate int,
primary key (commentid),
foreign key (userid) references ltuser on delete no action,
foreign key (gameid) references game on delete no action,
check(rate=1 or rate=2 or rate=3 or rate=4 or rate=5 or rate=6 or rate=7 or rate=8 or rate=9 or rate=10));

create table plays(--Done
gameid int, 
teamid int, 
score int,
primary key (teamid, gameid),
foreign key (teamid) references basketball_team_runned,
foreign key (gameid) references game,
check(score>=0));

create table championship_achieved(--Done
title varchar(255),
presenter varchar(100),
teamid int not null,
primary key (title),
foreign key (teamid) references basketball_team_runned on delete no action
);

create table player (--Done
playerid int,
birthdate date,
playername varchar(100),
nationality varchar(100),
height real,
weight real,
shootaccuracy int,
primary key (playerid),
check(shootaccuracy < 100 and shootaccuracy >0 and height>0 and weight>0 and birthdate >='1960-01-01'and (current_date-birthdate>=18*365)));

create table position_composes_participates(--Done
teamid int,
positionname varchar(50),
job varchar(255),
playerid int not null, 
primary key (teamid, positionname),
foreign key (teamid) references basketball_team_runned on delete cascade,
foreign key (playerid) references player on delete no action
);

create table company (--Done
companyid int, 
companyname varchar(100),
address varchar(255),
website varchar(255),
primary key (companyid)
);

create table manager_has(--done
managerid int,
name varchar(100), 
age int,
dateofbirth date,
companyid int not null,
primary key (managerid),
foreign key (companyid) references company on delete no action,
check(age>0 and (current_date-dateofbirth>=18*365)));
