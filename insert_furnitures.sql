insert into Department
values 
('F1', 'Tables', 'Tables: Big tables, small tables', 'Many tables', NULL, '2'),
('FT1', 'Living Room Tables', 'Living room tables: sdfasdfas', 'Many living room tables', NULL, 'F1'),
('FT2', 'Outdoor Tables', 'Outdoor tables: sdfasdfas', 'Many outdoor tables', NULL, 'F1'),
('F2', 'Chairs', 'Chairs: Big chairs, small chairs', 'Many chairs', NULL, '2');

insert into Product
values 
('T1', 'Fantastic dining table', 'Size: 10m * 10m. Quality: Great!!!', 'It is fantastic', 0.25, 10, 0, 99999, 'FT1'),
('T2', 'Small dining table', 'Size: 0.1m * 0.1m. Quality: Great!!!', 'It is small', 0.25, 100, 0, 9.9, 'FT1'),
('T3', 'Garden wood table', 'Size: 1.5m * 3m. Quality: Great!!!', 'Best for your garden!', 0.25, 100, 0, 999, 'FT2'),
('T4', 'Beach plastic table', 'Size: 1.5m * 3m. Quality: Great!!!', 'Best for beaches!', 0.25, 100, 0, 666, 'FT2'),
('C1', 'Gaming char', 'Quality: Great!!! Quality: Great!!! Quality: Great!!!', 'Best for gaming!', 0.25, 96, 0.2, 888, 'F2'),
('C2', 'Dining char', 'Quality: Great!!! Quality: Great!!! Quality: Great!!!', 'A boring dining char!', 0.25, 308, 0.1, 444, 'F2');

insert into Keyword
values
('lame'), ('fantistic'),('10/10'), ('table'),('chair'),('small'),('big');

insert into Keyword
values
('gaming');

delete from Keyword where (Keyword='fantistic');

insert into Keyword
values
('fantastic');

insert into Keyword
values
('wood');

insert into Keyword
values
('beach');

insert into Contains
values
('gaming', 'C1'),
('chair', 'C1'),
('10/10', 'C1');

insert into Contains
values
('lame', 'C2'),
('chair', 'C2');

insert into Contains
values
('fantastic', 'T1'),
('table', 'T1'),
('big', 'T1'),
('10/10', 'T1');

insert into Contains
values
('fantastic', 'T2'),
('small', 'T2'),
('10/10', 'T2');

insert into Contains
values
('fantastic', 'T3'),
('wood', 'T3'),
('10/10', 'T3');

insert into Contains
values
('beach', 'T4');
