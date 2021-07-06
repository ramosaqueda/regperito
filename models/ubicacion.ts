import  { DataTypes} from 'sequelize';
import db from '../db/connection';

const Ubicacion = db.define('Ubicacion',{
    gls_ubicacion: {
        type: DataTypes.STRING
    },
 
    estado:{
        type: DataTypes.BOOLEAN
    } 
    
 
} ,  {
    freezeTableName: true
  })
 
export default Ubicacion;
 
   