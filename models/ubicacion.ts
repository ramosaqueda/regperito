import  { DataTypes} from 'sequelize';
import db from '../db/connection';

const Ubicacion = db.define('Fiscales',{
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

export default Ubicacion;