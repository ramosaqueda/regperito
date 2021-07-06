"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const connection_1 = __importDefault(require("../db/connection"));
const Peritajes_has_estados = connection_1.default.define('peritajes_has_estados', {});
exports.default = Peritajes_has_estados;
//# sourceMappingURL=peritajes_has_estados.js.map