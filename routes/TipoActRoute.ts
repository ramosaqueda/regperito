import { Router } from 'express';
import { GetTipoActs,GetTipoAct,  } from '../controllers/Tipo_actividadController';
const router = Router();

router.get('/',     GetTipoActs);
router.get('/:id',  GetTipoAct);
 

export default router;