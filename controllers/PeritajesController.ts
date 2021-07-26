import { Request,Response } from 'express';
import { json } from 'sequelize/types';
import {Op,fn,col,QueryTypes} from 'sequelize';
 

import Peritajes from '../models/peritajes';
import Peritos from '../models/peritos';
import Fiscales from '../models/fiscales';
import Estados from '../models/estados';
import PeritajesHasEstado from '../models/peritajes_has_estados';
 



export const GetPeritajes= async (req:Request, res: Response) => {


    Peritajes.belongsTo(Peritos, {foreignKey: 'peritos_id'});
    Peritajes.belongsTo(Fiscales, {foreignKey: 'fiscales_id'});
    
    const peritajes = await Peritajes.findAll({
        where: {
            estado:{
                [Op.not]: false //con esto solo muestro los estados activos true
            }
          },
          include: [
            { model: Peritos },  
            { model: Fiscales},
           
          ]
         
    });
        res.json({
            peritajes
        });
    
    }


    export const GetPeritajeporuc= async (req:Request, res: Response) => {

        const {ruc} = req.params;
        console.log(ruc);
        Peritajes.belongsTo(Peritos, {foreignKey: 'peritos_id'});
        Peritajes.belongsTo(Fiscales, {foreignKey: 'fiscales_id'});
        Peritajes.belongsTo(Estados, {foreignKey: 'estados_id'});       
        const peritajes = await Peritajes.findAll({
            where: {
                ruc:ruc 
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
        if (peritaje){
            console.log(peritaje.getDataValue('id'));
            

          let perhesdatosd  = ({
                 "PeritajeId": peritaje.getDataValue('id'),
                "EstadoId" :body.estados_id
            });

             
            const peritaje_has_estado  =  PeritajesHasEstado.build(perhesdatosd);
             peritaje_has_estado.save();
             console.log(peritaje_has_estado);
            
 
            res.json( peritaje );
        }
       
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

    export const GetPeritajesByMonth= async (req:Request, res: Response) => {      
         
        let query = 'SELECT DISTINCT  Count(peritajes.id) AS SUMA, MONTH(peritajes.fecha) AS MES  FROM   peritajes   WHERE  YEAR(peritajes.fecha) =2021 GROUP BY 	MES';        
        const peritajes = await Peritajes.sequelize?.query(query,
            {
                type: QueryTypes.SELECT 
            }
            );   
        
            res.json({
                peritajes
            });        
        }