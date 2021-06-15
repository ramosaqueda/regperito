"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.GetTipoAct = exports.GetTipoActs = void 0;
const sequelize_1 = require("sequelize");
const tipo_actividad_1 = __importDefault(require("../models/tipo_actividad"));
const GetTipoActs = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const tipoact = yield tipo_actividad_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los tipoact activos true
            }
        }
    });
    res.json({
        tipoact
    });
});
exports.GetTipoActs = GetTipoActs;
const GetTipoAct = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const tipoact = yield tipo_actividad_1.default.findByPk(id);
    if (tipoact) {
        res.json({
            tipoact
        });
    }
    else {
        res.status(404).json({
            msg: `tipoact no encontrado con el ID ${id}`
        });
    }
});
exports.GetTipoAct = GetTipoAct;
//# sourceMappingURL=Tipo_actividadController.js.map