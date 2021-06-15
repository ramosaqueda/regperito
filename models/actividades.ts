import  { DataTypes} from 'sequelize';
import db from '../db/connection';
 
const Actividades = db.define('Actividades',{
  
    fecha_act: {
        type: DataTypes.DATE
    },
   
    tipo_act_id:{
        type: DataTypes.NUMBER
    },
    
    estado:{
        type: DataTypes.BOOLEAN
    },
    ubicacion_id:{
        type:DataTypes.NUMBER
    },
   
    peritajes_id:{
        type:DataTypes.NUMBER
    } ,
    obs_actividad:{
        type:DataTypes.STRING
    }

})

export default Actividades;