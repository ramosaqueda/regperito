import { Router } from 'express';
import { GetPeritajes,GetPeritaje,GetPeritajeporuc, PostPeritajes, PutPeritajes, DeletePeritaje ,GetPeritajesMes} from '../controllers/PeritajesController';
const router = Router();
router.get('/',     GetPeritajes);
router.get('/:id',  GetPeritaje); 
router.get('/ruc/:ruc',  GetPeritajeporuc);
router.get('/mes/:mes',  GetPeritajesMes);
router.post('/',    PostPeritajes);
router.put('/:id',  PutPeritajes);
router.delete('/:id',DeletePeritaje);
 

export default router;