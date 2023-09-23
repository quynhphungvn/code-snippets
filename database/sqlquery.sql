create database code_snippet;

use code_snippet;

create table if not exists tech_subject (
	id int not null auto_increment,
    name varchar(50) not null,
    primary key (id)
);
insert into tech_subject (name) values ("java"),("frontend"),("c");

create table if not exists code_group (
	id int not null auto_increment,
    name varchar(50) not null,
    item_count int default 0,
    tech_subject_id int not null,
    primary key (id),
    foreign key (tech_subject_id) references tech_subject(id)
);
insert into code_group (name, tech_subject_id) values ("Button", 2), ("Dropdown", 2), ("Heading", 2), ("Form", 2);

create table if not exists frontend_code (
	id int not null auto_increment,
    name varchar(50) not null,
    description tinytext,
    html_content text,
    css_content text,
    js_content text,
    comment text,
    code_group_id int not null,
    primary key (id),
    foreign key (code_group_id) references code_group (id)
);

insert into frontend_code (name, description, html_content, css_content, js_content, comment, code_group_id) values
("button blue", "a button with color blue", "<button class=\"button-blue\">Blue</button>", ".button-blue", "js-conent", "comment: nothing", 1),
("button yellow", "a button with color yellow", "<button class=\"button-yello\">Yellow</button>", ".button-blue", "js-conent", "comment: nothing", 1),
("button cyan", "a button with color cyan", "<button class=\"button-cyan\">Cyan</button>", ".button-blue", "js-conent", "comment: nothing", 1);
