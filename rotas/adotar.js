const express = require('express');
const router = express.Router();
const animalController = require('../controladores/animalController');
const path = require('path');
console.log('Rota /adotar acessada');

// Rota GET para adotar
router.get('/adotar', (req, res) => {
    const filePath = path.join(__dirname, '..', 'public', 'html', 'adotar.html');
    res.sendFile(filePath);
});

// Rota POST para processar a pesquisa de animais
router.post('/adotar', async (req, res) => {
    try {
        const filters = req.body; // Obtenha os filtros do corpo da solicitação

        // Chame a função de pesquisa no controller
        const resultados = await animalController.searchAnimals(filters);

        // Envie os resultados como resposta
        res.render('adotar', { resultados });
    } catch (error) {
        console.error('Erro ao pesquisar animais:', error);
        res.status(500).send('Erro ao pesquisar animais.');
    }
});

module.exports = router;
