<template>
  <v-container
    id="regular-tables"
    fluid
    tag="section"
  >
 

    <base-material-card
      icon="mdi-clipboard-text"
      title="Lista de Peritajes"
      class="px-5 py-3"
    >



    
  
   <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="BUSCAR"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
     <v-data-table
        :headers="headers"
        :items="peritajes"
        :search="search"
        class="elevation-1"

    >
      <template v-slot:top>
        <v-toolbar
          flat
        >
           
          <v-dialog
            v-model="dialog"
            max-width="900px"
          >
            
            <v-card>
              <v-card-title>
                <span class="headline">{{ formTitle }}</span>
              </v-card-title>
  
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="editedItem.ruc"
                        label="RUC"
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="8"
                    >
                     
                     <v-select
                      :items="fiscales"
                      item-text="nombre_fiscal" item-value="id"
                      label="FISCAL"
                      v-model="editedItem.fiscales_id"
                   ></v-select>



                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="editedItem.fecha"
                        label="Fecha"
                      ></v-text-field>
                    </v-col>
                   
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="editedItem.plazo"
                        label="Plazo"
                      ></v-text-field>
                      
                    </v-col>

                     <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        v-model="editedItem.nue"
                        label="NUE"
                      ></v-text-field>
                    </v-col>

                     <v-col
                  cols="12"
                  md="4"
                >
                   

             
                
                 <v-select
                      :items="peritos"
                       item-text="nombre_perito" item-value="id"
                      label="PERITO ASIGNADO"
                      v-model="editedItem.peritos_id"
                  ></v-select>


                </v-col>

                 <v-col cols="12">
                   <v-textarea
                    counter
                    class="purple-input"
                    label="Detalle de la solicitud"
                    value="Se solicita..."
                    rows="2"
                    v-model="editedItem.gls_peritaje"
                  />
                </v-col>

                    <v-col
                      cols="12"
                      sm="8"
                      md="12"
                    >
                      <v-textarea 
                        v-model="editedItem.obs_peritaje"
                        label="Observaciones"
                        rows="2"
                      ></v-textarea>
                    </v-col>


                     <v-col
                  cols="12"
                  md="4"
                >
                   

             
                
                 <v-select
                      :items="estados"
                       item-text="gls_estado" item-value="id"
                      label="SELECCOINE EL ESTADO PERITAJE"
                      
                  ></v-select>


                </v-col>
                    
                  </v-row>
                </v-container>
              </v-card-text>
  
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="close"
                >
                  Cancelar
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="save"
                >
                    Grabar
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
          <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="headline">Are you sure you want to delete this item?</v-card-title>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
                <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-toolbar>
      </template>
      
      <template v-slot:[`item.actions`]="{ item }">
 

        <v-icon
          small
          class="mr-2"
          @click="editItem(item)"
        >
          mdi-eye-check-outline
        </v-icon>
         
      </template>
      <template v-slot:no-data>
        <v-btn
          color="primary"
          @click="initialize"
        >
          Reset
        </v-btn>

   
      </template>
    </v-data-table>
    </v-card>

      <base-material-snackbar
      v-model="dialogo_ok"
      :type="color"
      :top=true
    >
      {{ text }}
      
    </base-material-snackbar>
    </base-material-card>
 
     
  </v-container>
</template>

   
 <script>
  import axios from 'axios'
  export default {
  data: () => ({
    dialog: false,
    dialogDelete: false,
    ip:window.location.hostname,
    peritos:[],
    fiscales:[],
    estados:[],
    text:'',
    
    color: 'info',
    dialogo_ok:false,
    titulo_dialog:'OK',
    headers: [
      {
        
        text: 'RUC',
        align: 'start',
        sortable: false, 
        value: 'ruc',

        
      },
     
      { text: 'Fecha', value: 'fecha' ,    dataType: "Date"},
      { text: 'Fiscal', value: 'Fiscale.nombre_fiscal'},
      { text: 'NUE', value: 'nue'},
     // { text: 'Estado', value: 'Estado.gls_estado' },
      {text: 'Desc.', value: 'gls_peritaje' },
      {text: 'Perito', value: 'Perito.nombre_perito' },
      { text: 'Ver', value: 'actions', sortable: false },
      
    ],
    peritajes: [],
    editedIndex: -1,
    editedItem: {
         id:'',
          ruc: '',
          fecha: '',
          detalle: '',
          fiscales_id:'',
          estado: '',
          plazo:'',
          nue:'',
          gls_peritaje: '',
          peritos_id:'',
          obs_peritaje:'',

    },
    
    search: ''
  }),

  computed: {
    formTitle () {
      return this.editedIndex ='Ver Registro'
    },
  },

  watch: {
    dialog (val) {
      val || this.close()
    },
    dialogDelete (val) {
      val || this.closeDelete()
    },
  },

  created () {
    this.initialize()
  },

  methods: {
    initialize () {
   
       
        let me=this;
        let header={"Token" : "nadaporahora"};
        let configuracion= {headers : header};  
        let url = 'http://'+me.ip+':3000/api/peritajes';
        axios.get(url).then((response) => {
                me.peritajes = response.data.peritajes;
            
        }).catch(function(error){
            console.log(error);
        });
    },

    editItem (item) {
      this.editedIndex = this.peritajes.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.select_fiscal();
      this.select_perito();
      this.select_estados();
      this.dialog = true
    },

    deleteItem (item) {
      this.editedIndex = this.desserts.indexOf(item)
      this.editedItem = Object.assign({}, item)
      this.dialogDelete = true
    },

    deleteItemConfirm () {
      this.desserts.splice(this.editedIndex, 1)
      this.closeDelete()
    },

    close () {
      this.dialog = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    closeDelete () {
      this.dialogDelete = false
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem)
        this.editedIndex = -1
      })
    },

    save () {
            let me=this;
            if (this.editedIndex > -1) {
              
              let me=this;
              Object.assign(me.peritajes[this.editedIndex], this.editedItem)
                me.fecha= me.date;
                let header={"Token" : "nadaporahora"};
              
                let url = 'http://'+me.ip+':3000/api/peritajes/'+this.editedItem.id;
              console.log(me.editedItem.ruc);
                      axios.put(url,{
                                "ruc": me.editedItem.ruc,
                                "fecha": me.editedItem.fecha,
                                "nue": me.editedItem.nue,
                                "plazo":me.editedItem.plazo,
                                "gls_peritaje": me.editedItem.gls_peritaje,
                                "obs_peritaje": me.editedItem.obs_peritaje,
                                "fiscales_id":me.editedItem.fiscales_id,
                                "peritos_id": me.editedItem.peritos_id
                              }).then(function(response){
                                      me.color = 'success';
                                      me.text =' Registro agregado con éxio';
                                      me.dialogo_ok = true;
                          })
                          .catch(function(error){
                            console.log(error.response);
                              me.color = 'error';
                              me.text ='Ha sucedido un error ';
                              me.dialogo_ok = true;
                              console.log(error);
                          });
 

    
            } else {
              this.peritajes.push(me.editedItem)
            }
            this.close()
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


      select_estados(){
                let me=this;
              
         
                let url = 'http://'+me.ip+':3000/api/estado';
                axios.get(url).then((response) => {
                        me.estados = response.data.estado;
                    
                }).catch(function(error){
                    console.log(error);
                });
     },
  },
   
  }
 
</script>