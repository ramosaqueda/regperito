import  { DataTypes} from 'sequelize';
import db from '../db/connection';
import Perito from './peritos';
import Fiscales from './fiscales';
import Estados from './estados';
 


const Peritajes = db.define('Peritajes',{
    ruc: {
        type: DataTypes.STRING
    },
    fecha: {
        type: DataTypes.DATE    
    },
    nue:{
        type: DataTypes.BOOLEAN
    },
    plazo:{
        type: DataTypes.NUMBER
    },
    gls_peritaje:{
        type: DataTypes.STRING
    },
    obs_peritaje:{
        type: DataTypes.STRING
    },
    estado:{
        type: DataTypes.BOOLEAN
    },
    tipo_peritaje_id:{
        type:DataTypes.NUMBER
    },
    fiscales_id:{
        type:DataTypes.NUMBER,
        references: {
            model: Fiscales,
            key: 'id'
        }
    },
    peritos_id:{
        type:DataTypes.NUMBER,
        references: {
            model: Perito,
            key: 'id'
        }
    } ,
    estados_id:{
        type:DataTypes.NUMBER,
        references: {
            model: Estados,
            key: 'id'
        }
    }

    

})
 
 



export default Peritajes;