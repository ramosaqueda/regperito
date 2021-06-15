import { Router } from 'express';
import { DeletePerito, GetPerito, GetPeritos, PostPerito, PutPerito } from '../controllers/PeritoController';
const router = Router();

router.get('/',     GetPeritos);
router.get('/:id',  GetPerito);
router.post('/',    PostPerito);
router.put('/:id',  PutPerito);
router.delete('/:id',DeletePerito);
 

export default router;