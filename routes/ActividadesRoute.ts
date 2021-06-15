import { Router } from 'express';
import { GetActividades,GetActividad, PostActividades, PutActividades,DeleteActividad } from '../controllers/ActiviadesController';
const router = Router();

router.get('/',     GetActividades);
router.get('/:id',  GetActividad);
router.post('/',    PostActividades);
router.put('/:id',  PutActividades);
router.delete('/:id',DeleteActividad);
 

export default router;