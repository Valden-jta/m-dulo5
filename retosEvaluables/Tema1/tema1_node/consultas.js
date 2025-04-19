/* -------------------  Instrucciones -------------------------
 · Crea una nueva BBDD en workbench
 · Importa los datos y tablas desde escenario_trabajo.sql (carpeta database).
 · Utiliza tus datos de conexión en la función query para conectarte a la base de datos
*/

const mysql = require("mysql2/promise");

/* =============== MAIN =============== */

let arraySQL = [
  // 1. Añadir y eliminar columnas de una tabla
  `ALTER TABLE direccion 
     DROP COLUMN pais,
     ADD COLUMN codigo_pais VARCHAR(3) NULL AFTER codigo_postal;`,
  // 2. Eliminar una tabla
  `DROP TABLE direccion;`,
  // 3. Cambiar las notas de todos los alumnos a 0
  `UPDATE marks SET mark = 0;`,
  // 4. Obtener nombre y primer apellido de TODOS los estudiantes
  `SELECT first_name, last_name FROM students;`,
  // 5. Obtener los datos de TODOS los profesores
  `SELECT * FROM teachers;`,
  // 6. Eliminar notas de más de 10 años de antigüedad   CORREGIR
  `DELETE FROM marks WHERE date < DATE_SUB(CURDATE(), INTERVAL 10 YEAR);`,
  // 7. Cambiar las notas menores a 5 a un valor de 5
  `UPDATE marks SET mark = 5 WHERE mark < 5;`,
];

query();

/* =============== FUNCIONES =============== */

async function query() {
  let connection;
  try {
    // Conexion a la base de datos
    connection = await mysql.createConnection({
      host: "localhost",
      user: "", // tu usuario
      password: "", // tu contraseña
      database: "", // tu base de datos
    });
    console.log("conexion correcta");
    // consultas sobre la basde de datos
    for (let sqlQuery of arraySQL) {
      console.log("Ejecutando query: ", sqlQuery);
      let [result] = await connection.query(sqlQuery);
      console.log("Resultado de la consulta: ", result);
    }
  } catch (error) {
    console.error("Error al ejecutar la consulta: ", error);
  } finally {
    // Cerrar la conexión
    if (connection) {
      await connection.end();
      console.log("Conexión cerrada");
    }
  }
}
