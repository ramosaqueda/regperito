import { Router } from 'express';
 
import { GetPeritajes,GetPeritaje,GetPeritajeporuc, PostPeritajes, PutPeritajes, DeletePeritaje,GetPeritajesByMonth} from '../controllers/PeritajesController';
 
const router = Router();
router.get('/',     GetPeritajes);
router.get('/:id',  GetPeritaje); 
router.get('/month/:ano',  GetPeritajesByMonth);
router.get('/ruc/:ruc',  GetPeritajeporuc);
router.post('/',    PostPeritajes);
router.put('/:id',  PutPeritajes);
router.delete('/:id',DeletePeritaje);
export default router;

 
