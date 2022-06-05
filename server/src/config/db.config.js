module.exports = {
    HOST: process.env.MYSQLDB_HOST,
    USER: process.env.MYSQLDB_USER,
    PASSWORD: process.env.MYSQLDB_ROOT_PASSWORD,
    DB: process.env.MYSQLDB_DATABASE,
    port: process.env.DB_PORT,
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
};