USE ecommerce;

desc Cliente;
insert into Cliente (Nome_completo, CPF, Endereco) 
	   values('Maria M Silva', 12346789, 'rua silva de prata 29, Carangola'),
		     ('Matheus O Pimentel', 987654321,'rua alemeda 289, Centro'),
			 ('Ricardo F Silva', 45678913,'avenida alemeda vinha 1009, Centro'),
			 ('Julia S França', 789123456,'rua lareijras 861, Centro'),
			 ('Roberta G Assis', 98745631,'avenidade koller 19, Centro'),
			 ('Isabela M Cruz', 654789123,'rua alemeda das flores 28, Centro');

desc Produto;
insert into Produto (Nome_produto, Categoria, Valor, Descricao) values
							  ('Fone de ouvido','Eletrônico', 25.50, 'Otímos fones de ouvidos para curtir músicas!!'),
                              ('Barbie Elsa','Brinquedos',59.90,null),
                              ('Body Carters','Vestimenta',10.00,null),
                              ('Microfone Vedo - Youtuber','Eletrônico',100.00,null),
                              ('Sofá retrátil','Móveis',1000.00,'3x57x80'),
                              ('Farinha de arroz','Alimentos',5.00,null),
                              ('Fire Stick Amazon','Eletrônico',259.80,null);
                              
desc Pedido;
insert into Pedido (idPedido_cliente, Status_pedido, Descricao_pedido) values 
							 (1, default,'compra via aplicativo'),
                             (2,default,'compra via aplicativo'),
                             (3,'Enviado',null),
                             (4,default,'compra via web site');


desc Pagamento;                         
insert into Pagamento (idPagamento_cliente, idPagamento_pedido, valor, Metodo_pagamento) values
						 (1,5,10.0,'Boleto'),
                         (2,6,259.80,'Boleto'),
                         (3,7,5.00,'Cartão'),
                         (4,8,59.90,'Cartão');


desc Produto_pedido_pagamento;
insert into Produto_pedido_pagamento (idPPP_pedido, idPPP_produto, idPPP_pagamento) values
						 (5,3,5),
                         (6,7,6),
                         (7,6,7),
                         (8,2,8);

desc Estoque;
insert into Estoque (Local_estoque,Quantidade) values 
							('Rio de Janeiro',1000),
                            ('Rio de Janeiro',500),
                            ('São Paulo',10),
                            ('São Paulo',100),
                            ('São Paulo',10),
                            ('Brasília',60);
                            

desc Produto_estoque;
insert into Produto_estoque (idPE_estoque, idPE_produto) values
						 (1,2),
                         (2,6);
                         
desc Fornecedor;
insert into Fornecedor (CNPJ, Contato) values 
							(123456789123456,'21985474'),
                            (854519649143457,'21985484'),
                            (934567893934695,'21975474');

desc Produto_fornecedor;
insert into Produto_fornecedor (idPF_fornecedor, idPF_produto, Quantidade) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,5),
                         (2,5,10);
                         
desc Vendedor;
insert into Vendedor (Nome, CNPJ, CPF, Local_vendendor, Contato) values 
						('Tech eletronics', 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null,123456783,'Rio de Janeiro', 219567895),
						('Kids World',456789123654485,null,'São Paulo', 1198657484);
                        
                        
desc Produto_vendedor;
insert into Produto_vendedor (idPV_vendedor, idPV_produto, Quantidade) values 
						 (1,6,80),
                         (2,7,10);
                         



-- Quantos pedidos foran feitos por cada cliente??
SELECT Nome_completo, count(*) as Total_pedidos FROM Cliente JOIN Pedido ON idCliente = idPedido_cliente
								GROUP BY idCliente
                                HAVING Total_pedidos >=2
								ORDER BY 'Nome_compĺeto';

insert into Pedido (idPedido_cliente, Status_pedido, Descricao_pedido) values 
							 (1, default,'compra via aplicativo');
                             
                             
-- Algum vendedor também é fornecedor??
SELECT * FROM Vendedor JOIN Fornecedor USING (CNPJ);

insert into Fornecedor (CNPJ, Contato) values 
							(123456789456321,'21985474');

-- Saldão na parte de eletronicos --- desconto de 25%

SELECT Categoria, Nome_produto, valor, round(valor*0.25,2) as Desconto, round(valor*0.75,2) as Novo_preco FROM Produto
												WHERE Categoria = 'Eletrônico'
                                                ORDER BY Novo_preco;
                                                
                                                
SELECT Categoria, Nome_produto, valor,
		CASE 
		WHEN Categoria = 'Eletrônico' THEN round(valor*0.75,2)
        ELSE valor
        END as Novo_valor
        FROM Produto
        ORDER BY Categoria;
												
                         
