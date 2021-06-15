"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const Fiscal = connection_1.default.define('Fiscales', {
    nombre_fiscal: {
        type: sequelize_1.DataTypes.STRING
    },
    rut_fiscal: {
        type: sequelize_1.DataTypes.STRING
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    }
});
exports.default = Fiscal;
//# sourceMappingURL=fiscales.js.map