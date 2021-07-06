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
exports.DeleteActividad = exports.PutActividades = exports.PostActividades = exports.GetActividad = exports.GetActividadxruc = exports.GetActividades = void 0;
const sequelize_1 = require("sequelize");
const actividades_1 = __importDefault(require("../models/actividades"));
const tipo_actividad_1 = __importDefault(require("../models/tipo_actividad"));
const ubicacion_1 = __importDefault(require("../models/ubicacion"));
const GetActividades = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const actividades = yield actividades_1.default.findAll({
        where: {
            estado: {
                [sequelize_1.Op.not]: false //con esto solo muestro los estados activos true
            }
        }
    });
    res.json({
        actividades
    });
});
exports.GetActividades = GetActividades;
const GetActividadxruc = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    actividades_1.default.belongsTo(tipo_actividad_1.default, { foreignKey: 'tipo_act_id' });
    actividades_1.default.belongsTo(ubicacion_1.default, { foreignKey: 'ubicacion_id' });
    const actividades = yield actividades_1.default.findAll({
        where: {
            peritajes_id: id
        },
        include: [
            { model: tipo_actividad_1.default },
            { model: ubicacion_1.default },
        ]
    });
    res.json({
        actividades
    });
});
exports.GetActividadxruc = GetActividadxruc;
const GetActividad = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const actividad = yield actividades_1.default.findByPk(id);
    if (actividad) {
        res.json({
            actividad
        });
    }
    else {
        res.status(404).json({
            msg: `actividad no encontrada con el ID ${id}`
        });
    }
});
exports.GetActividad = GetActividad;
const PostActividades = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { body } = req;
    try {
        const actividad = actividades_1.default.build(body);
        yield actividad.save();
        res.json(actividad);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PostActividades = PostActividades;
const PutActividades = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const { body } = req;
    try {
        const actividad = yield actividades_1.default.findByPk(id);
        if (!actividad) {
            return res.status(404).json({
                msg: 'No existe un actividad con el id ' + id
            });
        }
        yield actividad.update(body);
        res.json(actividad);
    }
    catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        });
    }
});
exports.PutActividades = PutActividades;
const DeleteActividad = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const { id } = req.params;
    const actividad = yield actividades_1.default.findByPk(id);
    if (!actividad) {
        return res.status(404).json({
            msg: 'No existe un Actividad con el id ' + id
        });
    }
    yield actividad.update({ estado: false });
    // await Perito.destroy();
    res.json(actividad);
});
exports.DeleteActividad = DeleteActividad;
//# sourceMappingURL=ActiviadesController.js.map