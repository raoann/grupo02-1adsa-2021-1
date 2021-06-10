var express = require('express');
var router = express.Router();
// var sequelize = require('../models').sequelize;
var tbEmpresa = require('../models').tbEmpresa;

// let sessoes = [];

/* Recuperar usuário por login e senha 
router.post('/autenticar', function (req, res, next) {
	console.log('Recuperando usuário por login e senha');

	var login_backend = req.body.login_html; // depois de .body, use o nome (name) do campo em seu formulário de login
	var senha = req.body.senha; // depois de .body, use o nome (name) do campo em seu formulário de login	

	let instrucaoSql = `select * from tbFuncionario where email_funcionario='${login_backend}' and senha_funcionario='${senha}'`;
	console.log(instrucaoSql);

	sequelize.query(instrucaoSql, {
		model: tbFuncionario
	}).then(resultado => {
		console.log(`Encontrados: ${resultado.length}`);

		if (resultado.length == 1) {
			sessoes.push(resultado[0].dataValues.login);
			console.log('sessoes: ', sessoes);
			res.json(resultado[0]);
		} else if (resultado.length == 0) {
			res.status(403).send('Login e/ou senha inválido(s)');
		} else {
			res.status(403).send('Mais de um usuário com o mesmo login e senha!');
		}

	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});*/

/* Cadastrar usuário */
router.post('/cadastrarr', function (req, res, next) {
	console.log('Criando um funcionario');

	tbEmpresa.create({
		nome_empresa: req.body.nome_empresa,
		cnpj_empresa: req.body.cnpj,
		logradouro_empresa: req.body.logradouro_empresa,
        bairro_empresa: req.body.bairro_empresa,
		cidade_empresa: req.body.cidade_empresa,
		estado_empresa: req.body.estado_empresa,
        cep_empresa: req.body.cep_empresa

	}).then(resultado => {
		console.log(`Registro criado: ${resultado}`)
		res.send(resultado);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});


/* Verificação de usuário 
router.get('/sessao/:login', function (req, res, next) {
	let login_backend = req.params.login_html;
	console.log(`Verificando se o usuário ${login_backend} tem sessão`);

	let tem_sessao = false;
	for (let u = 0; u < sessoes.length; u++) {
		if (sessoes[u] == login_backend) {
			tem_sessao = true;
			break;
		}
	}

	if (tem_sessao) {
		let mensagem = `Usuário ${login_backend} possui sessão ativa!`;
		console.log(mensagem);
		res.send(mensagem);
	} else {
		res.sendStatus(403);
	}

});*/


/* Logoff de usuário 
router.get('/sair/:login', function (req, res, next) {
	let login_backend = req.params.login_html;
	console.log(`Finalizando a sessão do usuário ${login_backend}`);
	let nova_sessoes = []
	for (let u = 0; u < sessoes.length; u++) {
		if (sessoes[u] != login_backend) {
			nova_sessoes.push(sessoes[u]);
		}
	}
	sessoes = nova_sessoes;
	res.send(`Sessão do usuário ${login_backend} finalizada com sucesso!`);
});*/


/* Recuperar todos os usuários 
router.get('/', function (req, res, next) {
	console.log('Recuperando todos os usuários');
	tbFuncionario.findAndCountAll().then(resultado => {
		console.log(`${resultado.count} registros`);

		res.json(resultado.rows);
	}).catch(erro => {
		console.error(erro);
		res.status(500).send(erro.message);
	});
});*/

module.exports = router;