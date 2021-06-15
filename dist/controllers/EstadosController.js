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
exports.DeleteEstado = exports.PutEstado = exports.PostEstado = exports.GetEstado = exports.GetEstados = void 0;
const sequelize_1 = require("sequelize");
const estados_1 = __importDefault(require("../models/estados"));
const GetEstados = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const estado = yield estados_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        }
    });
    res.json({
        estado
    });
});
exports.GetEstados = GetEstados;
const GetEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const estado = yield estados_1.default.findByPk(id);
    if (estado) {
        res.json({
            estado
        });
    }
    else {
        res.status(404).json({
            msg: `estado no encontrado con el ID ${id}`
        });
    }
});
exports.GetEstado = GetEstado;
const PostEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    console.log(body);
    try {
        const estado = estados_1.default.build(body);
        yield estado.save();
        res.json(estado);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostEstado = PostEstado;
const PutEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const estado = yield estados_1.default.findByPk(id);
        if (!estado) {
            return res.status(404).json({
                msg: 'No existe un estado con el id ' + id
            });
        }
        yield estado.update(body);
        res.json(estado);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutEstado = PutEstado;
const DeleteEstado = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const estado = yield estados_1.default.findByPk(id);
    if (!estado) {
        return res.status(404).json({
            msg: 'No existe un Estado con el id ' + id
        });
    }
    yield estado.update({ estado: false });
    // await Perito.destroy();
    res.json(estado);
});
exports.DeleteEstado = DeleteEstado;
//# sourceMappingURL=EstadosController.js.map