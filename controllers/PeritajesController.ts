import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import Peritajes from '../models/peritajes';
import Peritos from '../models/peritos';
import Fiscales from '../models/fiscales';
import Estados from '../models/estados';

export const GetPeritajes= async (req:Request, res: Response) => {


    Peritajes.belongsTo(Peritos, {foreignKey: 'peritos_id'});
    Peritajes.belongsTo(Fiscales, {foreignKey: 'fiscales_id'});
    Peritajes.belongsTo(Estados, {foreignKey: 'estados_id'});       
    const peritajes = await Peritajes.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          },
          include: [
            { model: Peritos },  
            { model: Fiscales},
            { model: Estados},  
          ]
         
    });
        res.json({
            peritajes
        });
    
    }

export const GetPeritaje = async (req:Request, res: Response) => {
    const {id} = req.params;
    const peritaje = await Peritajes.findByPk(id);
    if (peritaje){
        res.json({
            peritaje
        });

    }else{
        res.status(404).json({
            msg:`peritaje no encontrado con el ID ${id}`
        })

    }

   

}


export const PostPeritajes=async( req: Request , res: Response ) => {

    const { body } = req;

    
    try {
        const peritaje =  Peritajes.build(body);
        await peritaje.save();
        res.json( peritaje );
    } catch (error) {
        res.status(500).json({
            msg: 'Hable con el administrador, error:' + error
        })    
    }

    

}

export const PutPeritajes= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const peritaje = await Peritajes.findByPk( id );
        if ( !peritaje ) {
            return res.status(404).json({
                msg: 'No existe un peritaje con el id ' + id
            });
        }

        await peritaje.update( body );

        res.json( peritaje );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeletePeritaje= async (req:Request, res: Response) => {
        const { id } = req.params;

        const peritaje = await Peritajes.findByPk( id );
        if ( !peritaje ) {
            return res.status(404).json({
                msg: 'No existe un Peritaje con el id ' + id
            });
        }
    
        await peritaje.update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(peritaje);
    }

