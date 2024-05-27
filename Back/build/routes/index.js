"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const routesProduct_1 = __importDefault(require("./routesProduct"));
const routesUser_1 = __importDefault(require("./routesUser"));
const routesCategory_1 = __importDefault(require("./routesCategory"));
const routesOrder_1 = __importDefault(require("./routesOrder"));
const routesReview_1 = __importDefault(require("./routesReview"));
const router = express_1.default.Router();
router.use('/product', routesProduct_1.default);
router.use('/user', routesUser_1.default);
router.use('/category', routesCategory_1.default);
router.use('/order', routesOrder_1.default);
router.use('/review', routesReview_1.default);
exports.default = router;