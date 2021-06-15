import  { DataTypes} from 'sequelize';
import db from '../db/connection';
 
const Tipo_Actividad = db.define('tipo_act',{
    gls_tipoact: {
        type: DataTypes.STRING
    },
    estado:{
        type: DataTypes.BOOLEAN
    }
},{
    freezeTableName: true
  })
export default Tipo_Actividad;