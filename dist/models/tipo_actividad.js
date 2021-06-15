"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const Tipo_Actividad = connection_1.default.define('tipo_act', {
    gls_tipoact: {
        type: sequelize_1.DataTypes.STRING
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    }
}, {
    freezeTableName: true
});
exports.default = Tipo_Actividad;
//# sourceMappingURL=tipo_actividad.js.map