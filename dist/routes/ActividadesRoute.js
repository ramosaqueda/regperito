"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const ActiviadesController_1 = require("../controllers/ActiviadesController");
const router = express_1.Router();
router.get('/', ActiviadesController_1.GetActividades);
router.get('/per_id/:id', ActiviadesController_1.GetActividadxruc);
router.get('/:id', ActiviadesController_1.GetActividad);
router.post('/', ActiviadesController_1.PostActividades);
router.put('/:id', ActiviadesController_1.PutActividades);
router.delete('/:id', ActiviadesController_1.DeleteActividad);
exports.default = router;
//# sourceMappingURL=ActividadesRoute.js.map