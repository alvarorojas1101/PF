import nodemailer from 'nodemailer';
import dotenv from "dotenv";

dotenv.config();

export const transporter = nodemailer.createTransport({
host: 'smtp.gmail.com',
 port: 587,
 auth: {
 user: process.env.EMAIL_ELECTROEMPORIUM,
 pass: process.env.PASSWORD_ELECTROEMPORIUM
},
tls: {
    rejectUnauthorized: false // Desactiva la verificación del certificado
  }   
});
