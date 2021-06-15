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
const express_1 = __importDefault(require("express"));
const PeritosRoute_1 = __importDefault(require("../routes/PeritosRoute"));
const FiscalRoute_1 = __importDefault(require("../routes/FiscalRoute"));
const EstadosRoute_1 = __importDefault(require("../routes/EstadosRoute"));
const TipoPerRoute_1 = __importDefault(require("../routes/TipoPerRoute"));
const PeritajesRoute_1 = __importDefault(require("../routes/PeritajesRoute"));
const ActividadesRoute_1 = __importDefault(require("../routes/ActividadesRoute"));
const cors_1 = __importDefault(require("cors"));
const connection_1 = __importDefault(require("../db/connection"));
class Server {
    constructor() {
        this.apiPaths = {
            peritos: '/api/peritos',
            fiscal: '/api/fiscal',
            estado: '/api/estado',
            tipoper: '/api/tipoper',
            peritajes: '/api/peritajes',
            actividades: '/api/actividades'
        };
        this.app = express_1.default();
        this.port = process.env.PORT || '8080';
        this.midlwares();
        this.dbConnection();
        //definir mis rutas
        this.routes();
    }
    dbConnection() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                yield connection_1.default.authenticate();
                console.log('Database online');
            }
            catch (error) {
                throw new Error(error);
            }
        });
    }
    midlwares() {
        // CORS
        this.app.use(cors_1.default());
        // Lectura del body
        this.app.use(express_1.default.json());
        // Carpeta pública
        this.app.use(express_1.default.static('public'));
    }
    routes() {
        this.app.use(this.apiPaths.peritos, PeritosRoute_1.default);
        this.app.use(this.apiPaths.fiscal, FiscalRoute_1.default);
        this.app.use(this.apiPaths.estado, EstadosRoute_1.default);
        this.app.use(this.apiPaths.tipoper, TipoPerRoute_1.default);
        this.app.use(this.apiPaths.peritajes, PeritajesRoute_1.default);
        this.app.use(this.apiPaths.actividades, ActividadesRoute_1.default);
    }
    listen() {
        this.app.listen(this.port, () => {
            console.log('Servidor corroendo en puerto :' + this.port);
        });
    }
}
exports.default = Server;
//# sourceMappingURL=server.js.map