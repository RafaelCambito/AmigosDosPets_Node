const Sequelize = require('sequelize');
const db = require('../models/db');

const Petencontrado = db.define('Petencontrado', {
    id_pet: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    especie_encontrado: {
        type: Sequelize.STRING(50),
        allowNull: false
    },
    user_id: {
        type: Sequelize.INTEGER,
        allowNull: false
    },
    data_encontrado: {
        type: Sequelize.DATE,
        allowNull: false
    },
    cidade_encontrado: {
        type: Sequelize.STRING(50),
        allowNull: false
    },
    local_encontrado: {
        type: Sequelize.STRING(50)
    },
    detalhes_encontrado: {
        type: Sequelize.STRING(50)
    },
    foto_encontrado: {
        type: Sequelize.STRING(255),
        allowNull: false
    },
    situacao_encontrado: {
        type: Sequelize.STRING(1)
    }
}, {
    tableName: 'petencontrado', // Especifica o nome da tabela
    timestamps: false // Desativa a inclusão automática de createdAt e updatedAt
});

module.exports = Petencontrado;
