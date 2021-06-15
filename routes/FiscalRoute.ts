import { Router } from 'express';
import { GetFiscal, GetFiscales, PostFiscal,PutFiscal,DeleteFiscal } from '../controllers/FiscalController';
const router = Router();

router.get('/',     GetFiscales);
router.get('/:id',  GetFiscal);
router.post('/',    PostFiscal);
router.put('/:id',  PutFiscal);
router.delete('/:id',DeleteFiscal);
 

export default router;