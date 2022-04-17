CREATE DATABASE IF NOT EXISTS loja_roupas CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE loja_roupas;

CREATE TABLE IF NOT EXISTS cliente (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('M', 'F'),
    celular VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    promocoes_email BOOLEAN DEFAULT 0 COMMENT 'flag para envio de promoções da loja por e-mail',
    promocoes_whatsApp BOOLEAN DEFAULT 0 COMMENT 'flag para envio de promoções da loja por whatsApp',
    CONSTRAINT pk_cliente_id PRIMARY KEY (id),
    CONSTRAINT uk_cliente_cpf UNIQUE KEY (cpf),
    CONSTRAINT uk_cliente_email UNIQUE KEY (email)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS marca (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    CONSTRAINT pk_marca_id PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS categoria (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    CONSTRAINT pk_categoria_id PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS grupo (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    CONSTRAINT pk_grupo_id PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS produto (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(5, 2) NOT NULL,
    marca_id INT UNSIGNED NOT NULL,
    categoria_id INT UNSIGNED NOT NULL,
    grupo_id INT UNSIGNED NOT NULL,
    preco_desconto DECIMAL(5, 2),
    destaque BOOLEAN NOT NULL DEFAULT 0 COMMENT 'flag para destacar os produtos na página inicial',
    CONSTRAINT pk_produto_id PRIMARY KEY (id),
    CONSTRAINT fk_marca_id_1 FOREIGN KEY (marca_id) REFERENCES marca (id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_categoria_id_1 FOREIGN KEY (categoria_id) REFERENCES categoria (id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_grupo_id_1 FOREIGN KEY (grupo_id) REFERENCES grupo (id) ON UPDATE CASCADE ON DELETE NO ACTION
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS estoque (
    produto_id INT UNSIGNED NOT NULL,
    tamanho ENUM('PP', 'P', 'M', 'G', 'GG') NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    CONSTRAINT pk_estoque_id PRIMARY KEY (produto_id, tamanho, cor),
    CONSTRAINT fk_produto_id_1 FOREIGN KEY (produto_id) REFERENCES produto (id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS endereco_entrega (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    numero INT UNSIGNED NOT NULL,
    complemento VARCHAR(60),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    ponto_referencia VARCHAR(255),
    CONSTRAINT pk_endereco_entrega_id PRIMARY KEY (id)
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS compra (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    endereco_entrega_id INT UNSIGNED NOT NULL,
    forma_pagamento ENUM('CREDITO', 'BOLETO', 'PIX') NOT NULL,
    valor_compra DECIMAL(10, 2) NOT NULL,
    numero_parcela ENUM('1', '2', '3', '4', '5') NOT NULL DEFAULT 1,
    embalagem_presente BOOLEAN DEFAULT 0 COMMENT 'flag para envio do produto com embalagem de presente',
    data DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_compra_id PRIMARY KEY (id),
    CONSTRAINT fk_cliente_id_1 FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE NO ACTION,
    CONSTRAINT fk_endereco_entrega_1 FOREIGN KEY (endereco_entrega_id) REFERENCES endereco_entrega (id) ON UPDATE CASCADE ON DELETE NO ACTION
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS compra_produto (
    compra_id INT UNSIGNED NOT NULL,
    produto_id INT UNSIGNED NOT NULL,
    tamanho ENUM('PP', 'P', 'M', 'G', 'GG') NOT NULL,
    cor VARCHAR(20) NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    CONSTRAINT pk_compra_produto_id PRIMARY KEY (compra_id, produto_id),
    CONSTRAINT fk_compra_id_1 FOREIGN KEY (compra_id) REFERENCES compra (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT fk_produto_id_2 FOREIGN KEY (produto_id) REFERENCES produto (id) ON UPDATE NO ACTION ON DELETE NO ACTION
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS cliente_endereco_entrega (
    cliente_id INT UNSIGNED NOT NULL,
    endereco_entrega_id INT UNSIGNED NOT NULL,
    CONSTRAINT pk_cliente_endereco_entrega_id PRIMARY KEY (cliente_id, endereco_entrega_id),
    CONSTRAINT fk_cliente_id_2 FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_endereco_entrega_id_2 FOREIGN KEY (endereco_entrega_id) REFERENCES endereco_entrega (id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;