

create table produtos (
	id int auto_increment primary key,
    nome varchar(100),
    preco decimal(10,2),
    quantidade int
)

INSERT INTO `ecommerce`.`produtos`
(`nome`,
`preco`,
`quantidade`)
VALUES
('Mouse', 25.00 , 10 ),('Teclado', 80.00 , 1 ),('Monitor', 345.50 , 2 )

SELECT `produtos`.`id`,
    `produtos`.`nome`,
    `produtos`.`preco`,
    `produtos`.`quantidade`
FROM `ecommerce`.`produtos`;


update produtos
set preco = preco * 1.10
where
	nome = 'Teclado'


delete from produtos 
where
	quantidade = 2
