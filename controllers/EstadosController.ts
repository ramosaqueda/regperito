import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import Estado from '../models/estados';


export const GetEstados= async (req:Request, res: Response) => {

    
    const estado = await Estado.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          }
    });
        res.json({
            estado
        });
    
    }

export const GetEstado = async (req:Request, res: Response) => {
    const {id} = req.params;
    const estado = await Estado.findByPk(id);
    if (estado){
        res.json({
            estado
        });

    }else{
        res.status(404).json({
            msg:`estado no encontrado con el ID ${id}`
        })

    }

   

}


export const PostEstado=async( req: Request , res: Response ) => {

    const { body } = req;
    console.log(body);
    
    try {
        const estado =  Estado.build(body);
        await estado.save();
        res.json( estado );
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutEstado= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const estado = await Estado.findByPk( id );
        if ( !estado ) {
            return res.status(404).json({
                msg: 'No existe un estado con el id ' + id
            });
        }

        await estado.update( body );

        res.json( estado );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeleteEstado= async (req:Request, res: Response) => {
        const { id } = req.params;

        const estado = await Estado.findByPk( id );
        if ( !estado ) {
            return res.status(404).json({
                msg: 'No existe un Estado con el id ' + id
            });
        }
    
        await estado.update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(estado);
    }

