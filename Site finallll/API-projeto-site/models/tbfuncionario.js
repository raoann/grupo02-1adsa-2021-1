'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let tbFuncionario = sequelize.define('tbFuncionario',{	
		id_funcionario: {
			field: 'id_funcionario',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		nome_funcionario: {
			field: 'nome_funcionario',
			type: DataTypes.STRING,
			allowNull: false
		},
		email_funcionario: {
			field: 'email_funcionario',
			type: DataTypes.STRING,
			allowNull: false
		},
		senha_funcionario: {
			field: 'senha_funcionario',
			type: DataTypes.STRING, 
			allowNull: false
		},
		dataNasc_funcionario: {
			field: 'dataNasc_funcionario',
			type: DataTypes.DATE, 
			allowNull: false
		},
		cpf_funcionario: {
			field: 'cpf_funcionario',
			type: DataTypes.STRING, 
			allowNull: true
		},
		fkEmpresa: {
			field: 'fkEmpresa',
			type: DataTypes.INTEGER, 
			allowNull: false
		},
	}, 
	{
		tableName: 'tbFuncionario', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return tbFuncionario;
};
