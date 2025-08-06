

create table clientes(
	id int auto_increment primary key,
    nome varchar(100),
    email varchar(100),
    data_nascimento date
)


insert into clientes (nome, email, data_nascimento)
values
('João Silva', 'joao@gmail.com', '1990-05-15'),
('Maria Santos', 'maria.s@gmail.com', '1985-10-30'),
('Pedro Oliveira', 'pedro.o@gmail.com', '1992-03-22')


select * from clientes

select nome, email from clientes

select * from clientes 
where 
	data_nascimento >= '1991-01-01'


update clientes
set email = 'joao.silva@gmail.com'
where
	nome = 'João Silva'
    
delete from clientes
where nome = 'Pedro Oliveira'
		
    

