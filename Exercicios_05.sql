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
      
      
/*Quantidade de Clientes que residem no Paraná.*/
select 
		count(*) qtd_clientes_pr
	from clientes c	
		join endereco e
			on e.cliente = c.id
		join cidades cd
			on cd.id = e.cidade
		join estados et
			on et.id = cd.estado

		where
			et.nome = 'Paraná'
      
      
/*Lista de produtos ordenado pelo Nome de A - Z.*/

select 
	p.id,
    p.nome,
    p.preco,    
    p.quantidade
	from produtos p
order by p.nome asc
    

/*Listagem de Pedidos do Cliente João da Silva.*/

select 
	p.id,
    p.data,
    p.valor_total
	from pedidos p
		join clientes c
			on c.id = p.cliente
	where
		c.nome = 'João Silva'

/*Qual o pedido com mais itens e quais os itens vendidos nele?*/

select 
	p.id id_pedido,
    count(*) itens
	from pedidos p
		join item_pedido ip
			on ip.pedido = p.id
	group by p.id
    order by itens desc
    limit 1
    
    select 
		p.nome        
		from item_pedido ip
			join produtos p
				on p.id = ip.produto
	where
		ip.pedido = 1
		
/*Qual o valor total vendido no dia 06/04/2023?*/

select 
	p.data,    
	sum(i.quantidade * i.valor_unitario) valor_total
	from item_pedido i
		join pedidos p
			on p.id = i.pedido
     where
     p.data = '2023-04-06'	
    group by 
     p.data 
    
/*Qual o produto mais vendido no dia 06/04/2023?*/


select 
	p.data,
	i.produto,
    pd.nome,
    sum(i.quantidade) quantidade_vendida
	from pedidos p
		join item_pedido i
			on i.pedido = p.id
		join produtos pd
			on pd.id = i.produto
	where
		p.data =  '2023-04-06'	
    group by
		p.data, 
        i.produto ,
		pd.nome
    order by quantidade_vendida desc
    limit 1



/* Qual o valor médio dos pedidos feitos pelo Cliente João Silva?*/

select 
	p.id,	
    sum(i.quantidade * i.valor_unitario) /  count(*) valor_medio
	from pedidos p
		join item_pedido i
			on i.pedido = p.id
		join clientes c
			on c.id = p.cliente
	  where
		c.nome = 'João Silva'
	group by 
		p.id
    

/* Quais clientes nunca compraram?*/    

select 
	c.nome
from clientes c
	left join pedidos p
		on p.cliente = c.id
        
where
	p.cliente is null
    
    
select 
	c.nome
	from clientes c
    where
		c.id not in (			
            select p.cliente
            from pedidos p
        )


/*Quais produtos nunca foram vendidos?*/

select 
	p.nome
	from produtos p
		left join item_pedido i
			on p.id = i.produto
	where
		i.produto is null

select 
	p.nome
	from produtos p    
    where
		p.id not in (
			select i.produto
				from item_pedido i
        )
    


