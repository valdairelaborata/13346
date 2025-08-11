/*Lista de clientes(Nome, CPF) que residem em Curitiba, 
no bairro Xaxim.
*/

select 
	c.nome,
    c.cpf,
    b.nome
from clientes c
	join endereco e
		on c.id = e.cliente
	join cidades cd
		on cd.id = e.cidade
	join bairros b
		on b.id = e.bairro
where
	  cd.nome = 'Curitiba'
      and b.nome = 'Xaxim'