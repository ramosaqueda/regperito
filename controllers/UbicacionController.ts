import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import Ubicacion from '../models/ubicacion';


export const GetUbicaciones= async (req:Request, res: Response) => {

    
    const ubicaciones = await Ubicacion.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los tipoper activos true
            }
          }
    });
        res.json({
            ubicaciones
        });
    
    }

export const GetUbicacion = async (req:Request, res: Response) => {
    const {id} = req.params;
    const ubicaciones = await Ubicacion.findByPk(id);
    if (ubicaciones){
        res.json({
            ubicaciones
        });

    }else{
        res.status(404).json({
            msg:`ubicación no encontrado con el ID ${id}`
        })

    }

   

}


export const PostUbicacion=async( req: Request , res: Response ) => {

    const { body } = req;
    console.log(body);
    
    try {
        const ubicaciones =  Ubicacion.build(body);
        await ubicaciones.save();
        res.json( ubicaciones );
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}