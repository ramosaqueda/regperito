import { Router } from 'express';
import { GetUbicacion,GetUbicaciones,PostUbicacion} from '../controllers/UbicacionController';
const router = Router();

router.get('/',     GetUbicaciones);
router.get('/:id',  GetUbicacion);
router.post('/',    PostUbicacion);
/*router.put('/:id',  PutEstado);
router.delete('/:id',DeleteEstado);*/
 

export default router;