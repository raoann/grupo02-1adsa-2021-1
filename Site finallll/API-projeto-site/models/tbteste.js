	'use strict';

	/* 
	lista e explicação dos Datatypes:
	https://codewithhugo.com/sequelize-data-types-a-practical-guide/
	*/

	/*create table tbTeste(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_teste varchar(45)
	); TABELA QUE TEM QUE CRIAR PARA O TESTE FUNCIONAR*/ 

	module.exports = (sequelize, DataTypes) => {
		let tbteste = sequelize.define('tbteste', {
			id: {
				field: 'id',
				type: DataTypes.INTEGER,
				primaryKey: true,
				autoIncrement: true
			},
			nome_teste: {
				field: 'nome_teste',
				type: DataTypes.STRING,
				allowNull: false
			}
		}, {
			tableName: 'tbteste',
			freezeTableName: true,
			underscored: true,
			timestamps: false,
		});

		return tbteste;
	};