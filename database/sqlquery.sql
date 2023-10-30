create database code_snippet;

use code_snippet;

create table if not exists technology (
	id int not null auto_increment,
    name nvarchar(50) not null unique,
    primary key (id)
);
insert into technology (name) values ("Java"), ("Javascript"), ("SQL"), 
									("HTML&CSS"), ("C"), ("Assembly"), ("Practical"),
                                    ("Spring framework"), ("Hibernate framework"), ("Tools");

create table if not exists code_group (
	id int not null auto_increment,
    name nvarchar(50) not null,
    item_count int default 0,
    technology_id int not null,
    primary key (id),
    foreign key (technology_id) references technology(id)
);

create table if not exists code_snippet (
	id int not null auto_increment,
    name nvarchar(50) not null,
    content text,
    syntax nvarchar(10),
    relevant_info text,
    comment text,
    code_group_id int not null,
    primary key (id),
    foreign key (code_group_id) references code_group (id)
);

