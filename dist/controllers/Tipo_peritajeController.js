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
exports.DeleteTipoPer = exports.PutTipoPer = exports.PostTipoPer = exports.GetTipoPer = exports.GetTipoPers = void 0;
const sequelize_1 = require("sequelize");
const tipo_pertiaje_1 = __importDefault(require("../models/tipo_pertiaje"));
const GetTipoPers = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const tipoper = yield tipo_pertiaje_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los tipoper activos true
            }
        }
    });
    res.json({
        tipoper
    });
});
exports.GetTipoPers = GetTipoPers;
const GetTipoPer = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const tipoper = yield tipo_pertiaje_1.default.findByPk(id);
    if (tipoper) {
        res.json({
            tipoper
        });
    }
    else {
        res.status(404).json({
            msg: `tipoper no encontrado con el ID ${id}`
        });
    }
});
exports.GetTipoPer = GetTipoPer;
const PostTipoPer = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    console.log(body);
    try {
        const tipoper = tipo_pertiaje_1.default.build(body);
        yield tipoper.save();
        res.json(tipoper);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostTipoPer = PostTipoPer;
const PutTipoPer = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const tipoper = yield tipo_pertiaje_1.default.findByPk(id);
        if (!tipoper) {
            return res.status(404).json({
                msg: 'No existe un tipoper con el id ' + id
            });
        }
        yield tipoper.update(body);
        res.json(tipoper);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutTipoPer = PutTipoPer;
const DeleteTipoPer = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const tipoper = yield tipo_pertiaje_1.default.findByPk(id);
    if (!tipoper) {
        return res.status(404).json({
            msg: 'No existe un TipoPer con el id ' + id
        });
    }
    yield tipoper.update({ tipoper: false });
    // await Perito.destroy();
    res.json(tipoper);
});
exports.DeleteTipoPer = DeleteTipoPer;
//# sourceMappingURL=Tipo_peritajeController.js.map