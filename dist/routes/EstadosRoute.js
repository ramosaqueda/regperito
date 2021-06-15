"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const EstadosController_1 = require("../controllers/EstadosController");
const router = express_1.Router();
router.get('/', EstadosController_1.GetEstados);
router.get('/:id', EstadosController_1.GetEstado);
router.post('/', EstadosController_1.PostEstado);
router.put('/:id', EstadosController_1.PutEstado);
router.delete('/:id', EstadosController_1.DeleteEstado);
exports.default = router;
//# sourceMappingURL=EstadosRoute.js.map