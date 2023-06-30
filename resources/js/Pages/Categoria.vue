<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import DataTable from 'datatables.net-vue3';
import DataTablesCore from 'datatables.net';
import CategoryFilter from "../Components/CategoryFilter.vue";

DataTable.use(DataTablesCore);
 
const data = [
  [1, "denzel","Es brown","photo.jpg"]
];
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">CATEGORYS</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6">
                        
                        <category-filter v-if="showmodal"></category-filter>
                        <p>{{ showmodal }}</p>
                        <DataTable :data="categorias" :options="tableOptions" class="custom-table">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>nombre</th>
                                    <th>description</th>
                                    <th>imagen</th>
                                </tr>
                            </thead>
                      
                      
                         </DataTable>
                      
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
    export default {
        components:{
            CategoryFilter:CategoryFilter
        },
        data(){
            return{
                categorias:[],
                showmodal:false,
                tableOptions:{
                    searching:true,
                    lengthChange:false,
                    language:{
                        paginate:{
                            previous:'Anterior',
                            next:'Siguiente'
                        }
                    },
                    initComplete:this.initComplete
                          
                                
                }
                
            }
        },
        mounted(){
            this.getCategorias()
        },

        methods:{

            initComplete: function () {
                    // Obtener el contenedor del filtro
                    const filterContainer = $('.dataTables_filter');

                    // Crear el botón
                    const button = $(`<button class="bg-blue-600 text-white shadow-lg ml-2 p-3 rounded-lg">Filtrar</button>`);
                    button.click(() => {
                        this.showmodal = true
                    });

                    // Agregar el botón al contenedor del filtro
                    filterContainer.append(button);
                },
            
            getCategorias(){
                    axios.get("api/categorias").then(response=>{
                        this.categorias = response.data.map(categoria => [
                    categoria.id,
                    categoria.name,
                    categoria.description,
                    categoria.imagen
                ]);
                       
                    }).catch(error =>{
                        console.log(error)
                    })
            },
          
        }
    }
</script>

<style>
    
    .dataTables_paginate .paginate_button.previous {
  /* Estilos para el botón "Anterior" */
  background-color: #4caf50;
  color: white;
  border: none;
  padding: 8px 16px;
  font-size: 14px;
  cursor: pointer;
}

.dataTables_paginate .paginate_button.next {
  /* Estilos para el botón "Siguiente" */
  background-color: #4caf50;
  color: white;
  border: none;
  padding: 8px 16px;
  font-size: 14px;
  cursor: pointer;
}
.dataTable_paginate span .paginate_button.current{
  background-color: #007bff;
  color: white;
  border: none;
  padding: 8px 12px;
  font-size: 14px;
  cursor: pointer;
}


</style>