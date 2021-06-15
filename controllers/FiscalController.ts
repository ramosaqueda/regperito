import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import Fiscal from '../models/fiscales';


export const GetFiscales = async (req:Request, res: Response) => {

    
    const fiscal = await Fiscal.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          }
    });
        res.json({
            fiscal
        });
    
    }

export const GetFiscal = async (req:Request, res: Response) => {
    const {id} = req.params;
    const fiscal = await Fiscal.findByPk(id);
    if (fiscal){
        res.json({
            fiscal
        });

    }else{
        res.status(404).json({
            msg:`fiscal no encontrado con el ID ${id}`
        })

    }

   

}


export const PostFiscal=async( req: Request , res: Response ) => {

    const { body } = req;
    console.log(body);
    
    try {
        
        const existeRut= await Fiscal.findOne({
            where: {
                rut_fiscal: body.rut_fiscal
            }
        });

        if (existeRut) {
            return res.status(400).json({
                msg: 'Ya existe un registro con el RUT' + body.rut_fiscal
            });
        }

        const fiscal =  Fiscal.build(body);
        await fiscal.save();

        res.json( fiscal );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutFiscal= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const perito = await Fiscal.findByPk( id );
        if ( !perito ) {
            return res.status(404).json({
                msg: 'No existe un fiscal con el id ' + id
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

    export const DeleteFiscal= async (req:Request, res: Response) => {
        const { id } = req.params;

        const fiscal = await Fiscal.findByPk( id );
        if ( !fiscal ) {
            return res.status(404).json({
                msg: 'No existe un Perito con el id ' + id
            });
        }
    
        await fiscal.update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(fiscal);
    }

