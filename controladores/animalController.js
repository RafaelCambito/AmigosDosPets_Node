// animalController.js

const Animal = require('../models/animal'); // Importe o modelo do Animal

// Função para realizar a pesquisa de animais com base nos filtros
async function searchAnimals(filters) {
    try {
        const { especie, sexo, porte} = filters;

        // Construa a consulta com base nos filtros
        const where = {
            disponivel_doacao: 'S', // Apenas animais com campo "disponivel_doacao" igual a "S" (disponível para adoção)
        };

        if (especie) where.especie = especie;
        if (sexo) where.sexo = sexo;
        if (porte) where.porte = porte;

        console.log('Filtros:', filters); // Adicione este log para verificar os filtros recebidos

        // Realize a consulta no banco de dados
        const resultados = await Animal.findAll({ where });

        console.log('Resultados da consulta:', resultados); // Adicione este log para verificar os resultados da consulta

        return resultados;
    } catch (error) {
        console.error('Erro ao pesquisar animais:', error);
        throw error;
    }
}

module.exports = {
    searchAnimals,
};
