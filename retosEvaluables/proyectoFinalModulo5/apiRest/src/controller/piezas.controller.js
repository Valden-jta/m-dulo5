// *---------------------- template ---------------------- *\\
//?_________  Imports _________\\
const { pool } = require("../database.js");
//?_________ Datos _________\\

let pieza = null;
let piezas = [];
let prestamos = [];
let colecciones = [];

//?_________ Funciones _________\\

function getStart(req, res) {
  let answer = {
    error: true,
    code: 200,
    message: "Punto de inicio API alumnos",
  };
  res.send(answer);
}

//? Listar piezas del museo
const getPiezas = async (req, res) => {
  try {
    let sql =
      "SELECT p.titulo, CONCAT(a.nombre,' ', a.apellido) AS autor, p.año, p.descripcion, CONCAT(c.nombre,' (', c.tipo,')')  AS coleccion, CONCAT(u.nombre,' - ',s.tipo) AS localizacion, pr.nombre as propietario FROM piezas AS p INNER JOIN autores AS a ON (p.id_autor = a.id_autor) INNER JOIN colecciones AS c ON (p.id_coleccion = c.id_coleccion) INNER JOIN soportes AS s ON (p.id_soporte = s.id_soporte) INNER JOIN ubicaciones AS u ON (s.id_ubicacion = u.id_ubicacion) INNER JOIN propietarios AS pr ON (p.id_propietario = pr.id_propietario) ORDER BY p.id_pieza ASC;";
    let param = [];

    let [result] = await pool.query(sql, param);
    result.length > 0 ? (piezas = result) : (piezas = []);

    res.send({
      error: false,
      code: 200,
      message: "consulta getPiezas realizada correctamente",
      data: piezas,
    });
    console.log("mostrando listado piezas: ", result);
  } catch (err) {
    console.error("Error en getPiezas: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

//? Mostrar una pieza concreta
const getPieza = async (req, res) => {
  try {
    let sql =
      "SELECT p.id_pieza, p.titulo, CONCAT(a.nombre,' ',a.apellido) AS autor, p.año, p.descripcion, CONCAT(c.nombre,' (', c.tipo,')')  AS coleccion, CONCAT(u.nombre,' - ',s.tipo) AS localizacion, pr.nombre as propietario FROM piezas AS p INNER JOIN autores AS a ON (p.id_autor = a.id_autor) INNER JOIN colecciones AS c ON (p.id_coleccion = c.id_coleccion) INNER JOIN soportes AS s ON (p.id_soporte = s.id_soporte) INNER JOIN ubicaciones AS u ON (s.id_ubicacion = u.id_ubicacion) INNER JOIN propietarios AS pr ON (p.id_propietario = pr.id_propietario) WHERE p.id_pieza= ?;";
    let param = [req.params.id];

    if (param == null) {
      getPiezas(req, res);
    } else {
      let [result] = await pool.query(sql, param);
      if (result.length > 0) {
        pieza = result[0];
        res.send({
          error: false,
          code: 200,
          message: "consulta getPieza correcta",
          data: pieza,
        });
        console.log("Esta es la pieza seleccionada: ", pieza);
      } else {
        res.send({
          error: 200,
          code: 404,
          message: "No se encontró ninguna pieza con ese id",
        });
        console.log("No se pudo mostrar la pieza: ", result);
        piezas = [];
      }
    }
  } catch (err) {
    console.error("Error en getPieza: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

//? Añadir una pieza (condicion: autor, coleccion, soporte y propietarios existentes previamente)
const postPieza = async (req, res) => {
  try {
    pieza = {
      titulo: req.body.titulo,
      id_autor: req.body.id_autor,
      año: req.body.año,
      descripcion: req.body.descripcion,
      id_coleccion: req.body.id_coleccion,
      id_soporte: req.body.id_soporte,
      id_propietario: req.body.id_propietario,
    };
    console.log("Datos recibidos en req.body:", req.body);
    let sql;
    let param;

    // Validar que la peticion del body esté completa
    if (
      !pieza.titulo ||
      !pieza.id_autor ||
      !pieza.año ||
      !pieza.descripcion ||
      !pieza.id_coleccion ||
      !pieza.id_soporte ||
      !pieza.id_propietario
    ) {
      console.log(pieza);
      return res.send({
        error: true,
        code: 400,
        message: "Todos los campos son obligatorios.",
      });
    }
    // Validar que los datos de autor, coleccion, soporte y propietario existen en la DB
    await autorId(pieza.id_autor);
    await coleccionId(pieza.id_coleccion);
    await soporteId(pieza.id_soporte);
    await propietarioId(pieza.id_propietario);
    // Consulta
    sql =
      "INSERT INTO piezas (titulo, id_autor, año, descripcion, id_coleccion, id_soporte, id_propietario) VALUES (?,?,?,?,?,?,?);";
    param = [
      pieza.titulo,
      pieza.id_autor,
      pieza.año,
      pieza.descripcion,
      pieza.id_coleccion,
      pieza.id_soporte,
      pieza.id_propietario,
    ];
    let [result] = await pool.query(sql, param);
    // Verifica que la pieza se añadio correctamente
    if (result.insertId) {
      res.send({
        error: false,
        code: 200,
        message: "consulta postPieza realizada correctamente",
        data: String(result.insertId),
      });
      console.log("Pieza añadida correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 400,
        message: "Los datos introducidos no son correctos",
      });
      console.log("No se pudo añadir la pieza: ", result);
    }
  } catch (err) {
    console.error("Error en postPieza: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

// ? Actualizar la info de una pieza
const putPieza = async (req, res) => {
  try {
    pieza = {
      id_pieza: req.body.id_pieza,
      titulo: req.body.titulo,
      id_autor: req.body.id_autor,
      año: req.body.año,
      descripcion: req.body.descripcion,
      id_coleccion: req.body.id_coleccion,
      id_soporte: req.body.id_soporte,
      id_propietario: req.body.id_propietario,
    };
    console.log("Datos recibidos en req.body:", req.body);
    let sql;
    let param;

    // Validar que los datos de los id son correctos
    if (pieza.id_autor != null) await autorId(pieza.id_autor);
    if (pieza.id_coleccion != null) await coleccionId(pieza.id_coleccion);
    if (pieza.id_soporte != null) await soporteId(pieza.id_soporte);
    if (pieza.id_propietario != null) await propietarioId(pieza.id_propietario);
    // Almacenar los atributos y valores que se van a modificar
    let preparedStmt = {
      sql: [],
      param: [],
    };
    for (let atributo in pieza) {
      if (pieza[atributo]) {
        preparedStmt.sql.push(`${atributo} = ?`);
        preparedStmt.param.push(pieza[atributo]);
      }
    }
    let preparedId = preparedStmt.param.shift();
    // Construir la consulta solo con los parametros a modificar
    sql = `UPDATE piezas SET ${preparedStmt.sql.splice(
      1,
      preparedStmt.sql.length
    )} WHERE id_pieza = ?;`;
    preparedStmt.param.push(preparedId);
    param = preparedStmt.param;
    let [result] = await pool.query(sql, param);
    // Validar la consulta
    if (result.affectedRows > 0) {
      res.send({
        error: false,
        code: 200,
        message: "consulta putPieza correcta",
        data: result,
      });
      console.log("Pieza modificada correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 400,
        message: "No se encontro ninguna pieza con ese id",
      });
      console.log("No se pudo modificar la pieza: ", result);
    }
  } catch (err) {
    console.error("Error en putPieza: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

// ? Eliminar una pieza
const deletePieza = async (req, res) => {
  try {
    pieza = {
      id_pieza: req.body.id_pieza,
      titulo: req.body.titulo,
      id_autor: req.body.id_autor,
      año: req.body.año,
      descripcion: req.body.descripcion,
      id_coleccion: req.body.id_coleccion,
      id_soporte: req.body.id_soporte,
      id_propietario: req.body.id_propietario,
    };
    console.log("Datos recibidos en req.body:", req.body);
    let sql;
    let param;
    if (pieza) {
      sql = "DELETE FROM piezas WHERE id_pieza = ?";
      param = [pieza.id_pieza];
    }
    let [result] = await pool.query(sql, param);

    if (result.affectedRows > 0) {
      res.send({
        error: false,
        code: 200,
        message: "consulta deletePieza correcta",
        data: result,
      });
      console.log("Pieza eliminada correctamente: ", result);
    } else {
      res.send({
        error: true,
        code: 400,
        message: "No se encontro ninguna pieza con ese id",
      });
      console.log("No se pudo eliminar la pieza: ", result);
    }
  } catch (err) {
    console.error("Error en deletePieza: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

//? PRESTAMOS: piezas, dueño, fechas y y estado
const getPrestamos = async (req, res) => {
  try {
    let sql = `SELECT prs.id_prestamo, p.titulo, pr.nombre AS propietario, prs.fecha_inicio, prs.fecha_fin,
    CASE 
        WHEN prs.activo = 1 THEN 'prestamo activo'
        WHEN prs.activo = 0 THEN 'prestamo finalizado'
        ELSE 'Desconocido'
    END AS estado FROM piezas AS p
INNER JOIN prestamos AS prs ON (p.id_pieza = prs.id_pieza)
INNER JOIN propietarios AS pr ON (prs.id_propietario = pr.id_propietario)
ORDER BY prs.id_prestamo ASC;`;
    let param = [];

    let [result] = await pool.query(sql, param);
    result.length > 0 ? (prestamos = result) : (prestamos = []);

    res.send({
      error: false,
      code: 200,
      message: "consulta getPrestamos realizada correctamente",
      data: prestamos,
    });
    console.log("mostrando listado de prestamos: ", result);
  } catch (err) {
    console.error("Error en getPrestamos: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

//? Mostrar la info de las colecciones
const getColecciones = async (req, res) => {
  try {
    let sql = `SELECT c.tipo, c.nombre AS coleccion, p.titulo AS pieza
        FROM piezas AS p
      INNER JOIN colecciones AS c ON (p.id_coleccion = c.id_coleccion)
      ORDER BY c.tipo ASC, c.nombre ASC, p.titulo ASC;`;
    let param = [];

    let [result] = await pool.query(sql, param);
    let list = {};
    if (result.length > 0) {
      list = {};
      result.forEach((entry) => {
        let tipoKey = `Colecciones ${entry.tipo}s`;
        if (!list[tipoKey]) {
          list[tipoKey] = [];
        }
        let coleccion = list[tipoKey].find(
          (col) => col.coleccion === entry.coleccion
        );
        if (!coleccion) {
          list[tipoKey].push({
            coleccion: entry.coleccion,
            piezas: [],
          });
          coleccion = list[tipoKey][list[tipoKey].length - 1];
        }
        coleccion.piezas.push(entry.pieza);
      });
      colecciones = Object.entries(list).map(([key, value]) => ({
        [key]: value,
      }));
    }

    res.send({
      error: false,
      code: 200,
      message: "consulta getColecciones realizada correctamente",
      data: colecciones,
    });
    console.log("mostrando listado de colecciones: ", result);
  } catch (err) {
    console.error("Error en getColecciones: ", err.message);
    res.send({
      error: true,
      code: 500,
      message: `Algo ha fallado en el servidor: ${err.message}`,
    });
  }
};

// ? --------------------------- Funciones auxiliares -----------------------------
const coleccionId = async (id) => {
  try {
    let sql = "SELECT id_coleccion FROM colecciones WHERE id_coleccion = ?";
    let param = [id];
    let [result] = await pool.query(sql, param);
    if (result.length === 0) {
      throw new Error(`La colección con id ${id} no existe.`);
    }
    return true;
  } catch (err) {
    throw new Error(`Error en coleccionId: ${err.message}`);
  }
};

const soporteId = async (id) => {
  try {
    let sql = "SELECT id_soporte FROM soportes WHERE id_soporte = ?";
    let param = [id];
    let [result] = await pool.query(sql, param);
    if (result.length === 0) {
      throw new Error(`El soporte con id ${id} no existe.`);
    }
    return true;
  } catch (err) {
    throw new Error(`Error en soporteId: ${err.message}`);
  }
};

const autorId = async (id) => {
  try {
    let sql = "SELECT id_autor FROM autores WHERE id_autor = ?";
    let param = [id];
    let [result] = await pool.query(sql, param);
    if (result.length === 0) {
      throw new Error(`El autor con id ${id} no existe.`);
    }
    return true;
  } catch (err) {
    throw new Error(`Error en autorId: ${err.message}`);
  }
};

const propietarioId = async (id) => {
  try {
    let sql =
      "SELECT id_propietario FROM propietarios WHERE id_propietario = ?";
    let param = [id];
    let [result] = await pool.query(sql, param);
    if (result.length === 0) {
      throw new Error(`El propietario con id ${id} no existe.`);
    }
    return true; // Si existe, devuelve true
  } catch (err) {
    throw new Error(`Error en propietarioId: ${err.message}`);
  }
};

//?_________ Exports _________\\

module.exports = {
  getStart,
  getPiezas,
  getPieza,
  postPieza,
  putPieza,
  deletePieza,
  getPrestamos,
  getColecciones,
};
