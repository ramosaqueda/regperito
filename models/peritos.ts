import  { DataTypes} from 'sequelize';
import db from '../db/connection';

const Perito = db.define('Perito',{
    nombre_perito: {
        type: DataTypes.STRING
    },
    email : {
        type: DataTypes.STRING
    },
    estado:{
        type: DataTypes.BOOLEAN
    }

})

export default Perito;