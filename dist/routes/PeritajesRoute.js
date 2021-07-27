"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const PeritajesController_1 = require("../controllers/PeritajesController");
const router = express_1.Router();
router.get('/', PeritajesController_1.GetPeritajes);
router.get('/:id', PeritajesController_1.GetPeritaje);
router.get('/month/:ano', PeritajesController_1.GetPeritajesByMonth);
router.get('/ruc/:ruc', PeritajesController_1.GetPeritajeporuc);
router.post('/', PeritajesController_1.PostPeritajes);
router.put('/:id', PeritajesController_1.PutPeritajes);
router.delete('/:id', PeritajesController_1.DeletePeritaje);
exports.default = router;
//# sourceMappingURL=PeritajesRoute.js.map