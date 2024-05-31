import express from 'express';
import { sendEmail } from '../utils/sendEmail';

const router = express.Router();

// Define la ruta para enviar el correo electrónico
router.post('/', sendEmail);

// Exporta el router
export default router;
