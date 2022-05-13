USE loja_roupas;

INSERT INTO
    cliente (
        cpf,
        nome,
        sobrenome,
        data_nascimento,
        genero,
        celular,
        email,
        senha
    )
VALUES
    (
        '85626899049',
        'Tomás',
        'Ian Monteiro',
        '1977-02-24',
        'M',
        '85981393534',
        'tomas_monteiro@vick1.com.br',
        '$2a$12$Baahl9xWW84JGvYYGq.elu62GfPq0GDeABCFv1T67Cc3b3ych9dD.'
    ),
    (
        '98356116376',
        'Guilherme',
        'Nathan Silva',
        '1970-01-17',
        'M',
        '85997341942',
        'guilherme_silva@konzeption.com.br',
        '$2a$12$qWz6dJvrc1aqc0Ndvej5AerrXpztcOC7BAzJXRrCBacikLBQ034ye'
    ),
    (
        '30383306981',
        'Osvaldo',
        'Julio Gael da Costa',
        '1970-01-18',
        'M',
        '96986787545',
        'osvaldo-dacosta93@caporal.biz',
        '$2a$12$VHUuD87d7Cr1.VKXR9uGVeS4BXtSikLtpck8F/if0Dw8hJ6Kl5jRy'
    ),
    (
        '12854722760',
        'Andrea',
        'Lorena Valentina Oliveira',
        '1984-03-01',
        'F',
        '95984747453',
        'andrea-oliveira76@img.com.br',
        '$2a$12$DkTit5mSHWXlHfwUUYkwwOzHAzZ7kQcEahuvJAq2uzVz2kQuK5XIW'
    ),
    (
        '56773555850',
        'Heitor',
        'André da Cruz',
        '1999-04-06',
        'M',
        '67997390162',
        'heitor_andre_dacruz@redealumni.com',
        '$2a$12$hJyUNcHBe.sA7vUjhADdNeFq18AvfQhry5B/2Nm.wFE/itgoQW2IG'
    );

INSERT INTO
    marca (nome)
VALUES
    ('Ativa Esportes'),
    ('Blue Steel'),
    ('Cortelle'),
    ('Marfinno'),
    ('Request');

INSERT INTO
    categoria (nome)
VALUES
    ('Masculino'),
    ('Feminino'),
    ('Infantil');

INSERT INTO
    grupo (nome)
VALUES
    ('Bermudas'),
    ('Blusas'),
    ('Calças'),
    ('Camisas'),
    ('Casacos'),
    ('Jaquetas'),
    ('Saias'),
    ('Vestidos');

INSERT INTO
    produto (
        nome,
        descricao,
        preco,
        marca_id,
        categoria_id,
        grupo_id,
        destaque
    )
VALUES
    (
        'CAMISA SLIM EM ALGODÃO MANGA LONGA COM ESTAMPA POÁ',
        'Camisa slim, em algodão, manga longa com botão no colarinho e estampa discreta de poá. Confortável e respirável, é uma opção estilosa para compor looks casuais.',
        139.90,
        4,
        1,
        4,
        0
    ),
    (
        'BERMUDA EM LINHO COM CÓS ELÁSTICO',
        'Bermuda masculina modelo slim, sem estampa, com bolsos laterais. Seu cós elástico, com amarração para ajuste, garante melhor fit e praticidade ao vestir. Básica, sem perder em estilo, é uma opção versátil para diversos momentos.',
        119.90,
        5,
        1,
        1,
        0
    ),
    (
        'BLUSA EM LAISE COM ESTAMPA FLORAL E COSTAS TRANSPASSADAS',
        'Blusa com decote quadrado, mangas curtas bufantes e costas transpassadas. Confeccionada em laise, a peça garante conforto e respirabilidade, além de trazer um ar delicado ao look com sua estampa floral superfofa.',
        89.90,
        2,
        2,
        2,
        0
    ),
    (
        'VESTIDO LONGO EM VISCOSE COM ESTAMPA FLORAL',
        'Vestido longo de alcinha com modelado soltinho. Com a parte superior de coloração diferente, o vestido traz uma modernidade a peça com estampa de flores barradas na parte inferior.',
        219.90,
        4,
        2,
        8,
        0
    ),
    (
        'BLUSA REGATA CROPPED EM VISCOSE COM FRANZIDO NO BUSTO E ESTAMPA POÁ',
        'Blusa regata cropped em viscose, com detalhe franzido no busto, a peça torna-se mais delicada e charmosa. A estampa em poá alongado, nunca sai de moda, traz ao look uma ar vintage e superestiloso. O modelo é leve e muito confortável.',
        79.90,
        3,
        2,
        2,
        0
    );

INSERT INTO
    estoque (produto_id, tamanho, cor, quantidade)
VALUES
    (1, 'P', 'Branco', 10),
    (1, 'M', 'Branco', 10),
    (1, 'G', 'Branco', 10),
    (1, 'P', 'Azul', 15),
    (1, 'M', 'Azul', 15),
    (1, 'G', 'Azul', 15),
    (1, 'GG', 'Azul', 15),
    (2, 'P', 'Preto', 20),
    (2, 'M', 'Preto', 20),
    (2, 'G', 'Preto', 20),
    (2, 'GG', 'Preto', 20),
    (2, 'M', 'Verde', 5),
    (2, 'G', 'Verde', 5),
    (2, 'GG', 'Verde', 5),
    (3, 'P', 'Laranja', 50),
    (3, 'G', 'Laranja', 50),
    (3, 'GG', 'Laranja', 50),
    (4, 'PP', 'Bege', 35),
    (4, 'M', 'Bege', 35),
    (4, 'G', 'Bege', 35),
    (4, 'GG', 'Bege', 35),
    (5, 'PP', 'Bege', 8),
    (5, 'M', 'Bege', 8),
    (5, 'G', 'Bege', 8),
    (5, 'GG', 'Bege', 8);

INSERT INTO
    endereco_entrega (
        cep,
        endereco,
        numero,
        complemento,
        bairro,
        cidade,
        estado,
        ponto_referencia
    )
VALUES
    (
        '79091642',
        'Rua Afonso Silva Rosa',
        '10',
        NULL,
        'Residencial Oliveira',
        'Campo Grande',
        'MS',
        NULL
    ),
    (
        '68628410',
        'Rua Belo Campos',
        '156',
        NULL,
        'Promissão II',
        'Paragominas',
        'PA',
        NULL
    ),
    (
        '22725200',
        'Rua Cláudio Bardy',
        '289',
        NULL,
        'Taquara',
        'Rio de Janeiro',
        'RJ',
        NULL
    ),
    (
        '53220650',
        'Rua Argentina',
        '1180',
        NULL,
        'Peixinhos',
        'Olinda',
        'PE',
        NULL
    ),
    (
        '35661759',
        'Rua Santo Adriano',
        '58',
        NULL,
        'Tavares de Minas',
        'Pará de Minas',
        'MG',
        NULL
    );

INSERT INTO
    compra (
        cliente_id,
        endereco_entrega_id,
        forma_pagamento,
        valor_compra,
        numero_parcela,
        embalagem_presente
    )
VALUES
    (1, 1, 'CREDITO', 139.90, 2, 0),
    (2, 2, 'BOLETO', 119.90, 5, 1),
    (3, 3, 'PIX', 89.90, 5, 0),
    (4, 4, 'CREDITO', 219.90, 1, 0),
    (5, 5, 'CREDITO', 79.90, 2, 0);

INSERT INTO
    compra_produto(compra_id, produto_id, tamanho, cor, quantidade)
VALUES
    (1, 1, 'M', 'Branco', 1),
    (2, 2, 'GG', 'Preto', 1),
    (3, 3, 'P', 'Laranja', 1),
    (4, 4, 'PP', 'Bege', 1),
    (5, 5, 'G', 'Bege', 1);

INSERT INTO
    cliente_endereco_entrega(cliente_id, endereco_entrega_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
