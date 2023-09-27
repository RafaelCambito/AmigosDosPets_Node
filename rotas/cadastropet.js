const express = require('express');
const router = express.Router();
const path = require('path');
const Pet = require('../models/pet'); // Importe o modelo User que representa a tabela de usuários
const requireAuth = require('../middlewares/authMiddleware'); // Importe o middleware de autenticação

// Rota GET para exibir o formulário de cadastro de pet
router.get('/cadastropet', requireAuth, (req, res) => {
    const filePath = path.join(__dirname, '..', 'public', 'html', 'cadastropet.html');
    res.sendFile(filePath);
});

// Rota POST para processar o envio do formulário de cadastro de pet
router.post('/cadastropet', requireAuth, async (req, res) => {
    // Obtenha o ID do usuário autenticado
    const user_id = req.user.id; // Isso pode variar dependendo da sua implementação de autenticação

    // Extraia os dados do formulário do corpo da solicitação
    const {
        nome_pet,
        especie_pet,
        sexo_pet,
        idade_pet,
        porte_pet,
        foto_pet,
        sobre_pet,
        disponivel_doacao, // Inclua disponivel_doacao
        perdido, // Inclua perdido
    } = req.body;

    try {
        // Agora você pode usar o userId para vincular o pet ao usuário ao inserir no banco de dados
        const pet = await Pet.create({
            nome_pet,
            user_id: user_id, // Aqui vinculamos o pet ao usuário pelo ID
            especie_pet,
            sexo_pet,
            idade_pet,
            porte_pet,
            foto_pet,
            sobre_pet,
            disponivel_doacao, // Inclua disponivel_doacao
            perdido, // Inclua perdido
        });

        console.log('Pet cadastrado com sucesso:', pet.toJSON());
        // Defina uma mensagem de sucesso na sessão
        req.session.successMessage = 'Cadastro do pet realizado com sucesso!';
        // Redirecione o usuário para o dashboard
        res.redirect('/dashboard');
    } catch (error) {
        console.error('Erro ao cadastrar pet:', error);
        res.status(500).send('Erro ao cadastrar pet.'); // Envia uma mensagem de erro com status 500
    }
});

module.exports = router;
