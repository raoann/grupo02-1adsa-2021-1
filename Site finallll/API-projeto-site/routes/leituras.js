var express = require('express');
var router = express.Router();
var sequelize = require('../models').sequelize;
var Leitura = require('../models').Leitura;
var env = process.env.NODE_ENV || 'development';

/* Recuperar as últimas N leituras */
router.get('/ultimas/:idcultivo', function(req, res, next) {
	
	// quantas são as últimas leituras que quer? 7 está bom?
	const limite_linhas = 7;

	var idcultivo = req.params.idcultivo;

	console.log(`Recuperando as ultimas ${limite_linhas} leituras`);
	
	let instrucaoSql = "";

	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = 
		`select 
		temperatura_coletada, 
		umidade_coletada, 
		data_hora_coletada as n,
		DATE_FORMAT(data_hora_coletada,'%H:%i:%s') as momento_grafico
		from leitura
		where fksensor = ${idcultivo}
		order by id_DadosColetados desc limit ${limite_linhas}`;


	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = 

		`select top ${limite_linhas} 
		temperatura_coletada, 
		umidade_coletada, 
		data_hora_coletada as n,
		FORMAT(data_hora_coletada,'HH:mm:ss') as momento_grafico
		from dbo.leitura as leit
		where leit.fksensor = ${idcultivo}
		order by id_DadosColetados desc`;


	} else {
		console.log("\n\n\n\nVERIFIQUE O VALOR DE LINHA 1 EM APP.JS!\n\n\n\n")
	}
	
	sequelize.query(instrucaoSql, {
		model: Leitura,
		mapToModel: true 
	})
	.then(resultado => {
		console.log(`Encontrados: ${resultado.length}`);
		res.json(resultado);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});


router.get('/tempo-real/:idcultivo', function(req, res, next) {
	const limite_linhas = 7;

	console.log('Recuperando as ultimas ${limite_linhas} leituras ');

	
	//var idcaminhao = req.body.idcaminhao; // depois de .body, use o nome (name) do campo em seu formulário de login
	var idcultivo = req.params.idcultivo;

	
	let instrucaoSql = "";
	
	if (env == 'dev') {
		// abaixo, escreva o select de dados para o Workbench
		instrucaoSql = 
		`select temperatura_coletada, umidade_coletada, 
		DATE_FORMAT(data_hora_coletada,'%H:%i:%s') 
		as momento_grafico, fksensor from leitura where fksensor = ${idcultivo} order by id_DadosColetados desc limit 1`;

	} else if (env == 'production') {
		// abaixo, escreva o select de dados para o SQL Server
		instrucaoSql = 

		`select top ${limite_linhas} 
		temperatura_coletada, 
		umidade_coletada, 
		data_hora_coletada,
		FORMAT(data_hora_coletada,'HH:mm:ss') as momento_grafico
		from leitura as leit
		where leit.fksensor = ${idcultivo}
		order by id_DadosColetados desc`;


	} else {
		console.log("\n\n\n\nVERIFIQUE O VALOR DE LINHA 1 EM APP.JS!\n\n\n\n")
	}
	
	console.log(instrucaoSql);
	
	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
	.then(resultado => {
		res.json(resultado[0]);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});

// estatísticas (max, min, média, mediana, quartis etc)
router.get('/estatisticas', function (req, res, next) {
	
	console.log(`Recuperando as estatísticas atuais`);

	const instrucaoSql = `select 
							max(temperatura_coletada) as temp_maxima, 
							min(temperatura_coletada) as temp_minima, 
							avg(temperatura_coletada) as temp_media,
							max(umidade_coletada) as umidade_maxima, 
							min(umidade_coletada) as umidade_minima, 
							avg(umidade_coletada) as umidade_media 
						from leitura`;
					

	sequelize.query(instrucaoSql, { type: sequelize.QueryTypes.SELECT })
		.then(resultado => {
			res.json(resultado[0]);
		}).catch(erro => {
			console.error(erro);
			res.status(500).send(erro.message);
		});
  
});


module.exports = router;
