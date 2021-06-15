<template>
    <v-container
    id="identificacion"
    fluid
    tag="section"
  >

    <base-material-card
      icon="mdi-clipboard-text"
      title="Actividades Peritajes"
      class="px-5 py-3"
    >
    </base-material-card>

        <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="INGRESE RUC"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
    </v-card>
    </v-container>



</template>