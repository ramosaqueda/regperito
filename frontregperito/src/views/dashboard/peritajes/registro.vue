<template>
  <v-container
    id="user-profile"
    fluid
    tag="section"
  >
    <v-row justify="center">
      <v-col
        cols="12"
        md="10"
      >
        <base-material-card>
          <template v-slot:heading>
            <div class="display-2 font-weight-light">
              SOLICITUD DE PERITAJE
            </div>

            <div class="subtitle-1 font-weight-light">
              Complete información de solicitud.
            </div>
          </template>

          <v-form>
            <v-container class="py-0">
              <v-row>
                <v-col
                  cols="12"
                  md="4"
                >
                  <v-text-field
                    label="RUC"
                    class="font-weight-black"
                    v-model="ruc"
                  />
                </v-col>

                <v-col
                  cols="12"
                  md="8"
                >
                  <v-select
                    :items="fiscales"
                    item-text="nombre_fiscal" item-value="id"
                    label="FISCAL"
                    v-model="fiscales_id"
                     
                  ></v-select>
                </v-col>

                 

                <v-col
                  cols="12"
                  md="6"
                >
                  
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
                



                </v-col>

                <v-col
                  cols="12"
                  md="6"
                >
                  <v-text-field
                    class="purple-input"
                    label="Plazo de la pericia"
                    type="number"
                    default="30"
                    v-model="plazo"
                  />
                </v-col>

                <v-col cols="12">
                   <v-textarea
                    counter
                    class="purple-input"
                    label="Detalle de la solicitud"
                    value="Se solicita..."
                    rows="2"
                    :rules="rules"
                    v-model="gls_peritaje"
                  />
                </v-col>

                <v-col
                  cols="12"
                  md="4"
                >
                  <v-text-field
                    label="NUE"
                    class="purple-input"
                    v-model="nue"
                  />
                </v-col>

                <v-col
                  cols="12"
                  md="4"
                >
                   

             
                
                 <v-select
                      :items="peritos"
                       item-text="nombre_perito" item-value="id"
                      label="PERITO ASIGNADO"
                      v-model="peritos_id"
                  ></v-select>


                </v-col>

               

                 

                <v-col cols="12">
                  <v-textarea
                    class="purple-input"
                    label="OTRAS OBSERVACIONES"
                    v-model="obs_peritaje"
                
                  />
                </v-col>

                <v-col
                  cols="12"
                  class="text-right"
                >

                   <v-btn
                    color="success"
                    class="mr-0"
                   @click="grabar"
                  >
                   Grabar Solicitud
                  </v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-form>
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
    fiscales: [],
    peritos:[],
    cajas:['Caja 1','Caja 2'],
    rules: [v => v.length <= 200 || 'Max 200 caracteres'],
    date: new Date().toISOString().substr(0, 10),
    calendario: false,
     
    ruc:'',
    fecha: '',
    nue:'',
    plazo:'',
    gls_peritaje:'',
    obs_peritaje:'',
    estado:'',
    tipo_peritaje_id:'',
    fiscales_id:'',
    peritos_id:'',
    estados_id:'',
    dialogo_ok:false,
    titulo_dialog:'OK',
    ip:window.location.hostname,

    text:'',

    color: 'info',
      colors: [
        'info',
        'success',
        'warning',
        'error',
      ],
    
  }),
   

 created () {
         
            this.select_perito(),
            this.select_fiscal()
        },
   


   methods: {
     limpiar(){
        this.ruc='',
        this.fecha= '',
        this.nue='',
        this.plazo='',
        this.gls_peritaje='',
        this.obs_peritaje='',
        this.estado='',
        this.tipo_peritaje_id='',
        this.fiscales_id='',
        this.peritos_id='',
        this.estados_id='' 
     },
     grabar(){
       
       let me=this;
       
           me.fecha= me.date;
          let header={"Token" : "nadaporahora"};
          let configuracion= {headers : header};
            let url = 'http://'+me.ip+':3000/api/peritajes';
            axios.post(url,{
                          'ruc':                     this.ruc ,
                          'fecha':                   this.fecha ,
                          'nue':                     this.nue  ,
                          'plazo':                   this.plazo ,
                          'gls_peritaje':            this.gls_peritaje ,
                          'obs_peritaje':            this.obs_peritaje ,
                          'estado':                  this.estado ,
                          'tipo_peritaje_id':        this.tipo_peritaje_id  ,
                          'fiscales_id':             this.fiscales_id  ,
                          'peritos_id':              this.peritos_id  ,
                          'estados_id':'1',
                          'estado':true,
                          'tipo_peritaje_id':1
                        

                    },configuracion)
                    .then(function(response){
                        me.color = 'success';
                        me.text =' Registro agregado con éxio';
                        me.dialogo_ok = true;
                        me.limpiar();
                      
                    })
                    .catch(function(error){
                      console.log(error.response);
                        me.color = 'error';
                        me.text ='Ha sucedido un error ' + error.response.data.msg;
                        me.dialogo_ok = true;
                        console.log(error);
                    });


        /*me.ruc:'',
        me.fecha: '',
        me.nue:'',
        me.plazo:'',
        me.gls_peritaje:'',
        me.obs_peritaje:'',
        me.estado:'',
        me.tipo_peritaje_id:'',
        me.fiscales_id:'',
        me.peritos_id:'',
        me.estados_id:'' */
       


     },
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

     select_perito(){
                let me=this;
                let header={"Token" : "nadaporahora"};
                let configuracion= {headers : header};  
                let url = 'http://'+me.ip+':3000/api/peritos';
                
                axios.get(url).then((response) => {
                        me.peritos = response.data.peritos;
                    
                }).catch(function(error){
                    console.log(error);
                });
     },

     select_fiscal(){
                let me=this;
                let header={"Token" : "nadaporahora"};
                let configuracion= {headers : header};
                let url = 'http://'+me.ip+':3000/api/fiscal';
                axios.get(url).then((response) => {
                        me.fiscales = response.data.fiscal;
                    
                }).catch(function(error){
                    console.log(error);
                });
     },


     

   }



  }
</script>
