<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import axios from 'axios';
</script>
<template>
     <AuthenticatedLayout>
            <template #header>
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">CRUD - Insertar</h2>
            </template>

            <div class="py-12">
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 text-gray-900">
                            <form @submit.prevent="Insertar()">
                            <div class="mb-4">
                                <label for="name" class="block text-sm font-medium text-gray-700">Nombre:</label>
                                <input type="text" id="name" v-model="name"  class="form-input mt-1 block w-full" />
                            </div>
                            <button type="submit" class="bg-blue-500 p-3 text-white rounded">Insertar</button>
                        </form>
                     </div>
                    </div>
                </div>
            </div>
    </AuthenticatedLayout>                    
</template>

<script>
    import Swal from 'sweetalert2';
    export default {
            data(){
                return {
                    name:""
                }
            },
        methods:{
         Insertar(){
                    axios.post("/departamentos/insertar",{name:this.name})
                    .then(response=>{
                        if(response.status == 200 && response.data == "OK"){
                            //console.log(response.data)

                            Swal.fire({
                                icon: 'success',
                                title: 'Correcto',
                                text: 'Insertado correctamente'
                                })
                            setTimeout(()=>{
                                window.location.href="/crud"
                            },2000)
                            
                        }else{
                            console.log(response.data)
                        }
                    }).catch(error =>{
                        console.log(error)
                    })
         }
    }
    }
</script>