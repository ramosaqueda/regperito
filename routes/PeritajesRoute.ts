import { Router } from 'express';
import { GetPeritajes,GetPeritaje, PostPeritajes, PutPeritajes, DeletePeritaje } from '../controllers/PeritajesController';
const router = Router();
router.get('/',     GetPeritajes);
router.get('/:id',  GetPeritaje);
router.post('/',    PostPeritajes);
router.put('/:id',  PutPeritajes);
router.delete('/:id',DeletePeritaje);
 

export default router;