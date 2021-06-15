import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import Perito from '../models/peritos';
import {Op} from 'sequelize';


export const GetPeritos = async (req:Request, res: Response) => {
    const peritos = await Perito.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          }
    });
        res.json({
            peritos
        });
    
    }

export const GetPerito = async (req:Request, res: Response) => {
    const {id} = req.params;
    const perito = await Perito.findByPk(id);
    if (perito){
        res.json({
            perito
        });

    }else{
        res.status(404).json({
            msg:`perito no encontrado con el ID ${id}`
        })

    }

   

}


export const PostPerito=async( req: Request , res: Response ) => {

    const { body } = req;
    
    try {
        
        const existeEmail = await Perito.findOne({
            where: {
                email: body.email
            }
        });

        if (existeEmail) {
            return res.status(400).json({
                msg: 'Ya existe un perito con el email ' + body.email
            });
        }

        const perito =  Perito.build(body);
        await perito.save();

        res.json( perito );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutPerito= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const perito = await Perito.findByPk( id );
        if ( !perito ) {
            return res.status(404).json({
                msg: 'No existe un perito con el id ' + id
            });
        }

        await perito.update( body );

        res.json( perito );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeletePerito= async (req:Request, res: Response) => {
        const { id } = req.params;

        const perito = await Perito.findByPk( id );
        if ( !perito ) {
            return res.status(404).json({
                msg: 'No existe un Perito con el id ' + id
            });
        }
    
        await perito.update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(perito);
    }

