"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const FiscalController_1 = require("../controllers/FiscalController");
const router = express_1.Router();
router.get('/', FiscalController_1.GetFiscales);
router.get('/:id', FiscalController_1.GetFiscal);
router.post('/', FiscalController_1.PostFiscal);
router.put('/:id', FiscalController_1.PutFiscal);
router.delete('/:id', FiscalController_1.DeleteFiscal);
exports.default = router;
//# sourceMappingURL=FiscalRoute.js.map