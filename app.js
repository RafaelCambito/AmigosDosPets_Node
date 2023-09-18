const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 8080;

app.use(express.static(__dirname + '/public'));

// Configurar o body-parser para analisar dados do formulário
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Middleware para verificar o carregamento de rotas
app.use((req, res, next) => {
    console.log('Rota acessada:', req.url);
    next();
});

// Configurar rotas
const rotas = require('./rotas/testecadbd'); // Importar o arquivo de rotas
app.use('/', rotas); // Usar as rotas

// importa rota cadastra usuario
const rotasCadastraUsuario = require('./rotas/cadastrausuario'); // Importar o arquivo de rotas
app.use('/', rotasCadastraUsuario); // Usar as rotas

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor em execução na porta ${port}`);
});
