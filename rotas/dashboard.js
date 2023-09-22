// routes/dashboard.js

const express = require('express');
const router = express.Router();
const User = require('../models/user'); // Importe o modelo User
const Pet = require('../models/pet'); // Importe o modelo Pet

// Rota GET para o dashboard
router.get('/dashboard', async (req, res) => {
    try {
        // Recupere os detalhes do usuário a partir do ID da sessão
        const userId = req.session.userId;
        const user = await User.findByPk(userId);

        // Recupere os animais de estimação relacionados a esse usuário
        const pets = await Pet.findAll({ where: { userId: userId } });

        res.render('dashboard', { user, pets });
    } catch (error) {
        console.error('Erro ao acessar o dashboard:', error);
        res.status(500).send('Erro ao acessar o dashboard.');
    }
});

module.exports = router;
