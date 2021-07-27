import { Router } from 'express';
<<<<<<< HEAD
import { GetPeritajes,GetPeritaje,GetPeritajeporuc, PostPeritajes, PutPeritajes, DeletePeritaje ,GetPeritajesMes} from '../controllers/PeritajesController';
=======
import { GetPeritajes,GetPeritaje,GetPeritajeporuc, PostPeritajes, PutPeritajes, DeletePeritaje,GetPeritajesByMonth} from '../controllers/PeritajesController';
>>>>>>> 035e9b6252b27d08cd0fe8d44f5825c351ea7307
const router = Router();
router.get('/',     GetPeritajes);
router.get('/:id',  GetPeritaje); 
router.get('/month/:ano',  GetPeritajesByMonth);
router.get('/ruc/:ruc',  GetPeritajeporuc);
router.get('/mes/:mes',  GetPeritajesMes);
router.post('/',    PostPeritajes);
router.put('/:id',  PutPeritajes);
router.delete('/:id',DeletePeritaje);
export default router;

 
