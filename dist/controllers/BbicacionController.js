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
exports.PostUbicacion = exports.GetUbicacion = exports.GetUbicaciones = void 0;
const sequelize_1 = require("sequelize");
const ubicacion_1 = __importDefault(require("../models/ubicacion"));
const GetUbicaciones = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const ubicaciones = yield ubicacion_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los tipoper activos true
            }
        }
    });
    res.json({
        ubicaciones
    });
});
exports.GetUbicaciones = GetUbicaciones;
const GetUbicacion = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const ubicaciones = yield ubicacion_1.default.findByPk(id);
    if (ubicaciones) {
        res.json({
            ubicaciones
        });
    }
    else {
        res.status(404).json({
            msg: `ubicación no encontrado con el ID ${id}`
        });
    }
});
exports.GetUbicacion = GetUbicacion;
const PostUbicacion = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    console.log(body);
    try {
        const ubicaciones = ubicacion_1.default.build(body);
        yield ubicaciones.save();
        res.json(ubicaciones);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostUbicacion = PostUbicacion;
//# sourceMappingURL=BbicacionController.js.map