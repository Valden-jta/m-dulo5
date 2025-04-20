// *---------------------- template ---------------------- *\\

//?_________  Imports _________\\
const { Router } = require("express");
const router = Router();

const studentsCtrl = require("../controller/students.controller");

//?_________  rutas y metodos _________\\
router.get("/", studentsCtrl.getStart);
router.get("/alumnos/:id", studentsCtrl.getStudent);
router.get("/alumnos/", studentsCtrl.getAllStudents);
router.post("/alumnos", studentsCtrl.postStudent);
router.put("/alumnos", studentsCtrl.putStudent);
router.delete("/alumnos", studentsCtrl.deleteStudent);

//?_________  Exports _________\\
module.exports = router;
