<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import axios from 'axios';
</script>
<template>
     <AuthenticatedLayout>
            <template #header>
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">CRUD - ACTUALIZAR</h2>
            </template>

            <div class="py-12">
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 text-gray-900">
                            <form @submit.prevent="updateconfirm()">
                            <div class="mb-4">
                                <input type="hidden" name="id" v-model="departamento.id">
                                <label for="name" class="block text-sm font-medium text-gray-700">Nombre:</label>
                                <input type="text" id="name" v-model="departamento.name" class="form-input mt-1 block w-full" />
                            </div>
                            <button type="submit" class="bg-blue-500 p-3 text-white rounded">Actualizar</button>
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

        methods:{
            updateconfirm(id){
                Swal.fire({
            title: '¿Estás seguro que quiere actualizar?',
            text: 'Esta acción no se puede deshacer',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, Actualizar',
            cancelButtonText: 'Cancelar'
            }).then((result) => {
            if (result.isConfirmed) {
               this.updateDepartamento()
            }
            });
            },
            updateDepartamento(){
                    axios.put("/departamentos/update",[this.departamento.id, this.departamento.name])
                    .then(response=>{
                        if(response.status == 200 && response.data == "OK"){
                            //console.log(response.data)
                            Swal.fire({
                                icon: 'success',
                                title: 'Correcto',
                                text: 'Actualizado correctamente'
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
            ,
        props: {
        departamento: {
            type: Object,
            default: null
        }
    }
    }
</script>