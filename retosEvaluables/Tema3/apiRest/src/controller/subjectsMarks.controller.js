// *---------------------- template ---------------------- *\\
//?_________  Imports _________\\
const { pool } = require("../database.js");

//?_________ Datos _________\\
let student = null;
let teacher = null;

//?_________ Funciones _________\\
function getStart(req, res) {
  let answer = {
    error: true,
    code: 200,
    message: "Punto de inicio API Asignaturas y Notas",
  };
  res.send(answer);
}
// Nota media del alumno pasado por parametro: GET /media?id=5 o /media:5
const getStudentAvg = async (req, res) => {
  try {
    let sql = "SELECT AVG(mark) AS media FROM marks WHERE student_id = ?;";
    let param = [req.params.id];

    let [result] = await pool.query(sql, param);

    if (result[0].media == null) {
      res.send({
        error: true,
        code: 404,
        message: "El id del estudiante no es correcto.",
      });
      console.log("Parametro incorrecto: ", req.params.id);
    } else {
      res.send({
        error: false,
        code: 200,
        message: "consulta getStudentAvg realizada correctamente",
        data: result,
      });
      console.log("mostrando datos del alumno: ", result[0]);
    }
  } catch (err) {
    console.error("Error en getStudentAvg: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Lista asignaturas del alumno pasado por parametro: GET /apuntadas?id=5 o /apuntadas:5
const getStudentSubjects = async (req, res) => {
  try {
    let sql =
      "SELECT s.title FROM subjects AS s INNER JOIN marks AS m ON (s.subject_id = m.subject_id) WHERE student_id = ?;";
    let param = [req.params.id];

    let [result] = await pool.query(sql, param);
    let orderedResult = [];
    if (result.length === 0) {
      res.send({
        error: true,
        code: 404,
        message: "El id del estudiante no es correcto.",
      });
      console.log("Parametro incorrecto: ", req.params.id);
    } else {
      result.forEach((entry) => {
        orderedResult.push(entry.title);
      });
      res.send({
        error: false,
        code: 200,
        message: "consulta getStudentSubjects realizada correctamente",
        data: orderedResult,
      });
      console.log("mostrando Lista de asignaturas del alumno: ", result);
    }
  } catch (err) {
    console.error("Error en getStudentSubjects: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Nombre y apellido de todos los alumnos + Lista asignaturas apuntadas: GET /apuntadas
const getAllStudentSubjects = async (req, res) => {
  try {
    let sql =
      "SELECT s.first_name, s.last_name, sbj.title FROM marks AS m INNER JOIN students AS s ON (s.student_id = m.student_id) INNER JOIN subjects AS sbj ON (m.subject_id = sbj.subject_id) ORDER BY m. student_id;";
    let param = [];
    /*
    list = {
        { "first_name": "Pepe", "last_name": "González", "subjects": ["subj1", "subj2"...] }
        ]
        */
    let [result] = await pool.query(sql, param);

    // Transformar los datos de result a un ARRAY ORDENADO
    let list = {}; // Almacena los objetos que se van creando de los registros
    result.forEach((entry) => {
      // Recorre result
      let key = `${entry.first_name} ${entry.last_name}`;
      if (!list[key]) {
        // Verifica que no exista ya la clave
        list[key] = {
          // Crea un objeto con los datos del registro y lo guarda como un objeto en list
          first_name: entry.first_name,
          last_name: entry.last_name,
          subjects: [],
        };
      }
      list[key].subjects.push(entry.title); // Añade la asignatura al array subjects
    });
    let orderedResult = Object.values(list); // Devuleve un array de los elementos almacenados en list, sin la clave

    res.send({
      error: false,
      code: 200,
      message: "consulta getAllStudentSubjects realizada correctamente",
      data: orderedResult,
    });
    console.log("result: ", orderedResult);
  } catch (err) {
    console.error("Error en getAllStudentSubjects: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Lista asignaturas impartidas por  el profesor pasado por parametro: GET /impartidas?id=5 o /impartidas:5
const getTeacherSubjects = async (req, res) => {
  try {
    let sql =
      "SELECT s.title FROM subject_teacher AS st INNER JOIN subjects AS s ON (st.subject_id = s.subject_id) WHERE st.teacher_id = ?;";
    let param = [req.params.id];

    // añadir funcionalidad

    let [result] = await pool.query(sql, param);
    let orderedResult = [];

    if (result.length === 0) {
      res.send({
        error: true,
        code: 404,
        message: "El id del estudiante no es correcto.",
      });
      console.log("Parametro incorrecto: ", req.params.id);
    } else {
      result.forEach((entry) => {
        orderedResult.push(entry.title);
      });
      res.send({
        error: false,
        code: 200,
        message: "consulta getTeacherSubjects realizada correctamente",
        data: orderedResult,
      });
      console.log("Lista de asignaturas del profesor: ", result);
    }
  } catch (err) {
    console.error("Error en getTeacherSubjects: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: "Algo ha fallado en el servidor.",
    });
  }
};

// Lista de profesores y asignaturas que imparte: GET /impartidas
const getAllTeacherSubjects = async (req, res) => {
  try {
    let sql =
      "SELECT t.first_name, t.last_name, sbj.title FROM subject_teacher AS st INNER JOIN teachers AS t ON (t.teacher_id = st.teacher_id) INNER JOIN subjects AS sbj ON (st.subject_id = sbj.subject_id) ORDER BY st.teacher_id;";
    let param = [];

    let [result] = await pool.query(sql, param);
    let list = {};
    result.forEach((entry) => {
      let key = `${entry.first_name} ${entry.last_name}`;
      if (!list[key]) {
        list[key] = {
          first_name: entry.first_name,
          last_name: entry.last_name,
          subjects: [],
        };
      }
      list[key].subjects.push(entry.title);
    });
    let orderedResult = Object.values(list);
    res.send({
      error: false,
      code: 200,
      message: "consulta getAllTeacherSubjects realizada correctamente",
      data: orderedResult,
    });
  } catch (err) {
    console.error("Error en getAllTeacherSubjects: ", err.message);
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
  teacher,
  getStart,
  getStudentAvg,
  getStudentSubjects,
  getAllStudentSubjects,
  getTeacherSubjects,
  getAllTeacherSubjects,
};
