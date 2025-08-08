/*
Liste os nomes dos clientes e a soma total dos seus pedidos.
 Clientes sem pedidos devem aparecer com valor nulo.
*/


select 
	c.nome,
    sum(p.valor_total)
	from clientes c
		left join pedidos p
			on c.id = p.cliente
group by 
	c.nome
    
    