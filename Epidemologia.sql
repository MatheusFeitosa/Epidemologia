
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
ind_transmissao INTEGER NOT NULL
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

CREATE TABLE paciente (
data_notificacao DATETIME NOT NULL,
CartaoSUS INTEGER,
cpf INTEGER,
nomepaciente VARCHAR(255) NOT NULL,
sexo VARCHAR(1),
gestante INTEGER,
trimestre_gestacional INTEGER,
data_nascimento DATE NOT NULL,
idadeanos INTEGER,
nomemae VARCHAR(255) NOT NULL,
nacionalidade VARCHAR(255),
paisresidencia VARCHAR(255),
unidadefederal VARCHAR(2),
endereco VARCHAR(255),
cep INTEGER,
PRIMARY KEY (nomepaciente, data_nascimento, nomemae)
);

CREATE TABLE dadosdecasos (
id_dadosdecasos INTEGER PRIMARY KEY AUTOINCREMENT,
dadosdecasos_nomepaciente VARCHAR(255) NOT NULL,
dadosdecasos_data_nascimento DATE NOT NULL,
dadosdecasos_nomemae VARCHAR(255) NOT NULL,
data_primeirossintomas DATE,
sintomas_febre INTEGER,
sintomas_tosse INTEGER,
sintomas_dor_de_garganta INTEGER,
sintomas_dificuldade_de_respirar INTEGER,
sintomas_mialgia INTEGER,
sintomas_diarreia INTEGER,
sintomas_nausea INTEGER,
sintomas_cefaleia INTEGER,
sintomas_coriza INTEGER,
sintomas_irritabilidade INTEGER,
sintomas_adinamia INTEGER,
sintomas_producao_de_escarro INTEGER,
sintomas_calafrios INTEGER,
sintomas_congestao_nasal INTEGER,
sintomas_congestao_conjuntiva INTEGER,
sintomas_dificuldade_para_deglutir INTEGER,
sintomas_manchas_vermelhas_pelo_corpo INTEGER,
sintomas_ganglios_linfaticos_aumentados INTEGER,
sintomas_batimento_das_asas_nasais INTEGER,
sintomas_outros INTEGER,
outrossintomas VARCHAR(255),
sintomas_clinicos_febre INTEGER,
temperatura_aferida INTEGER,
sintomas_clinicos_exsudato_faringeo INTEGER,
sintomas_clinicos_convulsao INTEGER,
sintomas_clinicos_conjuntivite INTEGER,
sintomas_clinicos_coma INTEGER,
sintomas_clinicos_dispneia INTEGER,
sintomas_clinicos_alteracao_de_ausculta_pulmonar INTEGER,
sintomas_clinicos_alteracao_na_radiologia_de_torax INTEGER,
sintomas_clinicos_outros INTEGER,
outrossintomasclinicos VARCHAR(255),
morbidades_previas_doenca_cardiovascular INTEGER,
morbidades_previas_diabetes INTEGER,
morbidades_previas_doenca_hepatica INTEGER,
morbidades_previas_doenca_neurologica_cronica INTEGER,
morbidades_previas_imunodeficiencia INTEGER,
morbidades_previas_infeccao_pelo_hiv INTEGER,
morbidades_previas_doenca_renal INTEGER,
morbidades_previas_doenca_pulmonar_cronica INTEGER,
morbidades_previas_neoplasia INTEGER,
paciente_foi_hospitalizado INTEGER,
nome_do_hospital_de_internacao VARCHAR(255),
data_da_internacao_hospitalar DATE,
data_da_alta_hospitalar DATE,
data_do_isolamento DATE,
paciente_foi_submetido_a_ventilacao_mecanica INTEGER,
setuacao_de_saude_do_paciente INTEGER,
foi_realizado_coleta_de_amostra_do_paciente INTEGER,
FOREIGN KEY (dadosdecasos_nomepaciente, dadosdecasos_data_nascimento, dadosdecasos_nomemae) REFERENCES paciente(nomepaciente, data_nascimento, nomemae)
);


CREATE TABLE viagens (
id_viagens INTEGER PRIMARY KEY AUTOINCREMENT,
viagens_nomepaciente VARCHAR(255) NOT NULL,
viagens_data_nascimento DATE NOT NULL,
viagens_nomemae VARCHAR(255) NOT NULL,
paciente_tem_historico_de_viagem_para_fora_do_brasil_14_dias INTEGER,
foi_para_wuhan_na_china INTEGER,
data_da_viagem_de_ida_para_wuhan DATE,
data_da_viagem_de_volta_para_wuhan DATE,
foi_para_outro_local_de_transmissao INTEGER,
outro_local_de_transmissao_descrever VARCHAR(255),
data_da_viagem_de_ida_para_outro_local_transmissao DATE,
data_da_viagem_de_volta_para_outro_local_transmissao DATE,
descrito_do_historico_de_deslocamento_nos_14_dias VARCHAR(255),
data_da_chegada_no_brasil DATE,
o_paciente_teve_contato_proximo_com_uma_pessoa_que_seja_caso_suspeito INTEGER,
se_teve_contato_com_outro_caso_suspeito_unidade_de_saude INTEGER,
se_teve_contato_com_outro_caso_suspeito_domicilio INTEGER,
se_teve_contato_com_outro_caso_suspeito_local_de_trabalho INTEGER,
se_teve_contato_com_outro_caso_suspeito_desconhecido INTEGER,
se_teve_contato_com_outro_caso_suspeito_outro INTEGER,
se_teve_contato_com_outro_caso_suspeito_especificar VARCHAR(255),
o_paciente_teve_contato_proximo_com_uma_pessoa_que_seja_caso_confirmado INTEGER,
se_teve_contato_com_outro_caso_confirmado_unidade_de_saude INTEGER,
se_teve_contato_com_outro_caso_confirmado_domicilio INTEGER,
se_teve_contato_com_outro_caso_confirmado_local_de_trabalho INTEGER,
se_teve_contato_com_outro_caso_confirmado_desconhecido INTEGER,
se_teve_contato_com_outro_caso_confirmado_outro INTEGER,
se_teve_contato_com_outro_caso_confirmado_especificar VARCHAR(255),
nome_do_caso_fonte VARCHAR(255),
esteve_em_alguma_unidade_de_saude_nos_14_dias_antes INTEGER,
se_frequentou_unidade_de_saude VARCHAR(255),
ocupacao_do_caso_suspeito INTEGER,
ocupacao_outros_especificar VARCHAR(255),
teve_contato_proximo_com_animais INTEGER,
FOREIGN KEY (viagens_nomepaciente, viagens_data_nascimento, viagens_nomemae) REFERENCES paciente(nomepaciente, data_nascimento, nomemae)
);

CREATE TABLE unidadenotificadora (
id_unidadenotificadora INTEGER PRIMARY KEY AUTOINCREMENT,
unidadenotificadora_nomepaciente VARCHAR(255) NOT NULL,
unidadenotificadora_data_nascimento DATE NOT NULL,
unidadenotificadora_nomemae VARCHAR(255) NOT NULL,
origem_da_notificacao VARCHAR(255),
estado_de_notificacao VARCHAR(2),
municipio_de_notificacao VARCHAR(255),
nome_do_notificador VARCHAR(255),
profissao_ou_ocupacao VARCHAR(255),
telefone_de_contato_do_notificador VARCHAR(255),
email_do_notificador VARCHAR(255),
FOREIGN KEY (unidadenotificadora_nomepaciente, unidadenotificadora_data_nascimento, unidadenotificadora_nomemae) REFERENCES paciente(nomepaciente, data_nascimento, nomemae)
);


INSERT INTO transmissores
(nome_transmissor)
VALUES
('Aedes Aegypti');

INSERT INTO transmissores
(nome_transmissor)
VALUES
('Rato');

INSERT INTO doencas
(nome_doenca,ind_transmissao)
VALUES
('Dengue','0');

INSERT INTO doencas
(nome_doenca,ind_transmissao)
VALUES
('Zika','0');

INSERT INTO doencas
(nome_doenca,ind_transmissao)
VALUES
('chikungunya','0');

INSERT INTO doencas
(nome_doenca,ind_transmissao)
VALUES
('Dorime','666');

INSERT INTO transmite
(transmissor,doenca)
VALUES
('1','1');

INSERT INTO transmite
(transmissor,doenca)
VALUES
('1','2');

INSERT INTO transmite
(transmissor,doenca)
VALUES
('1','3');

INSERT INTO transmite
(transmissor,doenca)
VALUES
('2','4');

INSERT INTO usuario
(nome_usuario,usuario,senha,email,datanasc,adm)
VALUES
('Bruninho','Bubu','Manolin123','Bubu@labnet.nce.ufrj.br','1999-01-01',"0");

INSERT INTO denuncia
(endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
('Rua do Catete 123',"0",'1','1','2020-01-01','1.23','2.21');

INSERT INTO denuncia
(endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
('Rua do Rosario 123',"0",'2','1','2020-01-01','2.23','3.21');

INSERT INTO denuncia
(endereco,resolvido,d_doenca,d_usuario,data_denuncia,denuncia_x,denuncia_y)
VALUES
('Rua do Manolin 123',"0",'4','1','2020-01-01','5.23','3.21');

INSERT INTO paciente
(data_notificacao, nomepaciente, data_nascimento, nomemae)
VALUES
('2020-02-24 13:54', 'Manolin da Silva Chavier','1995-10-02','Mae do Manolin da Silva Chavier');

INSERT INTO dadosdecasos
(dadosdecasos_nomepaciente, dadosdecasos_data_nascimento, dadosdecasos_nomemae)
VALUES
('Manolin da Silva Chavier','1995-10-02','Mae do Manolin da Silva Chavier');

INSERT INTO viagens
(viagens_nomepaciente, viagens_data_nascimento, viagens_nomemae)
VALUES
('Manolin da Silva Chavier','1995-10-02','Mae do Manolin da Silva Chavier');

INSERT INTO unidadenotificadora
(unidadenotificadora_nomepaciente, unidadenotificadora_data_nascimento, unidadenotificadora_nomemae)
VALUES
('Manolin da Silva Chavier','1995-10-02','Mae do Manolin da Silva Chavier');

-- Retorna tudo de todos
SELECT * FROM usuario;
SELECT * FROM transmissores;
SELECT * FROM doencas;
SELECT * FROM denuncia;
SELECT * FROM paciente;
SELECT * FROM dadosdecasos;
SELECT * FROM viagens;
SELECT * FROM unidadenotificadora;

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

