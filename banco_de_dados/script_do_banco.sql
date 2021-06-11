CREATE DATABASE bd_oaktruffle;

use bd_oaktruffle;

select*from tbTestes;


CREATE TABLE tbEmpresa (
	id_empresa INT PRIMARY KEY auto_increment
    ,nome_empresa varchar (100) not null
    ,cnpj_empresa varchar (100) not null
    ,estado_empresa varchar (100) not null
    ,cidade_empresa varchar (100) not null
    ,bairro_empresa varchar (100) not null
    ,logradouro_empresa varchar (100) not null
    ,cep_empresa char (10) not null
);

CREATE TABLE tbFuncionario (
	id_funcionario INT PRIMARY KEY auto_increment
    ,nome_funcionario varchar (100) not null
    ,email_funcionario varchar (100) not null
    ,senha_funcionario varchar (100) not null
    ,dataNasc_funcionario date  not null
    ,cpf_funcionario varchar (15) not null
    ,fkEmpresa int 
    ,FOREIGN KEY (fkEmpresa) references tbEmpresa (id_empresa)
);

CREATE TABLE tbQuadrante (
	id_quadrante INT PRIMARY KEY auto_increment
    ,descricao_quadrante varchar (100)
    ,data_instalacao datetime default current_timestamp
    ,fkEmpresa int
    ,FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa (id_empresa)
);

CREATE TABLE tbSensor (
	id_sensor INT PRIMARY KEY auto_increment
    ,tipo_sensor varchar (30) DEFAULT 'dht11'
    ,status_sensor varchar(30) Check ( status_sensor ='Ativo' or status_sensor ='Inativo')
    ,fkQuadrante int 
    ,foreign key (fkQuadrante) references tbQuadrante(id_quadrante)
);

CREATE TABLE tbDadosColetados(
	id_DadosColetados int primary key auto_increment
	,temperatura_coletada float not null
    ,umidade_coletada float not null
    ,data_hora_coletada datetime default current_timestamp
    ,fkSensor int
    ,foreign key (fkSensor) REFERENCES tbSensor (id_sensor)
    );
    
create table tbTestes(
	id_teste int primary key auto_increment
    ,nome_teste varchar (45)
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
							
                            
insert into tbQuadrante (descricao_quadrante, fkEmpresa) VALUES ('area_1','1')
																,('area_2','2')
																,('area_3','3')
																,('area_4','4')
																,('area_5','5');
                                                                                                              
insert into tbSensor (status_sensor,fkQuadrante) VALUES ('Ativo',2)
														,('Ativo',1)
														,('Ativo',3)
														,('Inativo',4)
														,('Inativo',5);
                                                        
insert into tbDadosColetados (temperatura_coletada, umidade_coletada,fkSensor) values('22.2',91.2 ,'1')
																					,('23.0',91.2 ,'2')
																					,('22.7',91.4 ,'3')
																					,('0',0,'4')
																					,('0',0,'5');
                                                                                    

select * from tbSensor;

                                                                           
select*from tbEmpresa;
select*from tbFuncionario;
select*from tbSensor;
select*from tbDadosColetados;
select*from tbQuadrante;


select * from tbEmpresa as emp join tbFuncionario as func on func.fkEmpresa = emp.id_empresa
							   join tbQuadrante as qua on qua.fkEmpresa = emp.id_empresa
                               join tbSensor as sen on sen.fkQuadrante = qua.id_quadrante
                               join tbDadosColetados as dad on dad.fkSensor = sen.id_sensor;
                               
select * from tbEmpresa as emp join tbFuncionario as func on func.fkEmpresa = emp.id_empresa
							   join tbQuadrante as qua on qua.fkEmpresa = emp.id_empresa
                               join tbSensor as sen on sen.fkQuadrante = qua.id_quadrante
                               join tbDadosColetados as dad on dad.fkSensor = sen.id_sensor
                               where emp.nome_empresa like 'Multi%';
                               							
select*from tbFuncionario;
		
desc tbfuncionario;

