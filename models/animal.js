const { DataTypes } = require('sequelize');
const db = require('../models/db');

const Animal = db.define('Animal', {
    nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    especie: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    sexo: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    porte: {
        type: DataTypes.STRING,
        allowNull: false,
    },    
    disponivel_doacao: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: 'S', // Defina o valor padrão para 'S' (disponível para adoção)
    },
    perdido: {
        type: DataTypes.STRING, // Defina o tipo de dados como STRING
        allowNull: false,
        defaultValue: 'N', // Defina o valor padrão para 'N' (não perdido)
    },
});

module.exports = Animal;
