import { Router } from 'express';
import { GetTipoPers,GetTipoPer, PostTipoPer, PutTipoPer,DeleteTipoPer } from '../controllers/Tipo_peritajeController';
const router = Router();

router.get('/',     GetTipoPers);
router.get('/:id',  GetTipoPer);
router.post('/',    PostTipoPer);
router.put('/:id',  PutTipoPer);
router.delete('/:id',DeleteTipoPer);
 

export default router;