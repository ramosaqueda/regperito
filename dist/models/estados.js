"use strict";
/*
`estados`.`createdAt`,
 `estados`.`estado`, `estados`.`gls_estado`, `estados`.`id`, `estados`.`updatedAt`
*/
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const Estados = connection_1.default.define('Estados', {
    gls_estado: {
        type: sequelize_1.DataTypes.STRING
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    }
});
exports.default = Estados;
//# sourceMappingURL=estados.js.map