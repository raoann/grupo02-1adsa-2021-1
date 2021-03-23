CREATE DATABASE bdHephaestos;

USE bdHephaestos;

create table tbUsuario(
	id_usuario int primary key auto_increment
    	,nome_usuario varchar(100)
    	,email_institucional_usuario varchar(100)
    	,senha_usuario varchar(100)
    	,data_nascimento_usuario datetime
    	,cpf_usuario varchar(15)
    	,CEP_usuario varchar(100)
    	,estado_usuario varchar(100)
    	,cidade_usuario varchar(100)
    	,bairro_usuario varchar(100)
    	,logradouro_usuario varchar(100)
		,numeroCasa_usuario varchar(100)
    	,acesso_usuario boolean
);

create table tbEmpresa(
	id_empresa int primary key auto_increment
    	,nome_empresa varchar(100)
    	,cnpj_empresa varchar(100)
    	,estado_empresa varchar(100)
    	,cidade_empresa varchar(100)
    	,bairro_empresa varchar(100)
    	,logradouro_empresa varchar(100)
    	,CEP_empresa varchar(100)
);


create table tbEstufa(
	id_estufa int primary key auto_increment
	,descrição_estufa varchar(100)
	,id_empresa int
);



create table tbTemperatura(
	id_temperatura int primary key auto_increment
	,valor_temperatura float
	,momento_temperatura datetime default current_timestamp
);

insert into tbTemperatura values 
(null,24.2,null);

select*from tbTemperatura;



create table tbUmidade(
	id_umidade int primary key auto_increment
	,valor_umidade float
	,momento_umidade datetime default current_timestamp
);


create table tbSensor(
	id_sensor int primary key auto_increment
    ,estufa varchar(40)
    ,empresa varchar(40)
);

create table dados_coletados(
	temperatura varchar(5)
    ,umidade varchar(5)
    ,data_hora datetime default current_timestamp
    );
    

insert into dados_coletados(temperatura, umidade) values(
	('22','95'),
    ('21','93'),
    ('21','92'),
    ('22','97')
);


CREATE TABLE sensor (
	idSensor int primary key auto_increment,
    nomeSensor varchar(100),
    localSensor varchar(50),
    temperatura float not null, -- decimal(5,2) 999,99
    dataTemp datetime default current_timestamp,
    statusSensor varchar(30),
    CHECK (statusSensor = 'ativo' or statusSensor = 'inativo')
) auto_increment = 10000;

INSERT INTO sensor (idSensor, nomeSensor, localSensor, 
								temperatura, statusSensor) values 
	(null,'D','Estufa Alfa',21.4, 'ativo'),
    (null,'B','Estufa Alfa',12.5, 'ativo'),
    (null,'A','Estufa Beta',22.2, 'ativo'),
    (null,'A','Estufa Delta',20.4, 'ativo'),
    (null,'C','Estufa Alfa',15.6, 'inativo'),
    (null,'A','Estufa Delta',19.8, 'ativo'),
    (null,null,'Estufa Delta',17.7, 'inativo');

select * from tbusuario;
select * from tbempresa;
select * from tbsensor;

update tbSensor set id_temperatura = 29 WHERE id_sensor = 1;
update tbSensor set id_umidade = 95 WHERE id_sensor = 1;



/*create table tbEmpresaUsuario(
	id_empresaUsuario int primary key auto_increment
	,id_empresa int
	,id_usuario int
	,email_institucional varchar(70)
);
drop table tbempresausuario;

-- NAO USAMOS ESSA DESCULPA :(
create table tbSensor(
	id_sensor int primary key auto_increment
	,id_estufa int
	,id_temperatura int
	,id_umidade int
);

drop table tbSensor;
*/

insert into tbUsuario values
(null, 'Mateus Ferreira', 'mateus@bandtec.com', 'urubu100','2001/05/31', '000.000.000-00', '00000-000', 'SP', 'Santo André',
'Palmares', 'sítio', '112',false),
(null, 'Antonio Augusto', 'antonio.augusto@bandtec.com.br', 'urubu101','1997/05/07', '111.111.111-11', '11111-111', 'SP', 'Santo André',
'casa', 'apartamento', '1042', false),
(null, 'Wesley Paternezi', 'wesley.paternezi@bandtec.com.br', 'urubu102','1997/03/25', '222.222.222-22', '22222-222', 'SP', 'São Caetano do Sul',
'Jardins', 'casa', '271', true);

select * from tbUsuario;

insert into tbEmpresa values
(null, 'OakTruffle', '00.000.000/0000-01', 'MG', 'Ouro Preto', 'Catedral Metropolitana', 'prédio comercial', '000.000.000-01'),
(null, 'Santa Luzia', '00.000.000/0000-02', 'SP', 'São Paulo', 'Penha', 'prédio comercial', '000.000.000-02');

select * from tbEmpresa;

insert into tbEmpresaUsuario values 
(null, '1', '2', 'antonio@oaktruffle.com'),
(null, '2', '3', 'wesley@santaluzia.com');

select * from tbusuario;

/*
tbempresa usuario
tbempresa
tbusuario
*/

select*from tbusuario where id_usuario=1;
select*from tbusuario where  nome_usuario like '%e%';

select*from tbusuario where data_nascimento_usuario = '2001-05-31';

select*from tbusuario order by data_nascimento_usuario desc;


select*from tbusuario where cidade_usuario = 'Santo André';

select*from tbTemperatura;

select*from tbUmidade;

insert into tbUmidade values 
(null,99,null);

insert into tbUmidade (valor_umidade) values 
			(95);
            

insert into tbSensor (id_sensor,id_estufa,id_temperatura_sensor,id_umidade) values
					  (1,1,1,1);
                      
insert into tbSensor (id_sensor,id_estufa,id_temperatura_sensor,id_umidade) values
					 (2,2,2,2);
                     


















select*from tbsensor where id_sensor=1;

select*from tbTemperatura,tbSensor where id_temperatura=id_temperatura_sensor;




-- select*from tbUsuario;

-- update tbUsuario set nome_usuario = 'Mateus Araujo' where id_usuario=1;

-- delete from tbUsuario where id_usuario=2;

-- insert into tbUsuario (nome_usuario,email_institucional_usuario,senha_usuario,data_nascimento_usuario,cpf_usuario,CEP_usuario) values
	('Antonio Monteiro','antoniomonteiro@gmail.com','antonio123','1997/08/01','19856458945','08452020')


















