import  { DataTypes} from 'sequelize';
import db from '../db/connection';
 
const Fiscal = db.define('Fiscales',{
    nombre_fiscal: {
        type: DataTypes.STRING
    },
    rut_fiscal: {
        type: DataTypes.STRING
    },
    estado:{
        type: DataTypes.BOOLEAN
    }

})

export default Fiscal;