import  { DataTypes} from 'sequelize';
import db from '../db/connection';
 
const Tipo_Peritaje = db.define('tipo_peritaje',{
    gls_tipo: {
        type: DataTypes.STRING
    },
    estado:{
        type: DataTypes.BOOLEAN
    }
},{
    freezeTableName: true
  })
export default Tipo_Peritaje;