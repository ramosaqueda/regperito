"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const PeritajesHasEstadosController_1 = require("../controllers/PeritajesHasEstadosController");
const router = express_1.Router();
router.get('/', PeritajesHasEstadosController_1.GetPeritajesHasEstados);
router.get('/:id', PeritajesHasEstadosController_1.GetPeritajeHasEstado);
router.post('/', PeritajesHasEstadosController_1.PostPeritajeHasEstado);
router.put('/:id', PeritajesHasEstadosController_1.PutPeritajeHasEstado);
router.delete('/:id', PeritajesHasEstadosController_1.DeletePeritajeHasEstado);
exports.default = router;
//# sourceMappingURL=PeritajesHasEstadosRoute.js.map