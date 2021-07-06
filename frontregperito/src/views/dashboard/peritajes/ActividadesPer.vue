<template>
    <v-container
    id="identificacion"
    fluid
    tag="section"
  >
  

   
   
    
    <v-row>
     <v-col
            cols="12"
            sm="4"
          >
            <v-text-field
              v-model="text_ruc"
              label="RUC"
              outlined
              clearable
              
            ></v-text-field>
     </v-col>
    <v-col
            cols="12"
            sm="6"
          >
          <v-btn
        
        color="primary"
        dark
        @click="busqueda_ruc"
      >
       Buscar Causa
      </v-btn>
    </v-col>
    </v-row>

<v-row>
<v-col     
  cols="6"
   >
  <v-stepper v-model="e1" >
      <v-stepper-header>
        <v-stepper-step
          :complete="e1 > 1"
          step="1"
        >
          Lista de Peritajes
        </v-stepper-step>

        <v-divider></v-divider>

        <v-stepper-step
          :complete="e1 > 2"
          step="2"
        >
          Agregar Actividades
        </v-stepper-step>

        <v-divider></v-divider>

        
      </v-stepper-header>

      <v-stepper-items>
        <v-stepper-content step="1">
          <v-card
            class="mb-6"
            color="grey lighten-1"
            height="200px"
          >
          
          
      <v-data-table
        :headers="headers"
        :items="peritajes"
        sort-by="fecha"
        item-key="id"
          @click:row="rowClicked"

    >
      </v-data-table>
        
          </v-card>
        
        </v-stepper-content>

        <v-stepper-content step="2">
          <v-card
            class="mb-6" 
            height="450px"
          >
            
        
        <v-select
            :items="tipoacts"
            label="Tipo Atividad"
            item-text="gls_tipoact" item-value="id"
            v-model="tipo_act_id"
          ></v-select> 


            <v-menu
                  v-model="calendario"
                  :close-on-content-click="false"
                  :nudge-right="40"
                  transition="scale-transition"
                  offset-y
                  min-width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="date"
                      label="Fecha Ingreso"
                      prepend-icon="mdi-calendar"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                      
                    ></v-text-field>
                  </template>
                  <v-date-picker
                    v-model="date"
                    @input="calendario = false"
                  ></v-date-picker>
                </v-menu> 





                  <v-textarea
                    class="purple-input"
                    label="OBSERVACIONES"
                    v-model="obs_actividad"
                
                  />

                <v-select
                  :items="ubicaciones"
                  label="Ubicación"
                  item-text="gls_ubicacion" item-value="id"
                  v-model="ubicacion_id"
                ></v-select> 

               <v-btn
                  color="primary"
                  @click="grabar()"
                >
                  Grabar
                </v-btn>

                 <v-btn
                  color="warning"
                  @click="e1 = 1"
                >
                  Volver
                </v-btn>
          


          
          </v-card>

          
        </v-stepper-content>

          
      </v-stepper-items>
  </v-stepper>

</v-col>   
    
 
  <v-col>
      
      

    <base-material-card
    color="success"
    title="Actividades realizadas"  
    class="px-5 py-3"
  >
      <v-data-table
        :headers="headers_act"
        :items="actividades"
        class="elevation-3"
        :dark=true
        :dense=true
        hide-default-header="true"
        hide-default-footer="true"
        :single-expand="singleExpand"
        :expanded.sync="expanded"
        item-key="id"
        show-expand
    >

    <template v-slot:top>
        
        
      </template>
      <template v-slot:expanded-item="{ headers, item }">
        <td :colspan="headers.length">
          Observaciones: {{ item.obs_actividad }}
        </td>
      </template>


    </v-data-table>

        </base-material-card>
    
  </v-col>
           
</v-row>         


    <base-material-snackbar
      v-model="dialogo_ok"
      :type="color"
      :top=true
      >
      {{ text }}

    </base-material-snackbar>
    
    </v-container>



</template>
<script>
  import axios from 'axios'
  export default {
   data: () => ({
     text_ruc:'',
     e1:1,
    expandirtabla: false,
    dialog: false,
    dialogo_ok: false,
    ip:window.location.hostname,
    calendario:false,
    tipoacts:[],
    actividades:[],
    date: new Date().toISOString().substr(0, 10),
   
    text:'',
    obs_act:'',
    
    color: 'info',
    dialogo_ok:false,
    titulo_dialog:'OK',
    headers: [
    
     
      
      { text: 'NUE', value: 'nue'},
      {text: 'Desc.', value: 'gls_peritaje' },
    
    ],

    headers_act: [
    
     
      
      { text: 'Fecha Act.', value: 'fecha_act'},
      {text: 'Tipo Act..', value: 'tipo_act.gls_tipoact' },

      {text: 'Ubicación.', value: 'Ubicacion.gls_ubicacion' },
    

    ],


 
  fecha_act :'',
  tipo_act_id:'',
  ubicacion_id:1,
  obs_actividad:'',
 
    peritajes: [],
    ubicaciones:[],
    editedIndex: -1,
    
    peritajes_id:'',
    
  }),
  created () {
         
            this.select_act()
            
        },
  methods:{
    formatDate (date) {
        if (!date) return null
        const [year, month, day] = date.split('-')
        return `${month}/${day}/${year}`
      },
      parseDate (date) {
        if (!date) return null

        const [month, day, year] = date.split('/')
        return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`
      },


      select_act(){
                let me=this;
                let header={"Token" : "nadaporahora"};
                let configuracion= {headers : header};
                let url = 'http://'+me.ip+':3000/api/tipoact';
                axios.get(url).then((response) => {
                        me.tipoacts = response.data.tipoact;
                    
                }).catch(function(error){
                    console.log(error);
                });
     },
    initialize () {
      
        
    },

    
    rowClicked(row){
       let me=this;
       me.peritajes_id=row.id;
       this.lista_act();
       this.lista_ubicacion();
       me.e1=2;
    
    },
    lista_act(){
         
         let me=this;

         let url = 'http://'+me.ip+':3000/api/actividades/per_id/'+me.peritajes_id;
         axios.get(url).then((response) => {
                        me.actividades = response.data.actividades;
                    
                }).catch(function(error){
                    console.log(error);
                });
    },

    lista_ubicacion(){
        let me=this;
        let url = 'http://'+me.ip+':3000/api/ubicacion';
         
         axios.get(url).then((response) => {
                        me.ubicaciones = response.data.ubicaciones;
                    
                }).catch(function(error){
                    console.log(error);
                });
    },

    busqueda_ruc(){
      let me=this;
        let header={"Token" : "nadaporahora"};
        let rc = me.text_ruc;
        let configuracion= {headers : header};  
        let url = 'http://'+me.ip+':3000/api/peritajes/ruc/'+rc;
        axios.get(url).then((response) => {
                me.peritajes = response.data.peritajes;
            
        }).catch(function(error){
            console.log(error);
        });
    },
    grabar()
    {
      
       let me =this;
 
  

            me.fecha_act= me.date;
          let header={"Token" : "nadaporahora"};
          let configuracion= {headers : header};
            let url = 'http://'+me.ip+':3000/api/actividades';
            axios.post(url,{
                          'fecha_act':    this.fecha_act ,
                          'tipo_act_id':  this.tipo_act_id ,
                          'tipo_act_id':  this.tipo_act_id  ,
                          'obs_actividad':this.obs_actividad ,
                          'peritajes_id': this.peritajes_id ,
                          'ubicacion_id': this.ubicacion_id ,
                          'estado':true
                        

                    },configuracion)
                    .then(function(response){
                        me.color = 'success';
                        me.text =' Registro agregado con éxio';
                        me.dialogo_ok = true;
                        me.lista_act();
                        me.limpiar();
                      
                    })
                    .catch(function(error){
                      console.log(error.response);
                        me.color = 'error';
                        me.text ='Ha sucedido un error ' + error.response.data.msg;
                        me.dialogo_ok = true;
                        console.log(error);
                    });

 
    },
    limpiar(){
      let me =this;
        me.fecha_act ='',
        me.tipo_act_id='',
        me.ubicacion_id=1,
        me.obs_actividad='',
        me.ubicaciones=[],
        me.peritajes=[]
        me.e1=1;
        me.text_ruc='';
    

    }
  }
  }
</script>