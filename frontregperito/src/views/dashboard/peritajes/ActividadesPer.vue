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

     <v-col>
      <v-data-table
        :headers="headers"
        :items="peritajes"
        sort-by="fecha"
        class="elevation-3"
        item-key="id"
         @click:row="rowClicked"

    >
     </v-data-table>
     </v-col>


     <v-col title="Actividades">
 
       <v-text-field
        label="ID"
        v-model="id"
            disabled
         />
        <v-select
            :items="tipoacts"
            label="Tipo Atividad"
             item-text="gls_tipoact" item-value="id"
          ></v-select>  
          

        
    </v-col>
    </v-row>

    
    </v-container>



</template>
<script>
  import axios from 'axios'
  export default {
   data: () => ({
     text_ruc:'',
    dialog: false,
    dialogDelete: false,
    ip:window.location.hostname,
    tipoacts:[],
   
    text:'',
    
    color: 'info',
    dialogo_ok:false,
    titulo_dialog:'OK',
    headers: [
    
     
      
      { text: 'NUE', value: 'nue'},
      {text: 'Desc.', value: 'gls_peritaje' },
    
    ],
    peritajes: [],
    editedIndex: -1,
    
    id:'',
    
  }),
  created () {
         
            this.select_act()
            
        },
  methods:{

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
       me.id=row.id;
    
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
  }
  }
</script>