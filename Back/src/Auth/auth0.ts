import express from "express";
import { expressjwt as jwt } from "express-jwt";
import jwksRsa from "jwks-rsa";
import { Pool } from "pg";
import dotenv from "dotenv";

dotenv.config();

const app = express();
app.use(express.json());

const pool = new Pool({
  connectionString: process.env.URL, // Asegúrate de que esta variable de entorno esté configurada
  ssl: {
    rejectUnauthorized: false,
  },
});

// Middleware para verificar el token de Auth0
const checkJwt = jwt({
  secret: jwksRsa.expressJwtSecret({
    cache: true,
    rateLimit: true,
    jwksRequestsPerMinute: 5,
    jwksUri: `https://${process.env.AUTH0_DOMAIN}/.well-known/jwks.json`,
  }) as any, // Añadir tipo `any` temporalmente si TypeScript muestra errores de tipo
  audience: process.env.AUTH0_AUDIENCE,
  issuer: `https://${process.env.AUTH0_DOMAIN}/`,
  algorithms: ["RS256"],
});

// Ruta para registrar o actualizar el perfil del usuario
app.post("/user", checkJwt, async (req, res) => {
  let {
    name,
    email,
    password,
    typeuser,
    address,
    country,
    city,
    state,
    postalcode,
  } = req.body.user;

  // Asignar valores predeterminados si no se proporcionan
  if (!password) {
    password = "default_password"; // Mejor generar una contraseña segura
  }
  if (!typeuser) {
    typeuser = "USER";
  }
  address = address || "";
  country = country || "";
  city = city || "";
  state = state || "";
  postalcode = postalcode || "";

  try {
    const client = await pool.connect();
    const result = await client.query("SELECT * FROM users WHERE email = $1", [
      email,
    ]);

    if (result.rows.length === 0) {
      // El usuario no existe, insertarlo
      await client.query(
        "INSERT INTO users (name, email, password, typeuser, address, country, city, state, postalcode) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)",
        [
          name,
          email,
          password,
          typeuser,
          address,
          country,
          city,
          state,
          postalcode,
        ]
      );
    } else {
      // El usuario existe, actualizar su información
      await client.query(
        "UPDATE users SET name = $1, password = $2, typeuser = $3, address = $4, country = $5, city = $6, state = $7, postalcode = $8 WHERE email = $9",
        [
          name,
          password,
          typeuser,
          address,
          country,
          city,
          state,
          postalcode,
          email,
        ]
      );
    }
    client.release();
    res.send({ message: "Usuario registrado/actualizado correctamente" });
  } catch (error) {
    console.error("Error al registrar/actualizar el usuario:", error);
    res.status(500).send({ error: "Error al registrar/actualizar el usuario" });
  }
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});