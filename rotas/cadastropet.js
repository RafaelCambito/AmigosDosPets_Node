const express = require('express');
const router = express.Router();
const path = require('path');
const Pet = require('../models/pet'); // Importe o modelo User que representa a tabela de usuários



router.get('/cadastropet', (req, res) => {
    const filePath = path.join(__dirname, '..', 'public', 'html', 'cadastropet.html');
    res.sendFile(filePath);
  });
  


  router.post('/cadastropet', (req, res) => {
    // Obtenha o ID do usuário autenticado ou fornecido
    // const userId comentada tempoariamente até fazer o processo de autenticação de usuário
    // const userId = req.user.id; // Isso pode variar dependendo da sua implementação de autenticação
  
    // Extraia os dados do formulário do corpo da solicitação
    const {
      nome_pet,
      especie_pet,
      sexo_pet,
      idade_pet,
      porte_pet,
      foto_pet,
      sobre_pet
    } = req.body;
  
    // Agora você pode usar o userId para vincular o pet ao usuário ao inserir no banco de dados
    Pet.create({
      nome_pet,
      tutor_pet: userId, // Aqui vinculamos o pet ao usuário pelo ID
      especie_pet,
      sexo_pet,
      idade_pet,
      porte_pet,
      foto_pet,
      sobre_pet
    }).then(pet => {
      console.log('Pet cadastrado com sucesso:', pet.toJSON());
      res.send('Cadastro do pet realizado com sucesso!'); // Envia uma mensagem de sucesso
    }).catch(err => {
      console.error('Erro ao cadastrar pet:', err);
      res.status(500).send('Erro ao cadastrar pet.'); // Envia uma mensagem de erro com status 500
    });
  });
  

  module.exports = router;
