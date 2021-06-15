"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const connection_1 = __importDefault(require("../db/connection"));
const peritos_1 = __importDefault(require("./peritos"));
const fiscales_1 = __importDefault(require("./fiscales"));
const estados_1 = __importDefault(require("./estados"));
const Peritajes = connection_1.default.define('Peritajes', {
    ruc: {
        type: sequelize_1.DataTypes.STRING
    },
    fecha: {
        type: sequelize_1.DataTypes.DATE
    },
    nue: {
        type: sequelize_1.DataTypes.BOOLEAN
    },
    plazo: {
        type: sequelize_1.DataTypes.NUMBER
    },
    gls_peritaje: {
        type: sequelize_1.DataTypes.STRING
    },
    obs_peritaje: {
        type: sequelize_1.DataTypes.STRING
    },
    estado: {
        type: sequelize_1.DataTypes.BOOLEAN
    },
    tipo_peritaje_id: {
        type: sequelize_1.DataTypes.NUMBER
    },
    fiscales_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: fiscales_1.default,
            key: 'id'
        }
    },
    peritos_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: peritos_1.default,
            key: 'id'
        }
    },
    estados_id: {
        type: sequelize_1.DataTypes.NUMBER,
        references: {
            model: estados_1.default,
            key: 'id'
        }
    }
});
exports.default = Peritajes;
//# sourceMappingURL=peritajes.js.map