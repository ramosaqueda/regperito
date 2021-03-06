import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import { Op } from 'sequelize';
import Actividades from '../models/actividades';
import { PostPeritajes } from './PeritajesController';
import  Tipo_Actividad  from '../models/tipo_actividad';
import Ubicacion from '../models/ubicacion';



export const GetActividades= async (req:Request, res: Response) => {

    
    const actividades = await Actividades.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          }
    });
        res.json({
            actividades
        });
    
    }


export const GetActividadxruc= async (req:Request, res: Response) => {
    const {id} = req.params;
    Actividades.belongsTo(Tipo_Actividad, {foreignKey: 'tipo_act_id'});
    Actividades.belongsTo(Ubicacion,{foreignKey: 'ubicacion_id'} );
    const  actividades = await Actividades.findAll({
        where: {
            peritajes_id: id
        },
        include: [
            { model: Tipo_Actividad },  
            { model: Ubicacion},
           
          ]
                
    });
        res.json({
            actividades
        });
    
    }
     
export const GetActividad = async (req:Request, res: Response) => {
    const {id} = req.params;
    const actividad = await Actividades.findByPk(id);
    if (actividad){
        res.json({
            actividad
        });

    }else{
        res.status(404).json({
            msg:`actividad no encontrada con el ID ${id}`
        })

    }

   

}


export const PostActividades=async( req: Request , res: Response ) => {

    const { body } = req;

    
    try {
        const actividad =  Actividades.build(body);
        await actividad.save();
        res.json( actividad );
    } catch (error) {
        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }

    

}

export const PutActividades= async (req:Request, res: Response) => {
    const { id }   = req.params;
    const { body } = req;

    try {
        
        const actividad = await Actividades.findByPk( id );
        if ( !actividad ) {
            return res.status(404).json({
                msg: 'No existe un actividad con el id ' + id
            });
        }

        await actividad.update( body );

        res.json( actividad );


    } catch (error) {

        console.log(error);
        res.status(500).json({
            msg: 'Hable con el administrador'
        })    
    }   
}

    export const DeleteActividad= async (req:Request, res: Response) => {
        const { id } = req.params;

        const actividad = await Actividades.findByPk( id );
        if ( !actividad ) {
            return res.status(404).json({
                msg: 'No existe un Actividad con el id ' + id
            });
        }
    
        await actividad.update({ estado: false });
    
        // await Perito.destroy();
    
    
        res.json(actividad);
    }

