CREATE TABLE usuario (
id_user INTEGER PRIMARY KEY AUTOINCREMENT,
nome_usuario VARCHAR(255) NOT NULL,
usuario VARCHAR(255) NOT NULL,
senha VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
datanasc DATE NOT NULL,
adm INTEGER NOT NULL
);


CREATE TABLE transmissores (
id_transmissores INTEGER PRIMARY KEY AUTOINCREMENT,
nome_transmissor VARCHAR(255) NOT NULL
);

CREATE TABLE doencas (
id_doenca INTEGER PRIMARY KEY AUTOINCREMENT,
nome_doenca VARCHAR(255) NOT NULL,
ind_transmissao INTEGER NOT NULL,
);

CREATE TABLE transmite (
id_transmite INTEGER PRIMARY KEY AUTOINCREMENT,
transmissor INTEGER NOT NULL,
doenca INTEGER NOT NULL,
FOREIGN KEY(transmissor) REFERENCES transmissores(id_transmissores),
FOREIGN KEY(doenca) REFERENCES doencas(id_doenca)
);

CREATE TABLE denuncia (
id_denuncia INTEGER PRIMARY KEY AUTOINCREMENT,
endereco VARCHAR(255) NOT NULL,
resolvido INTEGER NOT NULL,
d_doenca INTEGER NOT NULL,
d_usuario INTEGER NOT NULL,
data_denuncia DATE NOT NULL,
denuncia_x DOUBLE NOT NULL,
denuncia_y DOUBLE NOT NULL,
FOREIGN KEY (d_doenca) REFERENCES doencas(id_doenca),
FOREIGN KEY (d_usuario) REFERENCES usuario(id_user)
);


INSERT INTO transmissores
(id_transmissores,nome_transmissor)
VALUES
(DEFAULT,'Aedes Aegypti');

INSERT INTO transmissores
(id_transmissores,nome_transmissor)
VALUES
(DEFAULT,'Rato');

INSERT INTO doencas
(id_doenca,nome_doenca,ind_transmissao)
VALUES
(DEFAULT,'Dengue','0');

INSERT INTO doencas
(id_doenca,nome_doenca,ind_transmissao)
VALUES
(DEFAULT,'Zika','0');

INSERT INTO doencas
(id_doenca,nome_doenca,ind_transmissao)
VALUES
(DEFAULT,'chikungunya','0');

INSERT INTO doencas
(id_doenca,nome_doenca,ind_transmissao)
VALUES
(DEFAULT,'Dorime','666');

INSERT INTO transmite
(id_transmite,transmissor,doenca)
VALUES
(DEFAULT,'1','1');

INSERT INTO transmite
(id_transmite,transmissor,doenca)
VALUES
(DEFAULT,'1','2');

INSERT INTO transmite
(id_transmite,transmissor,doenca)
VALUES
(DEFAULT,'1','3');

INSERT INTO transmite
(id_transmite,transmissor,doenca)
VALUES
(DEFAULT,'2','4');


INSERT INTO usuario
(id_user,nome_usuario,usuario,senha,email,datanasc,adm)
VALUES
(DEFAULT,'Bruninho','Bubu','Manolin123','Bubu@labnet.nce.ufrj.br','1999-01-01',"0");

INSERT INTO denuncia
(id_denuncia,endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
(DEFAULT,'Rua do Catete 123',"0",'1','1','2020-01-01','1.23','2.21');

INSERT INTO denuncia
(id_denuncia,endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
(DEFAULT,'Rua do Rosario 123',"0",'2','1','2020-01-01','2.23','3.21');

INSERT INTO denuncia
(id_denuncia,endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
(DEFAULT,'Rua do Manolin 123',"0",'4','1','2020-01-01','5.23','3.21');

-- Retorna tudo de todos
SELECT * FROM usuario;
SELECT * FROM transmissores;
SELECT * FROM doencas;
SELECT * FROM denuncia;

-- retornar as doenças pra fazer a denuncia
SELECT nome_transmissor FROM transmissores;


-- Retorna as doenças que são transmitidas pelo transmissor
SELECT *
FROM doencas 
INNER JOIN transmite ON id_doenca = doenca 
INNER JOIN transmissores ON transmissor = id_transmissores
WHERE nome_transmissor = 'Rato';

SELECT *
FROM doencas
INNER JOIN transmite ON id_doenca = doenca 
INNER JOIN transmissores ON transmissor = id_transmissores
WHERE nome_transmissor = 'Aedes Aegypti';


-- Aqui voce acha as denuncias a partir do transmissor
SELECT * 
FROM denuncia
INNER JOIN doencas on d_doenca = id_doenca
INNER JOIN transmite ON id_doenca = doenca 
INNER JOIN transmissores ON transmissor = id_transmissores
WHERE nome_transmissor = 'Aedes Aegypti';

-- Aqui voce acha as denuncias a partir da doença
SELECT * 
FROM denuncia
INNER JOIN doencas ON d_doenca = id_doenca
WHERE nome_doenca = 'Dorime';
