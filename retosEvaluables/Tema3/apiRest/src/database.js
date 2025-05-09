const mysql = require("mysql2");

// Crear pool de conexiones
const pool = mysql
  .createPool({
    // Parámetros de conexion
    host: "",
    user: "",
    password: "",
    database: "",
    // Parámetros de configuración de las opciones de conexion
    waitForConnections: true,
    connectionLimit: 10,
    maxIdle: 10,
    idleTimeout: 6000,
    queueLimit: 0,
  })
  .promise();

console.log("Conexión con la BBDD creada");

module.exports = { pool };
