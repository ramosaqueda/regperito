"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const Actividades = connection_1.default.define('Actividades', {
    fecha_act: {
        type: sequelize_1.DataTypes.DATE
    },
    tipo_act_id: {
        type: sequelize_1.DataTypes.NUMBER
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    },
    ubicacion_id: {
        type: sequelize_1.DataTypes.NUMBER
    },
    peritajes_id: {
        type: sequelize_1.DataTypes.NUMBER
    },
    obs_actividad: {
        type: sequelize_1.DataTypes.STRING
    }
});
exports.default = Actividades;
//# sourceMappingURL=actividades.js.map