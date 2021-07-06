"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const UbicacionController_1 = require("../controllers/UbicacionController");
const router = express_1.Router();
router.get('/', UbicacionController_1.GetUbicaciones);
router.get('/:id', UbicacionController_1.GetUbicacion);
router.post('/', UbicacionController_1.PostUbicacion);
/*router.put('/:id',  PutEstado);
router.delete('/:id',DeleteEstado);*/
exports.default = router;
//# sourceMappingURL=UbicacionRoute.js.map