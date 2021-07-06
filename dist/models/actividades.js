"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const tipo_actividad_1 = __importDefault(require("./tipo_actividad"));
const ubicacion_1 = __importDefault(require("./ubicacion"));
const peritajes_1 = __importDefault(require("./peritajes"));
const Actividades = connection_1.default.define('Actividades', {
    fecha_act: {
        type: sequelize_1.DataTypes.DATE
    },
    tipo_act_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: tipo_actividad_1.default,
            key: 'id'
        }
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    },
    ubicacion_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: ubicacion_1.default,
            key: 'id'
        }
    },
    peritajes_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: peritajes_1.default,
            key: 'id'
        }
    },
    obs_actividad: {
        type: sequelize_1.DataTypes.STRING
    }
});
exports.default = Actividades;
//# sourceMappingURL=actividades.js.map