import  { DataTypes} from 'sequelize';
import db from '../db/connection';
import Perito from './peritos';
import Fiscales from './fiscales';
import Estados from './estados';
import peritajes_has_estados from './peritajes_has_estados';


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
    } 
    

})
 
 
Peritajes.belongsToMany(Estados, { through: peritajes_has_estados });
Estados.belongsToMany(Peritajes, { through: peritajes_has_estados});

//User.belongsToMany(Project, { through: UserProject });

export default Peritajes;