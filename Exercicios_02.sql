

/*Liste os nomes dos clientes e a data de seus pedidos*/
/*
select 
		c.nome,
        p.data
	from clientes c
		inner join pedidos p
			on c.id = p.cliente
    */
    
/*Liste todos os pedidos com os dados do cliente que os realizou (nome e email).*/

	select 
		p.id 'Id do pedido',   
        c.nome,
        c.email
    from pedidos p
		inner join clientes c
			on p.cliente = c.id
    