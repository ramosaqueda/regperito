"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const PeritoController_1 = require("../controllers/PeritoController");
const router = express_1.Router();
router.get('/', PeritoController_1.GetPeritos);
router.get('/:id', PeritoController_1.GetPerito);
router.post('/', PeritoController_1.PostPerito);
router.put('/:id', PeritoController_1.PutPerito);
router.delete('/:id', PeritoController_1.DeletePerito);
exports.default = router;
//# sourceMappingURL=PeritosRoute.js.map