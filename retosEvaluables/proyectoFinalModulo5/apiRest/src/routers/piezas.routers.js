// *---------------------- template ---------------------- *\\

//?_________  Imports _________\\ 
const {Router} = require('express');                        
const router = Router();


//?_________  rutas y metodos _________\\ 
const piezasCtrl = require('../controller/piezas.controller'); 

router.get('/', piezasCtrl.getStart);
router.get('/piezas/', piezasCtrl.getPiezas);
router.get('/piezas/:id', piezasCtrl.getPieza);
router.post('/piezas', piezasCtrl.postPieza);
router.put('/piezas', piezasCtrl.putPieza);
router.delete('/piezas', piezasCtrl.deletePieza);
router.get('/prestamos', piezasCtrl.getPrestamos);
router.get('/colecciones', piezasCtrl.getColecciones);


//?_________  Exports _________\\ 
module.exports = router;