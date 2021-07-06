import { Sequelize} from 'sequelize';
const db = new Sequelize('sysperitos','root', 'r1101kcn', {
        host: 'localhost',
        dialect:'mysql',
       // logging:true
});

export default db;