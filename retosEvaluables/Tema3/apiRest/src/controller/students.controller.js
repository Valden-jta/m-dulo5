// *---------------------- template ---------------------- *\\
//?_________  Imports _________\\
const { pool } = require("../database.js");

//?_________ Datos _________\\
let student = null;

//?_________ Funciones _________\\
function getStart(req, res) {
  let answer = {
    error: true,
    code: 200,
    message: "Punto de inicio API alumnos",
  };
  res.send(answer);
}
// Datos del alumno pasado por parametro: GET /alumnos?id=5 o /alumnos:5
const getStudent = async (req, res) => {
  try {
    let sql;
    let param;

    if (req.params.id == null) {
      sql =
        "SELECT first_name, last_name, name AS group_name, entry_year FROM students AS s INNER JOIN tema3.groups AS g ON (s.group_id = g.group_id);";
      param = [];
    } else {
      sql =
        "SELECT first_name, last_name, name AS group_name, entry_year FROM students AS s INNER JOIN tema3.groups AS g ON (s.group_id = g.group_id) WHERE student_id = ?;";
      param = [req.params.id];
    }

    let [result] = await pool.query(sql, param);

    if (result.length > 0) {
      res.send({
        error: false,
        code: 200,
        message: "consulta getStudent realizada correctamente",
        data: result[0], // Devuelve array de objetos
      });
      console.log("mostrando datos del alumno: ", result[0]);
    } else {
      res.send({
        error: true,
        code: 404,
        message: "No se encontro ningún alumno con ese id",
      });
      console.log("No se pudo mostrar el alumno: ", result);
    }
  } catch (err) {
    console.error("Error en getStudent: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Lista de todos los alumnos: GET /alumnos
const getAllStudents = async (req, res) => {
  try {
    let sql =
      "SELECT first_name, last_name, name AS group_name, entry_year FROM students AS s INNER JOIN tema3.groups AS g ON (s.group_id = g.group_id);";
    let param = [];
    // añadir funcionalidad
    let [result] = await pool.query(sql, param);
    res.send({
      error: false,
      code: 200,
      message: "consulta getAllStudents realizada correctamente",
      data: result, // Devuelve array de objetos
    });
    console.log("mostrando datos de los alumnos: ", result);
  } catch (err) {
    console.error("Error en getAllStudents: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Añade un nuevo alumno: POST /apuntadas
const postStudent = async (req, res) => {
  try {
    student = {
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      group_id: req.body.group_id,
      entry_year: req.body.entry_year,
    };
    let sql;
    let param;

    if (
      student != null &&
      (student.first_name != null ||
        student.last_name != null ||
        student.group_id != null ||
        student.entry_year != null)
    ) {
      sql =
        "INSERT INTO students (first_name, last_name, group_id, entry_year) VALUES (?, ?, ?, ?);";
      param = [
        student.first_name,
        student.last_name,
        student.group_id,
        student.entry_year,
      ];
    }

    let [result] = await pool.query(sql, param);

    if (result.insertId) {
      res.send({
        error: false,
        code: 200,
        message: "consulta postStudent realizada correctamente",
        data: String(result.insertId),
      });
      console.log("Alumno añadido correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 404,
        message: "No se encontro ningún alumno con ese id",
      });
      console.log("No se pudo añadir al alumno: ", result);
    }
  } catch (err) {
    console.error("Error en postStudent: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Modifica datos de un alumno: PUT /alumnos
const putStudent = async (req, res) => {
  try {
    student = {
      student_id: req.body.student_id,
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      group_id: req.body.group_id,
      entry_year: req.body.entry_year,
    };
    let sql;
    let param;
    let preparedStmt = {
      sql: [],
      param: [],
    };

    for (let column in student) {
      if (student[column]) {
        preparedStmt.sql.push(`${column} = ?`);
        preparedStmt.param.push(student[column]);
      }
    }
    let preparedId = preparedStmt.param.shift();
    sql = `UPDATE students SET ${preparedStmt.sql.splice(
      1,
      preparedStmt.sql.length
    )} WHERE student_id = ?;`;
    preparedStmt.param.push(preparedId);
    param = preparedStmt.param;

    let [result] = await pool.query(sql, param);

    if (result.affectedRows > 0) {
      res.send({
        error: false,
        code: 200,
        message: "consulta putStudent realizada correctamente",
        data: result,
      });
      console.log("Alumno modificado correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 404,
        message: "No se encontro ningún alumno con ese id",
      });
      console.log("No se pudo modificar al alumno: ", result);
    }
  } catch (err) {
    console.error("Error en putStudent: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Elimina un alumno: DEL /alumnos
const deleteStudent = async (req, res) => {
  try {
    student = {
      student_id: req.body.student_id,
      first_name: req.body.first_name,
      last_name: req.body.last_name,
      group_id: req.body.group_id,
      entry_year: req.body.entry_year,
    };
    let sql;
    let param;
    if (student) {
      sql = "DELETE FROM students WHERE student_id = ?;";
      param = [student.student_id];
    }

    let [result] = await pool.query(sql, param);

    if (result.affectedRows > 0) {
      res.send({
        error: false,
        code: 200,
        message: "consulta deleteStudent realizada correctamente",
        data: result,
      });
      console.log("Alumno eliminado correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 404,
        message: "No se encontro ningún alumno con ese id",
      });
      console.log("No se pudo eliminar al alumno: ", result);
    }
  } catch (err) {
    console.error("Error en deleteStudent: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

//?_________ Exports _________\\
module.exports = {
  student,
  getStart,
  getStudent,
  getAllStudents,
  postStudent,
  putStudent,
  deleteStudent,
};
