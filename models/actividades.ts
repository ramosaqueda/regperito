import  { DataTypes} from 'sequelize';
import db from '../db/connection';
import tipo_act from './tipo_actividad';
import ubicacion from './ubicacion';
import peritajes from './peritajes';
 
const Actividades = db.define('Actividades',{
  
    fecha_act: {
        type: DataTypes.DATE
    },
   
    tipo_act_id:{
        type: DataTypes.NUMBER,
        references: {
            model: tipo_act,
            key: 'id'
        }
        
    },
    
    estado:{
        type: DataTypes.BOOLEAN
    },
    ubicacion_id:{
        type:DataTypes.NUMBER,
        references: {
            model: ubicacion,
            key: 'id'
        }
    },
   
    peritajes_id:{
        type:DataTypes.NUMBER,
        references: {
            model: peritajes,
            key: 'id'
        }
    } ,
    obs_actividad:{
        type:DataTypes.STRING
    }

})

export default Actividades;