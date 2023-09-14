const express = require('express');
const app = express();
const port = 8080;

// Configurar o middleware para servir arquivos estáticos da pasta "public"
app.use(express.static('public'));

const db = require('./models/db');

// rotas
app.get('/', async (req, res) => {
    res.send("Página inicial teste - Arquivo app.js");
});

app.post('/cadastrarusuario', async (req, res) => {
    res.send("Cadastrar Usuário");
});

// console log de conexão com bd
app.listen(port, () => {
    console.log("Servidor iniciado porta 8080: http://localhost:8080");
});