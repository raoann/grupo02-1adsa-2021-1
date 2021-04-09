CREATE DATABASE bd_oaktruffle;

use bd_oaktruffle;

CREATE TABLE tbEmpresa (
	id_empresa INT PRIMARY KEY auto_increment
    ,nome_empresa varchar (100) not null
    ,cnpj_empresa varchar (100) not null
    ,estado_empresa varchar (100) not null
    ,cidade_empresa varchar (100) not null
    ,bairro_empresa varchar (100) not null
    ,logradouro_empresa varchar (100) not null
    ,cep_empresa char (10)
);

CREATE TABLE tbFuncionario (
	id_funcionario INT PRIMARY KEY auto_increment
    ,nome_funcionario varchar (100) not null
    ,email_funcionario varchar (100) not null
    ,senha_funcionario varchar (100) not null
    ,dataNasc_funcionario date  not null
    ,cpf_funcionario varchar (15) not null
    ,fk_empresa int 
    ,FOREIGN KEY (fk_empresa) references tbEmpresa (id_empresa)
);

CREATE TABLE tbSensor (
	id_sensor INT PRIMARY KEY auto_increment
    ,tipo_sensor varchar (30) DEFAULT 'dht11'
    ,status_sensor varchar(30) Check ( status_sensor ='Ativo' or status_sensor ='Inativo')
);

CREATE TABLE tbDadosColetados(
	id_DadosColetados int primary key auto_increment
	,temperatura_coletada float not null
    ,umidade_coletada float not null
    ,data_hora_coletada datetime default current_timestamp
    ,fk_sensor int
    ,foreign key (fk_sensor) REFERENCES tbSensor (id_sensor)
    );

CREATE TABLE tbQuadrante (
	id_quadrante INT PRIMARY KEY auto_increment
    ,descricao_quadrante varchar (100)
    ,data_instalacao datetime default current_timestamp
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
																				 ,('Ativo',0,'0')
																				 ,('Ativo',21.8,'91')
                                                                                 ,('Inativo',0,'0');

select * from tbSensor;


insert into tbQuadrante (descricao_quadrante, fk_empresa, fk_sensor) VALUES ('area_1',1,1)
																		   ,('area_2',2,2)
																		   ,('area_3',3,3)
																		   ,('area_4',4,4)
																		   ,('area_5',5,5);
                                                                           
select*from tbEmpresa;
select*from tbFuncionario;
select*from tbSensor;
select*from tbDadosColetados;
select*from tbQuadrante;
