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
exports.DeletePeritaje = exports.PutPeritajes = exports.PostPeritajes = exports.GetPeritaje = exports.GetPeritajeporuc = exports.GetPeritajes = void 0;
const sequelize_1 = require("sequelize");
const peritajes_1 = __importDefault(require("../models/peritajes"));
const peritos_1 = __importDefault(require("../models/peritos"));
const fiscales_1 = __importDefault(require("../models/fiscales"));
const estados_1 = __importDefault(require("../models/estados"));
const GetPeritajes = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    peritajes_1.default.belongsTo(peritos_1.default, { foreignKey: 'peritos_id' });
    peritajes_1.default.belongsTo(fiscales_1.default, { foreignKey: 'fiscales_id' });
    peritajes_1.default.belongsTo(estados_1.default, { foreignKey: 'estados_id' });
    const peritajes = yield peritajes_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        },
        include: [
            { model: peritos_1.default },
            { model: fiscales_1.default },
            { model: estados_1.default },
        ]
    });
    res.json({
        peritajes
    });
});
exports.GetPeritajes = GetPeritajes;
const GetPeritajeporuc = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { ruc } = req.params;
    console.log(ruc);
    peritajes_1.default.belongsTo(peritos_1.default, { foreignKey: 'peritos_id' });
    peritajes_1.default.belongsTo(fiscales_1.default, { foreignKey: 'fiscales_id' });
    peritajes_1.default.belongsTo(estados_1.default, { foreignKey: 'estados_id' });
    const peritajes = yield peritajes_1.default.findAll({
        where: {
            ruc: ruc
        },
        include: [
            { model: peritos_1.default },
            { model: fiscales_1.default },
            { model: estados_1.default },
        ]
    });
    res.json({
        peritajes
    });
});
exports.GetPeritajeporuc = GetPeritajeporuc;
const GetPeritaje = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const peritaje = yield peritajes_1.default.findByPk(id);
    if (peritaje) {
        res.json({
            peritaje
        });
    }
    else {
        res.status(404).json({
            msg: `peritaje no encontrado con el ID ${id}`
        });
    }
});
exports.GetPeritaje = GetPeritaje;
const PostPeritajes = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    try {
        const peritaje = peritajes_1.default.build(body);
        yield peritaje.save();
        res.json(peritaje);
    }
    catch (error) {
        res.status(500).json({
            msg: 'Hable con el administrador, error:' + error
        });
    }
});
exports.PostPeritajes = PostPeritajes;
const PutPeritajes = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const peritaje = yield peritajes_1.default.findByPk(id);
        if (!peritaje) {
            return res.status(404).json({
                msg: 'No existe un peritaje con el id ' + id
            });
        }
        yield peritaje.update(body);
        res.json(peritaje);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutPeritajes = PutPeritajes;
const DeletePeritaje = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const peritaje = yield peritajes_1.default.findByPk(id);
    if (!peritaje) {
        return res.status(404).json({
            msg: 'No existe un Peritaje con el id ' + id
        });
    }
    yield peritaje.update({ estado: false });
    // await Perito.destroy();
    res.json(peritaje);
});
exports.DeletePeritaje = DeletePeritaje;
//# sourceMappingURL=PeritajesController.js.map