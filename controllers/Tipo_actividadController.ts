import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import TipoAct from '../models/tipo_actividad';


export const GetTipoActs= async (req:Request, res: Response) => {

    
    const tipoact = await TipoAct.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los tipoact activos true
            }
          }
    });
        res.json({
            tipoact
        });
    
    }

export const GetTipoAct= async (req:Request, res: Response) => {
    const {id} = req.params;
    const tipoact = await TipoAct.findByPk(id);
    if (tipoact){
        res.json({
            tipoact
        });

    }else{
        res.status(404).json({
            msg:`tipoact no encontrado con el ID ${id}`
        })

    }

   

}
 

