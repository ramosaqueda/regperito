import express,{ Application} from 'express';
import peritosRoutes from '../routes/PeritosRoute';
import fiscalRoutes from '../routes/FiscalRoute';
import estadosRoutes from '../routes/EstadosRoute';
import tipoPerRoute from '../routes/TipoPerRoute';
import peritajeRoute from '../routes/PeritajesRoute'
import actividadesRoute from '../routes/ActividadesRoute'
import cors from 'cors';
import db from '../db/connection';

class Server{
    private app;
    private port:string;
    private apiPaths = {
        peritos: '/api/peritos',
        fiscal: '/api/fiscal',
        estado: '/api/estado',
        tipoper:'/api/tipoper',
        peritajes:'/api/peritajes',
        actividades:'/api/actividades'
        
    }
    constructor(){
        this.app = express();
        this.port =process.env.PORT || '8080';
        this.midlwares();

        this.dbConnection();
        //definir mis rutas
        this.routes();
    }

 async dbConnection() {
        try {
            await db.authenticate();
            console.log('Database online');
        } catch (error) {
            throw new Error( error );
        }
    }

    midlwares(){
         
         
       // CORS
       this.app.use( cors() );

       // Lectura del body
       this.app.use( express.json() );

       // Carpeta pública
       this.app.use( express.static('public') );
    }

    routes(){
        this.app.use(this.apiPaths.peritos, peritosRoutes);
        this.app.use(this.apiPaths.fiscal, fiscalRoutes);
        this.app.use(this.apiPaths.estado, estadosRoutes);
        this.app.use(this.apiPaths.tipoper, tipoPerRoute);
        this.app.use(this.apiPaths.peritajes,peritajeRoute);
        this.app.use(this.apiPaths.actividades,actividadesRoute);

    }
    listen(){
        this.app.listen(this.port,()=> {
            console.log('Servidor corroendo en puerto :' + this.port);
        })

    }
}

export default Server;