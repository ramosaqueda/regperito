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
exports.DeletePeritajeHasEstado = exports.PutPeritajeHasEstado = exports.PostPeritajeHasEstado = exports.GetPeritajeHasEstado = exports.GetPeritajesHasEstados = void 0;
const sequelize_1 = require("sequelize");
const peritajes_has_estados_1 = __importDefault(require("../models/peritajes_has_estados"));
const GetPeritajesHasEstados = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const peritaje_has_estado = yield peritajes_has_estados_1.default.findAll({
        attributes: ["peritajes_id", "estados_id"],
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        }
    });
    res.json({
        peritaje_has_estado
    });
});
exports.GetPeritajesHasEstados = GetPeritajesHasEstados;
const GetPeritajeHasEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const peritaje_has_estado = yield peritajes_has_estados_1.default.findByPk(id);
    if (peritaje_has_estado) {
        res.json({
            peritaje_has_estado
        });
    }
    else {
        res.status(404).json({
            msg: `estado no encontrado con el ID ${id}`
        });
    }
});
exports.GetPeritajeHasEstado = GetPeritajeHasEstado;
const PostPeritajeHasEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    console.log(body);
    try {
        const peritaje_has_estado = peritajes_has_estados_1.default.build(body);
        yield peritaje_has_estado.save();
        res.json(peritaje_has_estado);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostPeritajeHasEstado = PostPeritajeHasEstado;
const PutPeritajeHasEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const peritaje_has_estado = yield peritajes_has_estados_1.default.findByPk(id);
        if (!peritaje_has_estado) {
            return res.status(404).json({
                msg: 'No existe un estado con el id ' + id
            });
        }
        yield peritaje_has_estado.update(body);
        res.json(peritaje_has_estado);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutPeritajeHasEstado = PutPeritajeHasEstado;
const DeletePeritajeHasEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const peritaje_has_estado = yield peritajes_has_estados_1.default.findByPk(id);
    if (!peritaje_has_estado) {
        return res.status(404).json({
            msg: 'No existe un Estado con el id ' + id
        });
    }
    yield peritaje_has_estado.update({ estado: false });
    // await Perito.destroy();
    res.json(peritaje_has_estado);
});
exports.DeletePeritajeHasEstado = DeletePeritajeHasEstado;
//# sourceMappingURL=PeritajesHasEstadosController.js.map