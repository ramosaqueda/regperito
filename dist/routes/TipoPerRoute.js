"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const Tipo_peritajeController_1 = require("../controllers/Tipo_peritajeController");
const router = express_1.Router();
router.get('/', Tipo_peritajeController_1.GetTipoPers);
router.get('/:id', Tipo_peritajeController_1.GetTipoPer);
router.post('/', Tipo_peritajeController_1.PostTipoPer);
router.put('/:id', Tipo_peritajeController_1.PutTipoPer);
router.delete('/:id', Tipo_peritajeController_1.DeleteTipoPer);
exports.default = router;
//# sourceMappingURL=TipoPerRoute.js.map