import express from "express"
import getAllProducts  from './routes/getAllProducts' ;
import  getProductByName from "./routes/getProductByName";
import getProductById from "./routes/getProductById";
const session = require('express-session');
const passport = require('passport');
const Auth0Strategy = require('passport-auth0');
require('dotenv').config();

const app = express()


// Configuración de la sesión
app.use(session({
  secret: 'your-secret',
  resave: false,
  saveUninitialized: true,
}));

// Inicializar Passport y Auth0
const strategy = new Auth0Strategy(
  {
    domain: process.env.AUTH0_DOMAIN,
    clientID: process.env.AUTH0_CLIENT_ID,
    clientSecret: process.env.AUTH0_CLIENT_SECRET,
    callbackURL: 'http://localhost:3000/MiPerfil'
  },
  function( profile: any, done: Function) {
   // accessToken: string, refreshToken: string, extraParams: any,
    return done(null, profile);
  }
);

app.use(passport.initialize());
app.use(passport.session());

// Configurar Passport para usar la estrategia de Auth0
passport.use(strategy);

// Guardar el perfil de usuario en la sesión
passport.serializeUser(function(user: any, done: any) {
  done(null, user);
});

passport.deserializeUser(function(user: any, done:any) {
  done(null, user);
});

// Rutas de inicio de sesión y cierre de sesión
app.get('/login', passport.authenticate('auth0'));
app.get('/callback', passport.authenticate('auth0', { failureRedirect: '/login' }), function(_req, res) {
  // Redirigir al usuario después de iniciar sesión exitosamente
  res.redirect('/');
});




app.use(express.json()) // middleware que transforma la req.body a un json
app.use((_req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://localhost:5173'); // update to match the domain you will make the request from
    res.header('Access-Control-Allow-Credentials', 'true');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
  });

const PORT = 3000

app.get ('/products', getAllProducts);
app.get ('/products/:name', getProductByName);
app.get ('/products/:id', getProductById);


app.get('/ping', (_req, res) => {
    console.log('someone pinged here!!');
    res.send('pong');
});


app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`)
})