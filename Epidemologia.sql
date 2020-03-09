CREATE TABLE paciente (
cpf INTEGER NOT NULL PRIMARY KEY,
cartao_sus INTEGER NOT NULL,
nomepaciente VARCHAR(255) NOT NULL,
sexo INTEGER NOT NULL,
data_nascimento DATE NOT NULL,
nomemae VARCHAR(255) NOT NULL,
nacionalidade VARCHAR(255)
);

CREATE TABLE denuncia (
id_denuncia INTEGER PRIMARY KEY AUTOINCREMENT,
denuncia_cpf INTEGER NOT NULL,
data_notificacao DATETIME NOT NULL,
gestante INTEGER,
trimestre_gestacional INTEGER,
idadeanos INTEGER,
paisresidencia VARCHAR(255),
unidadefederal VARCHAR(2),
endereco VARCHAR(255),
cep INTEGER,
FOREIGN KEY (denuncia_cpf) REFERENCES paciente(cpf)
);

CREATE TABLE dadosdecasos (
id_dadosdecasos INTEGER PRIMARY KEY AUTOINCREMENT,
dadosdecasos_cpf INTEGER NOT NULL,
data_primeirossintomas DATE,
temperatura_aferida INTEGER,
paciente_foi_hospitalizado INTEGER,
nome_do_hospital_de_internacao VARCHAR(255),
data_da_internacao_hospitalar DATE,
data_da_alta_hospitalar DATE,
data_do_isolamento DATE,
paciente_foi_submetido_a_ventilacao_mecanica INTEGER,
situacao_de_saude_do_paciente VARCHAR(255),
foi_realizado_coleta_de_amostra_do_paciente INTEGER,
FOREIGN KEY (dadosdecasos_cpf) REFERENCES paciente(cpf)
);


CREATE TABLE viagens (
id_viagens INTEGER PRIMARY KEY AUTOINCREMENT,
viagens_cpf = INTEGER NOT NULL,
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
se_teve_contato_com_outro_caso_suspeito VARCHAR(255),
se_teve_contato_com_outro_caso_suspeito_especificar VARCHAR(255),
o_paciente_teve_contato_proximo_com_uma_pessoa_que_seja_caso_confirmado INTEGER,
se_teve_contato_com_outro_caso_confirmado VARCHAR(255),
se_teve_contato_com_outro_caso_confirmado_especificar VARCHAR(255),
nome_do_caso_fonte VARCHAR(255),
esteve_em_alguma_unidade_de_saude_nos_14_dias_antes INTEGER,
se_frequentou_unidade_de_saude VARCHAR(255),
ocupacao_do_caso_suspeito VARCHAR(255),
ocupacao_outros_especificar VARCHAR(255),
teve_contato_proximo_com_animais INTEGER,
FOREIGN KEY (viagens_cpf) REFERENCES paciente(cpf)
);

CREATE TABLE unidadenotificadora (
id_unidadenotificadora INTEGER PRIMARY KEY AUTOINCREMENT,
unidadenotificadora_cpf INTEGER,
origem_da_notificacao VARCHAR(255),
estado_de_notificacao VARCHAR(2),
municipio_de_notificacao VARCHAR(255),
nome_do_notificador VARCHAR(255),
profissao_ou_ocupacao VARCHAR(255),
telefone_de_contato_do_notificador VARCHAR(255),
email_do_notificador VARCHAR(255),
FOREIGN KEY (unidadenotificadora_cpf) REFERENCES paciente(cpf)
);


CREATE TABLE sintomas (
id_sintomas INTEGER PRIMARY KEY AUTOINCREMENT,
sintomas_dadosdecasos NOT NULL,
nome_sintoma VARCHAR(255) NOT NULL,
FOREIGN KEY (sintomas_dadosdecasos) REFERENCES dadosdecasos(id_dadosdecasos)
);

CREATE TABLE sintomasclinicos (
id_sintomasclinicos INTEGER PRIMARY KEY AUTOINCREMENT,
sintomasclinicos_dadosdecasos NOT NULL,
nome_sintoma VARCHAR(255) NOT NULL,
FOREIGN KEY (sintomasclinicos_dadosdecasos) REFERENCES dadosdecasos(id_dadosdecasos)
);

CREATE TABLE morbidadesprevias (
id_morbidadesprevias INTEGER PRIMARY KEY AUTOINCREMENT,
morbidadesprevias_dadosdecasos NOT NULL,
nome_sintoma VARCHAR(255) NOT NULL,
FOREIGN KEY (morbidadesprevias_dadosdecasos) REFERENCES dadosdecasos(id_dadosdecasos)
);


INSERT INTO paciente
(cpf, cartao_sus, nomepaciente, sexo, data_nascimento, nomemae, nacionalidade)
VALUES
('12345678910', '123451000','Manolin da Silva Chavier', '0', '1995-10-02', 'Mae do Manolin da Silva Chavier', 'Brasileiro');

INSERT INTO denuncia
(denuncia_cpf, data_notificacao, gestante, trimestre_gestacional, idadeanos, paisresidencia, unidadefederal, endereco, cep)
VALUES
('12345678910', '2020-02-24 13:54','0', '0', '24', 'Brasil', 'RJ', 'Rua do Manolin 123', '20220250');

INSERT INTO dadosdecasos
(dadosdecasos_cpf, data_primeirossintomas, temperatura_aferida, paciente_foi_hospitalizado, data_da_internacao_hospitalar, data_da_internacao_hospitalar, data_da_alta_hospitalar, data_do_isolamento, paciente_foi_submetido_a_ventilacao_mecanica, situacao_de_saude_do_paciente, foi_realizado_coleta_de_amostra_do_paciente)
VALUES
('12345678910','2020-02-20','41', '0',,,,'Cura','1','1');

INSERT INTO viagens
(viagens_cpf, paciente_tem_historico_de_viagem_para_fora_do_brasil_14_dias, o_paciente_teve_contato_proximo_com_uma_pessoa_que_seja_caso_suspeito, o_paciente_teve_contato_proximo_com_uma_pessoa_que_seja_caso_confirmado, esteve_em_alguma_unidade_de_saude_nos_14_dias_antes, ocupacao_do_caso_suspeito, teve_contato_proximo_com_animais)
VALUES
('12345678910','0','0','0', '0', 'Profissional da Saude', '1');

INSERT INTO unidadenotificadora
(unidadenotificadora_cpf, origem_da_notificacao, estado_de_notificacao, municipio_de_notificacao, nome_do_notificador, profissao_ou_ocupacao, telefone_de_contato_do_notificador, email_do_notificador)
VALUES
('12345678910','Origem','Estado', 'Municipio', 'Brunin rei delas', 'Jogador de LoL', '40028922', 'bruninfadomanolin@manolin.com');

INSERT INTO sintomas
(sintomas_dadosdecasos, nome_sintoma)
VALUES
('1', 'Febre');

INSERT INTO sintomas
(sintomas_dadosdecasos, nome_sintoma)
VALUES
('1', 'Dor de garganta');


-- Retorna tudo de todos
SELECT * FROM paciente;
SELECT * FROM dadosdecasos;
SELECT * FROM viagens;
SELECT * FROM unidadenotificadora;
SELECT * FROM sintomas;
