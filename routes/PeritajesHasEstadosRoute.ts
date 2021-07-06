import { Router } from 'express';
import { GetPeritajesHasEstados,GetPeritajeHasEstado,PostPeritajeHasEstado,PutPeritajeHasEstado,DeletePeritajeHasEstado} from '../controllers/PeritajesHasEstadosController';
const router = Router();

router.get('/',     GetPeritajesHasEstados);
router.get('/:id',  GetPeritajeHasEstado);
router.post('/',    PostPeritajeHasEstado);
router.put('/:id',  PutPeritajeHasEstado);
router.delete('/:id',DeletePeritajeHasEstado);
 

export default router;