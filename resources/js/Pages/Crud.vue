<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
//import { usePage } from '@inertiajs/inertia-vue3';
import { ref } from 'vue';
import axios from 'axios';
import Swal from 'sweetalert2';


const departamentos = ref([]);

// Ejemplo de una función para realizar una solicitud GET

function load(){
    axios.get('/departamentos')
    .then(response => {
      // Tratar la respuesta de la solicitud GET
      if(response.status==200){
        departamentos.value = response.data;
      }
    })
    .catch(error => {
      // Manejar errores de la solicitud
      console.error(error);
    });
}


    function confirmDelete(id) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: 'Esta acción no se puede deshacer',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
            }).then((result) => {
            if (result.isConfirmed) {
                this.eliminar(id);
            }
            });
  }

   function eliminar(id){
        axios.delete("/departamentos/"+id)
        .then(response=>{
              if(response.data=="ok" && response.status==200){
                Swal.fire('Eliminado', 'El elemento ha sido eliminado', 'success');
                load()
              }
        }).catch(error=>{
            console.error(error);
        })
   }

load()
</script>
<template>
    <AuthenticatedLayout>
    <template #header>
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">CRUD</h2>
    </template>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                   <table  class="w-full p-2 text-sm text-left text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th>id</th>
                                <th>name</th>
                                <th>eliminar</th>
                                <th>update</th>
                            </tr>
                        </thead>   
                   
                        <tr v-for="depa in departamentos" :key="depa.id">
                            <td>{{ depa.id }}</td>
                            <td>{{ depa.name }}</td>
                            <td><button @click="confirmDelete(depa.id)"><i style="color:red" class="fa-solid fa-trash"></i>Delete</button></td>
                            <td><button @click="redirect(depa.id) "><i class="fa-solid fa-wrench"></i>Update</button></td>
                        </tr>
                        <button class="bg-blue-400 text-white p-2 rounded-xl" @click="Insertar()">Insertar</button>
                   </table>

         

                </div>
            </div>
        </div>
    </div>

</AuthenticatedLayout>
</template>

<script>
export default {
  // Aquí puedes agregar tus opciones de componente Vue
  methods: {
    // Puedes agregar tus métodos aquí
    redirect(id){
       window.location.href="departamentos/actualizar/"+id
    }
    ,
    Insertar(){
        window.location.href = "departamentos/insertar";
    }

  }
}
</script>