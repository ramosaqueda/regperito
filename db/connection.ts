import { Sequelize} from 'sequelize';
const db = new Sequelize('sysperitos','root', 'root', {
        host: 'localhost',
        dialect:'mysql',
       // logging:true
});

export default db;