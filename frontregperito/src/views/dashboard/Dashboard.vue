<template>
  <v-container
    id="dashboard"
    fluid
    tag="section"
  >
    <v-row>
      <v-col
        cols="12"
        lg="6"
      >
        <base-material-chart-card
          :data="solpormes.data"
          :options="solpormes.options"
          :responsive-options="solpormes.responsiveOptions"
          color="#E91E63"
          hover-reveal
          type="Bar"
        >
          <template v-slot:reveal-actions>
            <v-tooltip bottom>
              <template v-slot:activator="{ attrs, on }">
                <v-btn
                  v-bind="attrs"
                  color="info"
                  icon
                  v-on="on"
                >
                  <v-icon
                    color="info"
                  >
                    mdi-refresh
                  </v-icon>
                </v-btn>
              </template>

              <span>Refresh</span>
            </v-tooltip>

            <v-tooltip bottom>
              <template v-slot:activator="{ attrs, on }">
                <v-btn
                  v-bind="attrs"
                  light
                  icon
                  v-on="on"
                >
                  <v-icon>mdi-pencil</v-icon>
                </v-btn>
              </template>

              <span>Change Date</span>
            </v-tooltip>
          </template>

          <h4 class="card-title font-weight-light mt-2 ml-2">
            Solicitudes de peritajes
          </h4>

          <p class="d-inline-flex font-weight-light ml-2 mt-1">
           En lo que va del año
          </p>

          <template v-slot:actions>
            <v-icon
              class="mr-1"
              small
            >
              mdi-clock-outline
            </v-icon>
            <span class="caption grey--text font-weight-light">Actualizado al dia de ayer</span>
          </template>
        </base-material-chart-card>
      </v-col>

   

      <v-col
        cols="12"
        lg="6"
      >
        <base-material-chart-card
          :data="dataCompletedTasksChart.data"
          :options="dataCompletedTasksChart.options"
          hover-reveal
          color="info"
          type="Line"
        >
          <template v-slot:reveal-actions>
            <v-tooltip bottom>
              <template v-slot:activator="{ attrs, on }">
                <v-btn
                  v-bind="attrs"
                  color="info"
                  icon
                  v-on="on"
                >
                  <v-icon
                    color="info"
                  >
                    mdi-refresh
                  </v-icon>
                </v-btn>
              </template>

              <span>Refresh</span>
            </v-tooltip>

            <v-tooltip bottom>
              <template v-slot:activator="{ attrs, on }">
                <v-btn
                  v-bind="attrs"
                  light
                  icon
                  v-on="on"
                >
                  <v-icon>mdi-pencil</v-icon>
                </v-btn>
              </template>

              <span>Change Date</span>
            </v-tooltip>
          </template>

          <h3 class="card-title font-weight-light mt-2 ml-2">
            Solicitudes terminadas
          </h3>

          <p class="d-inline-flex font-weight-light ml-2 mt-1">
            Solo solicitudes presente año
          </p>

          <template v-slot:actions>
            <v-icon
              class="mr-1"
              small
            >
              mdi-clock-outline
            </v-icon>
            <span class="caption grey--text font-weight-light">campaign sent 26 minutes ago</span>
          </template>
        </base-material-chart-card>
      </v-col>

     

      <v-col
        cols="12"
        md="6"
      >
        <base-material-card
          color="warning"
          class="px-5 py-3"
        >
          <template v-slot:heading>
            <div class="display-2 font-weight-light">
              Ultimas solicitudes
            </div>

            <div class="subtitle-1 font-weight-light">
             ('últimas 10')
            </div>
          </template>
          <v-card-text>
            <v-data-table
              :headers="headers"
              :items="peritajes"
            />
          </v-card-text>
        </base-material-card>
      </v-col>

      <v-col
        cols="12"
        md="6"
      >
        aqui iran los juicios que participma
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'DashboardDashboard',
    
    data () {
      return {
        peritajes: [],
         ip:window.location.hostname,
        dailySalesChart: {
          data: {
            labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
            series: [
              [12, 17, 7, 17, 23, 18, 38],
            ],
          },
          options: {
            lineSmooth: this.$chartist.Interpolation.cardinal({
              tension: 0,
            }),
            low: 0,
            high: 50, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
            },
          },
        },
        dataCompletedTasksChart: {
          data: {
            labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago'],
            series: [
              [4, 2, 1, 3, 0, 0, 0, 0],
            ],
          },
          options: {
            lineSmooth: this.$chartist.Interpolation.cardinal({
              tension: 0,
            }),
            low: 0,
            high: 20, // creative tim: we recommend you to set the high sa the biggest value + something for a better look
            chartPadding: {
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
            },
          },
        },
        solpormes: {
          data: {
           

          },
          options: {
            axisX: {
              showGrid: false,
            },
            low: 0,
            high: 20,
            chartPadding: {
              top: 0,
              right: 5,
              bottom: 0,
              left: 0,
            },
          },
          responsiveOptions: [
            ['screen and (max-width: 640px)', {
              seriesBarDistance: 5,
              axisX: {
                labelInterpolationFnc: function (value) {
                  return value[0]
                },
              },
            }],
          ],
        },
      
         headers: [
      {
        
        text: 'RUC',
        align: 'start',
        sortable: false, 
        value: 'ruc',

        
      },
     
      { text: 'Fecha', value: 'fecha' ,    dataType: "Date"},
      { text: 'Fiscal', value: 'Fiscale.nombre_fiscal'},
     // { text: 'Estado', value: 'Estado.gls_estado' },
     // {text: 'Desc.', value: 'gls_peritaje' },
  
 
      
    ],
       
        tabs: 0,
 
       
      }
      
    },
  created () {
    this.initialize();
    this.cargaSolChart();
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

    cargaSolChart() {
      let me=this;
        let header={"Token" : "nadaporahora"};
        let configuracion= {headers : header};  
        let meses = [];
        let valores =[];
        let url = 'http://'+me.ip+':3000/api/peritajes/month/1';
        let res =[];

        axios.get(url).then((response) => {
                 res= response.data.peritajes;
                 res.forEach(element => {
                   meses.push(element.MES) ;
                   valores.push(element.SUMA);
                 });
           
        }).catch(function(error){
            console.log(error);
        });

        this.solpormes.data = {
          labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago'],
          series:[valores]
        }
         
       

                  
    },

      complete (index) {
        this.list[index] = !this.list[index]
      },
    },
  }
</script>
