"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const Tipo_actividadController_1 = require("../controllers/Tipo_actividadController");
const router = express_1.Router();
router.get('/', Tipo_actividadController_1.GetTipoActs);
router.get('/:id', Tipo_actividadController_1.GetTipoAct);
exports.default = router;
//# sourceMappingURL=TipoActRoute.js.map