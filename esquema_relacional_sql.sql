CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Cliente(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome_completo VARCHAR(45),
    CPF CHAR(11) NOT NULL,
    Endereco VARCHAR(45) NOT NULL,
	CONSTRAINT unique_cpf_cliente UNIQUE(CPF)
);

ALTER TABLE Cliente AUTO_INCREMENT=1;

CREATE TABLE Produto(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(45) NOT NULL,
    Nome_produto VARCHAR(45) NOT NULL,
    Descricao VARCHAR(45),
    Valor FLOAT NOT NULL
);

ALTER TABLE Produto AUTO_INCREMENT=1;

CREATE TABLE Pedido(
	idPedido INT AUTO_INCREMENT,
    idPedido_Cliente INT,
    PRIMARY KEY(idPedido, idPedido_Cliente),
    Status_pedido ENUM('Preparando', 'Processando', 'Enviado', 'Entregue') DEFAULT 'Preparando',
    Descricao_pedido VARCHAR(45),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idPedido_Cliente) REFERENCES Cliente(idCliente)
		ON UPDATE CASCADE 
);
ALTER TABLE Pedido AUTO_INCREMENT=1;

CREATE TABLE Pagamento(
	idPagamento INT AUTO_INCREMENT,
    idPagamento_cliente INT,
    idPagamento_pedido INT,
    Valor FLOAT NOT NULL,
    Metodo_pagamento ENUM('BOLETO', 'CARTÃO') NOT NULL,
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (idPagamento_cliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (idPagamento_pedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE ,
    PRIMARY KEY(idPagamento, idPagamento_Cliente)
    );
ALTER TABLE Pagamento AUTO_INCREMENT=1;

CREATE TABLE Estoque(
	idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local_estoque VARCHAR(45) NOT NULL,
    Quantidade INT NOT NULL
    );
ALTER TABLE Estoque AUTO_INCREMENT=1;
    
CREATE TABLE Fornecedor(
	idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ CHAR(15) UNIQUE NOT NULL,
    Contato VARCHAR(15) NOT NULL
);
ALTER TABLE Fornecedor AUTO_INCREMENT=1;

CREATE TABLE Vendedor(
	idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Local_vendendor VARCHAR(45) NOT NULL,
    Contato VARCHAR(15) NOT NULL,
    CNPJ CHAR(15) UNIQUE,
    CPF CHAR(9) UNIQUE 
);
ALTER TABLE Vendedor AUTO_INCREMENT=1;

CREATE TABLE Produto_vendedor(
	idPV_vendedor INT,
    idPV_produto INT,
    Quantidade INT NOT NULL,
    PRIMARY KEY(idPV_vendedor, idPV_produto),
    CONSTRAINT fk_pv_vendedor FOREIGN KEY (idPV_vendedor) REFERENCES Vendedor(idVendedor) ON UPDATE CASCADE ,
    CONSTRAINT fk_pv_produto FOREIGN KEY (idPV_produto) REFERENCES Produto(idProduto) ON UPDATE CASCADE 
);
    
CREATE TABLE Produto_fornecedor(
	idPF_fornecedor INT,
    idPF_produto INT,
    Quantidade INT,
    PRIMARY KEY(idPF_fornecedor, idPF_produto),
    CONSTRAINT fk_pf_fornecedor FOREIGN KEY (idPF_fornecedor) REFERENCES Fornecedor(idFornecedor) ON UPDATE CASCADE ,
    CONSTRAINT fk_pf_produto FOREIGN KEY (idPF_produto) REFERENCES Produto(idProduto) ON UPDATE CASCADE 
);	

CREATE TABLE Produto_estoque(
	idPE_estoque INT,
    idPE_produto INT,
    PRIMARY KEY(idPE_estoque, idPE_produto),
    CONSTRAINT fk_pe_estoque FOREIGN KEY (idPE_estoque) REFERENCES Estoque(idEstoque) ON UPDATE CASCADE ,
    CONSTRAINT fk_pe_produto FOREIGN KEY (idPE_produto) REFERENCES Produto(idProduto) ON UPDATE CASCADE 
);	

CREATE TABLE Produto_pedido_pagamento(
	idPPP_pedido INT,
    idPPP_produto INT,
    idPPP_pagamento INT,
    PRIMARY KEY(idPPP_pedido, idPPP_produto, idPPP_pagamento),
    CONSTRAINT fk_ppp_pedido FOREIGN KEY (idPPP_pedido) REFERENCES Pedido(idPedido) ON UPDATE CASCADE ,
    CONSTRAINT fk_ppp_produto FOREIGN KEY (idPPP_produto) REFERENCES Produto(idProduto) ON UPDATE CASCADE ,
    CONSTRAINT fk_ppp_pagamento FOREIGN KEY (idPPP_pagamento) REFERENCES Pagamento(idPagamento) ON UPDATE CASCADE 
);

SHOW TABLES;
    
    
    
    
	