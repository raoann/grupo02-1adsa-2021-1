'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let tbEmpresa = sequelize.define('tbEmpresa',{	
		id_empresa: {
			field: 'id_empresa',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		nome_empresa: {
			field: 'nome_empresa',
			type: DataTypes.STRING,
			allowNull: false
		},
		cnpj_empresa: {
			field: 'cnpj_empresa',
			type: DataTypes.STRING,
			allowNull: false
		},
		estado_empresa: {
			field: 'estado_empresa',
			type: DataTypes.STRING, 
			allowNull: false
		},
		cidade_empresa: {
			field: 'cidade_empresa',
			type: DataTypes.STRING, 
			allowNull: false
		},
		bairro_empresa: {
			field: 'bairro_empresa',
			type: DataTypes.STRING, 
			allowNull: true
		},
        logradouro_empresa:{
            field: 'logradouro_empresa',
            type: DataTypes.STRING,
            allowNull: true
        },
        cep_empresa: {
            field: 'cep_empresa',
            type: DataTypes.CHAR,
            allowNull: true
        }
	}, 
	{
		tableName: 'tbEmpresa', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return tbEmpresa;
};
