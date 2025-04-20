// *---------------------- template ---------------------- *\\

//?_________  Imports _________\\
const { Router } = require("express");
const router = Router();

const subjectsMarksCtrl = require("../controller/subjectsMarks.controller");

//?_________  rutas y metodos _________\\
router.get("/", subjectsMarksCtrl.getStart);
router.get("/media/:id", subjectsMarksCtrl.getStudentAvg);
router.get("/apuntadas/:id", subjectsMarksCtrl.getStudentSubjects);
router.get("/apuntadas", subjectsMarksCtrl.getAllStudentSubjects);
router.get("/impartidas/:id", subjectsMarksCtrl.getTeacherSubjects);
router.get("/impartidas", subjectsMarksCtrl.getAllTeacherSubjects);

//?_________  Exports _________\\
module.exports = router;
