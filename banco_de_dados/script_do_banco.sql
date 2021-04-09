CREATE DATABASE bd_oaktruffle;

use bd_oaktruffle;

CREATE TABLE tbEmpresa (
	id_empresa INT PRIMARY KEY auto_increment
    ,nome_empresa varchar (100)
    ,cnpj_empresa varchar (100)
    ,estado_empresa varchar (100)
    ,cidade_empresa varchar (100)
    ,bairro_empresa varchar (100)
    ,logradouro_empresa varchar (100)
    ,cep_empresa char (10)
);

CREATE TABLE tbFuncionario (
	id_funcionario INT PRIMARY KEY auto_increment
    ,nome_funcionario varchar (100)
    ,email_funcionario varchar (100)
    ,senha_funcionario varchar (100)
    ,dataNasc_funcionario date
    ,cpf_funcionario varchar (15)
    ,fk_empresa int 
    ,FOREIGN KEY (fk_empresa) references tbEmpresa (id_empresa)
);

CREATE TABLE tbSensor (
	id_sensor INT PRIMARY KEY auto_increment
    ,tipo_sensor varchar (30) DEFAULT 'dht11'
    ,status_sensor VARCHAR (30)
    ,temperatura_coletada float
    ,umidade_coletada float
    ,data_hora_coletado datetime default current_timestamp
);



CREATE TABLE tbQuadrante (
	id_quadrante INT PRIMARY KEY auto_increment
    ,descricao_quadrante varchar (100)
    ,data_intalacao datetime default current_timestamp
    ,fk_empresa int
    ,FOREIGN KEY (fk_empresa) REFERENCES tbEmpresa (id_empresa)
    ,fk_sensor int
    ,FOREIGN KEY (fk_sensor) REFERENCES tbSensor (id_sensor)
);

insert into tbEmpresa VALUES(null,'TrufaCom','1546897','SP','São Paulo','lageado','rua','08452020')
						   ,(null,'TrufaInc','5468465','MG','Belo Horizonte','cruzeiro do sul','avenida','0865423')
						   ,(null,'MultiTrufa','5643216','RJ','Rio de janeiro','cidade de deus','avenida','0865423')
						   ,(null,'MultiTrufa','5643216','RJ','Rio de janeiro','belford roxo','rua','0852423')
						   ,(null,'PentaTrufa','5643741','DF','Asa sul','Lago Sul','rua','0878923');
                           
select*from tbEmpresa;
select*from tbFuncionario;
                           
insert into tbFuncionario VALUES (null,'Mateus Araujo','mateus.nascimento@bandtec.com','mateus123','2001-08-29','082.965.350-33',5)
								,(null,'Raoann Camara','raoann.camara@bandtec.com','raoann582','1998-04-06','595.786.760-85',1)
								,(null,'Natacha Batista','natacha.batista@bandtec.com','nat987','1999-09-29','817.223.870-33',2)
								,(null,'Felipe Amorim','felipe.amorim@bandtec.com','felipe254','2002-02-25','348.615.850-31',3)
								,(null,'Rai Jonas','rai.jonas@bandtec.com','raii999','1999-09-04','311.932.910-03',4)
								,(null,'Gabriel Agra','gabriel.agra@bandtec.com','gab2003','2002-06-29','488.066.230-52',4);
                                
insert into tbSensor (status_sensor,temperatura_coletada,umidade_coletada) VALUES ('Ativo',24,'90')
																				 ,('Ativo',23.2,'92')
																				 ,('inativo',0,'0')
																				 ,('Ativo',21.8,'91')
                                                                                 ,('inativo',0,'0');

insert into tbQuadrante (descricao_quadrante, fk_empresa, fk_sensor) VALUES ('area_1',1,1)
																		   ,('area_2',2,2)
																		   ,('area_3',3,3)
																		   ,('area_4',4,4)
																		   ,('area_5',5,5);
                                                                           
select*from tbFuncionario;
select*from tbEmpresa;

-- Verificar qual funcionario é de uma empresa especifica (nesse caso, qual é da empresa 4)
select tbFuncionario.nome_funcionario,tbEmpresa.id_empresa from tbFuncionario
inner join tbEmpresa
on fk_empresa = id_empresa where id_empresa=4;

-- DATA INSTALAÇÃO TA DANDO ERRO
select q.id_quadrante,q.descricao_quadrante,s.tipo_sensor,s.status_sensor,s.temperatura_coletada,s.umidade_coletada,s.data_hora_coletado from tbQuadrante as q
inner join tbSensor as s
on fk_sensor = id_sensor;

select*from tbSensor;
select*from tbQuadrante;


                                                                           
                                                                           
                                                                           
                                                                           












