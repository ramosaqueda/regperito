/*
`estados`.`createdAt`,
 `estados`.`estado`, `estados`.`gls_estado`, `estados`.`id`, `estados`.`updatedAt`
*/


import  { DataTypes} from 'sequelize';
import db from '../db/connection';
 
const Estados = db.define('Estados',{
    gls_estado: {
        type: DataTypes.STRING
    },
   
    estado:{
        type: DataTypes.BOOLEAN
    }

})

export default Estados;