const express = require('express');
const session = require('express-session');
const sessionStore = require('./sessionconfig'); // Importe o arquivo de configuração da sessão
const bodyParser = require('body-parser');
const path = require('path'); // Importe o módulo 'path'

const app = express();
const port = 8080;

// Configurar express-session com o armazenamento personalizado
app.use(
    session({
      secret: '12345678',
      resave: false,
      saveUninitialized: true,
      store: sessionStore, // Use o armazenamento personalizado
    })
  );

// Configurar o mecanismo de visualização EJS
app.set('view engine', 'ejs');

// Configurar o diretório de visualização
app.set('views', path.join(__dirname, 'views'));


// static redirecionado para a pasta public
app.use(express.static(__dirname + '/public'));

// Configurar o body-parser para analisar dados do formulário
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Middleware para verificar o carregamento de rotas
app.use((req, res, next) => {
    console.log('Rota acessada:', req.url);
    next();
});

// Middleware para verificar se o usuário está autenticado
app.use((req, res, next) => {
    if (!req.session.userId && req.url !== '/login') { // Verifica se a rota não é /login
        res.redirect('/login');
    } else {
        next();
    }
});

// Configurar rotas
const rotas = require('./rotas/testecadbd'); // Importar o arquivo de rotas
app.use('/', rotas); // Usar as rotas

// importa rota login
const rotasLogin = require('./rotas/login'); // Importar o arquivo de rotas
app.use('/', rotasLogin); // Usar as rotas

// importa rota cadastra usuario
const rotasCadastraUsuario = require('./rotas/cadastrausuario'); // Importar o arquivo de rotas
app.use('/', rotasCadastraUsuario); // Usar as rotas

// importa rota cadastro pet
const rotasCadastroPet = require('./rotas/cadastropet'); // Importar o arquivo de rotas
app.use('/', rotasCadastroPet); // Usar as rotas

// Importe a rota do dashboard
const dashboardRoute = require('./rotas/dashboard');
app.use('/', dashboardRoute);

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor em execução na porta ${port}`);
});
