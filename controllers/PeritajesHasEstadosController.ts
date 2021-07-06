import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import PeritajesHasEstado from '../models/peritajes_has_estados';


export const GetPeritajesHasEstados= async (req:Request, res: Response) => {


    
    
    const peritaje_has_estado = await PeritajesHasEstado.findAll({
        attributes: ["peritajes_id", "estados_id"],
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          }
    });
        res.json({
            peritaje_has_estado 
        });
    
    }

export const GetPeritajeHasEstado = async (req:Request, res: Response) => {
    const {id} = req.params;
    const peritaje_has_estado  = await PeritajesHasEstado.findByPk(id);
    if (peritaje_has_estado ){
        res.json({
            peritaje_has_estado 
        });

    }else{
        res.status(404).json({
            msg:`estado no encontrado con el ID ${id}`
        })

    }

   

}


export const PostPeritajeHasEstado=async( req: Request , res: Response ) => {

    const { body } = req;
    console.log(body);
    
    try {
        const peritaje_has_estado  =  PeritajesHasEstado.build(body);
        await peritaje_has_estado .save();
        res.json( peritaje_has_estado  );
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutPeritajeHasEstado= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const peritaje_has_estado  = await PeritajesHasEstado.findByPk( id );
        if ( !peritaje_has_estado  ) {
            return res.status(404).json({
                msg: 'No existe un estado con el id ' + id
            });
        }

        await peritaje_has_estado .update( body );

        res.json( peritaje_has_estado  );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeletePeritajeHasEstado= async (req:Request, res: Response) => {
        const { id } = req.params;

        const peritaje_has_estado  = await PeritajesHasEstado.findByPk( id );
        if ( !peritaje_has_estado  ) {
            return res.status(404).json({
                msg: 'No existe un Estado con el id ' + id
            });
        }
    
        await peritaje_has_estado .update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(peritaje_has_estado );
    }

