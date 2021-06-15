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
exports.DeletePerito = exports.PutPerito = exports.PostPerito = exports.GetPerito = exports.GetPeritos = void 0;
const peritos_1 = __importDefault(require("../models/peritos"));
const sequelize_1 = require("sequelize");
const GetPeritos = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const peritos = yield peritos_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        }
    });
    res.json({
        peritos
    });
});
exports.GetPeritos = GetPeritos;
const GetPerito = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const perito = yield peritos_1.default.findByPk(id);
    if (perito) {
        res.json({
            perito
        });
    }
    else {
        res.status(404).json({
            msg: `perito no encontrado con el ID ${id}`
        });
    }
});
exports.GetPerito = GetPerito;
const PostPerito = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    try {
        const existeEmail = yield peritos_1.default.findOne({
            where: {
                email: body.email
            }
        });
        if (existeEmail) {
            return res.status(400).json({
                msg: 'Ya existe un perito con el email ' + body.email
            });
        }
        const perito = peritos_1.default.build(body);
        yield perito.save();
        res.json(perito);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostPerito = PostPerito;
const PutPerito = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const perito = yield peritos_1.default.findByPk(id);
        if (!perito) {
            return res.status(404).json({
                msg: 'No existe un perito con el id ' + id
            });
        }
        yield perito.update(body);
        res.json(perito);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutPerito = PutPerito;
const DeletePerito = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const perito = yield peritos_1.default.findByPk(id);
    if (!perito) {
        return res.status(404).json({
            msg: 'No existe un Perito con el id ' + id
        });
    }
    yield perito.update({ estado: false });
    // await Perito.destroy();
    res.json(perito);
});
exports.DeletePerito = DeletePerito;
//# sourceMappingURL=PeritoController.js.map