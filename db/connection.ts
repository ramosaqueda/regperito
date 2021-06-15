import { Sequelize} from 'sequelize';
const db = new Sequelize('sysperito','root', 'r1101kcn', {
        host: 'localhost',
        dialect:'mysql',
       // logging:true
});

export default db;