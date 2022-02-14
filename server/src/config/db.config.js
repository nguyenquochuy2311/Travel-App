module.exports = {
    HOST: "postgres",
    USER: "postgres",
    PASSWORD: "postgres",
    port: 5432,
    DB: "travel",
    dialect: "postgres",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    }
};