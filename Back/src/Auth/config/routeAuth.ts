const express = require('express');
const authController = require('./verificacionToken');
import {checkJwt} from './verificacionToken';

const router = express.Router();

router.post('/authenticate', checkJwt, authController.authenticateUser);

module.exports = router;