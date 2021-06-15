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
exports.DeleteFiscal = exports.PutFiscal = exports.PostFiscal = exports.GetFiscal = exports.GetFiscales = void 0;
const sequelize_1 = require("sequelize");
const fiscales_1 = __importDefault(require("../models/fiscales"));
const GetFiscales = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const fiscal = yield fiscales_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        }
    });
    res.json({
        fiscal
    });
});
exports.GetFiscales = GetFiscales;
const GetFiscal = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const fiscal = yield fiscales_1.default.findByPk(id);
    if (fiscal) {
        res.json({
            fiscal
        });
    }
    else {
        res.status(404).json({
            msg: `fiscal no encontrado con el ID ${id}`
        });
    }
});
exports.GetFiscal = GetFiscal;
const PostFiscal = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    console.log(body);
    try {
        const existeRut = yield fiscales_1.default.findOne({
            where: {
                rut_fiscal: body.rut_fiscal
            }
        });
        if (existeRut) {
            return res.status(400).json({
                msg: 'Ya existe un registro con el RUT' + body.rut_fiscal
            });
        }
        const fiscal = fiscales_1.default.build(body);
        yield fiscal.save();
        res.json(fiscal);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostFiscal = PostFiscal;
const PutFiscal = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const perito = yield fiscales_1.default.findByPk(id);
        if (!perito) {
            return res.status(404).json({
                msg: 'No existe un fiscal con el id ' + id
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
exports.PutFiscal = PutFiscal;
const DeleteFiscal = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const fiscal = yield fiscales_1.default.findByPk(id);
    if (!fiscal) {
        return res.status(404).json({
            msg: 'No existe un Perito con el id ' + id
        });
    }
    yield fiscal.update({ estado: false });
    // await Perito.destroy();
    res.json(fiscal);
});
exports.DeleteFiscal = DeleteFiscal;
//# sourceMappingURL=FiscalController.js.map