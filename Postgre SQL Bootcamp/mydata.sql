create table web_links(
link_id serial primary key,
link_url varchar(200) not null,
link_target varchar(20)
);

insert into web_links(link_url,link_target) values ('www.google.com','_blank')

select * from web_links

alter table web_links
add constraint unique_web_url unique (link_url);

insert into web_links(link_url,link_target) values ('www.amazon.com','_blank')


