import { Router } from 'express';
import { GetActividades,GetActividadxruc, GetActividad, PostActividades, PutActividades,DeleteActividad } from '../controllers/ActiviadesController';
const router = Router();

router.get('/',     GetActividades);
router.get('/per_id/:id', GetActividadxruc);
router.get('/:id',  GetActividad);
router.post('/',    PostActividades);
router.put('/:id',  PutActividades);
router.delete('/:id',DeleteActividad);
 

export default router;