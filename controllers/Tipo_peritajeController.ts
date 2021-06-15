import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import TipoPer from '../models/tipo_pertiaje';


export const GetTipoPers= async (req:Request, res: Response) => {

    
    const tipoper = await TipoPer.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los tipoper activos true
            }
          }
    });
        res.json({
            tipoper
        });
    
    }

export const GetTipoPer = async (req:Request, res: Response) => {
    const {id} = req.params;
    const tipoper = await TipoPer.findByPk(id);
    if (tipoper){
        res.json({
            tipoper
        });

    }else{
        res.status(404).json({
            msg:`tipoper no encontrado con el ID ${id}`
        })

    }

   

}


export const PostTipoPer=async( req: Request , res: Response ) => {

    const { body } = req;
    console.log(body);
    
    try {
        const tipoper =  TipoPer.build(body);
        await tipoper.save();
        res.json( tipoper );
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutTipoPer= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const tipoper = await TipoPer.findByPk( id );
        if ( !tipoper ) {
            return res.status(404).json({
                msg: 'No existe un tipoper con el id ' + id
            });
        }

        await tipoper.update( body );

        res.json( tipoper );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeleteTipoPer= async (req:Request, res: Response) => {
        const { id } = req.params;

        const tipoper = await TipoPer.findByPk( id );
        if ( !tipoper ) {
            return res.status(404).json({
                msg: 'No existe un TipoPer con el id ' + id
            });
        }
    
        await tipoper.update({ tipoper: false });
    
        // await Perito.destroy();
    
    
        res.json(tipoper);
    }

