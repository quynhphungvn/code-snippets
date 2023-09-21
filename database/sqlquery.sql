create database code_snippet;

use code_snippet;

create table if not exists snippet_group (
	id int not null auto_increment,
    name varchar(50),
    primary key (id)
);

create table if not exists frontend_snippet (
	id int not null auto_increment,
    name varchar(50),
    description tinytext,
    html_content text,
    css_content text,
    js_content text,
    comment text,
    snippet_group_id int,
    primary key (id),
    foreign key (snippet_group_id) references snippet_group (id)
);
