import { Router } from 'express';
import { GetEstados,GetEstado, PostEstado, PutEstado,DeleteEstado } from '../controllers/EstadosController';
const router = Router();

router.get('/',     GetEstados);
router.get('/:id',  GetEstado);
router.post('/',    PostEstado);
router.put('/:id',  PutEstado);
router.delete('/:id',DeleteEstado);
 

export default router;