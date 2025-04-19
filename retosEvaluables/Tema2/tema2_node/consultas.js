/* -------------------  Instrucciones -------------------------
 · Crea una nueva BBDD en workbench
 · Importa los datos y tablas desde escenario_trabajo.sql (carpeta database).
 · Utiliza tus datos de conexión en la función query para conectarte a la base de datos
*/

const mysql = require("mysql2/promise");

let sqlQuerys = [
  {
    sql: "SELECT subject_id, AVG(mark) AS subject_avg FROM marks WHERE subject_id = ? GROUP BY subject_id;",
    param: ["1"],
  },
  {
    sql: "SELECT s.student_id, m.mark FROM students AS s INNER JOIN marks AS m ON (s.student_id = m.student_id) WHERE s.student_id <= ? OR (m.mark > ? AND m.date < DATE_SUB(CURDATE(), INTERVAL ? YEAR));",
    param: ["20", "8", "1"],
  },
  {
    // Volver a importar DB para recupera notas originales si se quiere
    sql: "SELECT s.subject_id, title, AVG(mark) AS mark_avg FROM subjects AS s INNER JOIN marks AS m ON (s.subject_id = m.subject_id) WHERE m.date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) GROUP BY s.subject_id ORDER BY s.subject_id ASC;",
    param: [],
  },
  {
    sql: "SELECT DISTINCT s.student_id, first_name, last_name, AVG(mark) AS student_avg FROM students AS s INNER JOIN marks AS m ON (s.student_id = m.student_id) WHERE m.date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) GROUP BY s.student_id ORDER BY s.student_id ASC;",
    param: [],
  },
  {
    sql: "SELECT s.title, COUNT(m.subject_id) AS total_students , t.first_name, t.last_name FROM subjects AS INNER JOIN marks AS m ON (s.subject_id = m.subject_id) INNER JOIN subject_teacher AS st ON (s.subject_id = st.subject_id) INNER JOIN teachers AS t ON (st.teacher_id = t.teacher_id) GROUP BY s.title, t.first_name, t.last_name;",
    param: [],
  },
];

query();

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
    for (let { sql, param } of sqlQuerys) {
      console.log("Ejecutando query: ", sql);
      let [result] = await connection.query(sql, param);
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
