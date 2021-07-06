"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const sequelize_1 = require("sequelize");
const db = new sequelize_1.Sequelize('sysperitos', 'root', 'r1101kcn', {
    host: 'localhost',
    dialect: 'mysql',
    // logging:true
});
exports.default = db;
//# sourceMappingURL=connection.js.map