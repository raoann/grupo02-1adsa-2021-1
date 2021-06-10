'use strict';

/* 
lista e explicação dos Datatypes:
https://codewithhugo.com/sequelize-data-types-a-practical-guide/
*/

module.exports = (sequelize, DataTypes) => {
    let Leitura = sequelize.define('Leitura',{	
		id_DadosColetados: {
			field: 'id_DadosColetados',
			type: DataTypes.INTEGER,
			primaryKey: true,
			autoIncrement: true
		},	
		temperatura_coletada: {
			field: 'temperatura_coletada',
			type: DataTypes.REAL,
			allowNull: false
		},
		umidade_coletada: {
			field: 'umidade_coletada',
			type: DataTypes.REAL,
			allowNull: false
		},
		data_hora_coletada: {
			field: 'data_hora_coletada',
			type: DataTypes.DATE, // NÃO existe DATETIME. O tipo DATE aqui já tem data e hora
			allowNull: false
		},
		momento_grafico: {
			type: DataTypes.VIRTUAL, // campo 'falso' (não existe na tabela). Deverá ser preenchido 'manualmente' no select
			allowNull: true
		}
	}, 
	{
		tableName: 'Leitura', 
		freezeTableName: true, 
		underscored: true,
		timestamps: false,
	});

    return Leitura;
};
