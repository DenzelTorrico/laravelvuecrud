<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
</script>

<template >
    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">EMPLEADOS</h2>
        </template>
       

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8" >
                <div id="body" class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                   
                    <div class="p-6 text-gray-900">
                            <div>
                                <button @click="openModal" class="bg-blue-500 text-white py-2 px-4 rounded">Abrir Modal</button>

                                <div  v-if="showModal"  class="fixed inset-0 flex items-center justify-center z-70">
                                <div  class="bg-white p-4 rounded shadow-md">
                                    <h2 class="text-xl font-bold mb-4">Empleado</h2>
                                    <form @submit.prevent="Agregar()" method="post">
                                        <div class="mb-4">
                                            <label for="name" class="block text-sm font-medium text-gray-700">Nombre:</label>
                                            <input type="text" id="name" v-model="form.name" class="form-input mt-1 block w-full" />
                                        </div>
                                        <div class="mb-4">
                                            <label for="email" class="block text-sm font-medium text-gray-700">Correo Electrónico:</label>
                                            <input type="email" id="email" v-model="form.email" class="form-input mt-1 block w-full" />
                                        </div>
                                        <div class="mb-4">
                                            <label for="phone" class="block text-sm font-medium text-gray-700">Teléfono:</label>
                                            <input type="text" id="phone" v-model="form.phone" class="form-input mt-1 block w-full" />
                                        </div>
                                        <div class="mb-4">
                                            <label for="department" class="block text-sm font-medium text-gray-700">Departamento:</label>
                                            <select id="department" v-model="form.department" class="form-select mt-1 block w-full">
                                            <option value="" :disabled="true">Seleccione un departamento</option>
                                            <option v-for="departament in departamento" :key="departament.id"  :value="departament.id">{{ departament.name }}</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded">Enviar</button>
                                    </form>
                                    <button @click="closeModal" class="bg-red-500 text-white py-2 px-4 rounded mt-4">Cerrar Modal</button>
                                </div>
                                </div>
                            </div>
                        
                        <table  class="w-full p-2 text-sm text-left text-gray-500 dark:text-gray-400">
                            <tr class="text-black text-lg">
                                <th>id</th>
                                <th>name</th>
                                <th>email</th>
                                <th>phone</th>
                                <th>departamento</th>
                                <th>Eliminar</th>
                            </tr>
                            <tr v-for="empleado in empleados" :key="empleado.id">
                                <td class="text-blue-500">{{ empleado.id }}</td>
                                <td>{{ empleado.name }}</td>
                                <td>{{ empleado.email }}</td>
                                <td>{{ empleado.phone }}</td>
                                <td>{{ empleado.departament.name }}</td>
                                <td><button @click="ConfirmDelete(empleado.id)"><i style="color:red" class="fa-solid fa-trash"></i>Eliminar</button></td>
                            </tr>
                            <div class="flex justify-center items-center mt-4">
                                <button @click="goToPage(currentPage - 1)"
                                        :disabled="currentPage === 1"
                                        class="px-4 py-2 bg-blue-500 text-white rounded disabled:bg-gray-300 disabled:text-gray-500">
                                    Anterior
                                </button>
                                <span class="mx-4">Página {{ currentPage }} de {{ lastPage }}</span>
                                <button @click="goToPage(currentPage + 1)"
                                        :disabled="currentPage === lastPage"
                                        class="px-4 py-2 bg-blue-500 text-white rounded disabled:bg-gray-300 disabled:text-gray-500">
                                    Siguiente
                                </button>
                            </div>
                           
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
    import axios from "axios";
    import Swal from 'sweetalert2';
    export default {
        props: {
    departamento: {
      type: Array,
      required: true
    }
  },
    
        data(){
            return {
                empleados:[],
                currentPage:1,
                lastPage:1,
                showModal: false,
                form: {
                    name: '',
                    email: '',
                    phone: '',
                    department: ''
                },
            }
        },
        mounted(){
            this.getEmpleados()
        }
        ,
        methods:{
            getEmpleados(page = 1) {
            axios.get(`crudempleados?page=${page}`)
                .then(response => {
                    if (response.status === 200) {
                        this.empleados = response.data.data;
                        this.currentPage = response.data.current_page;
                        this.lastPage = response.data.last_page;
                    }
                    
                })
                .catch(error => {
                    console.log(error);
                });
        },
        ConfirmDelete(id){
                
          Swal.fire({
             title: '¿Estás seguro?',
                text: 'Esta acción no se puede deshacer',
                 icon: 'warning',
                 showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
                 }).then((result) => {
                     if (result.isConfirmed) {
                          this.DeleteEmpleado(id);
                         }
                });
                           
        },
        DeleteEmpleado(id) {
            axios.delete("empleados/"+id)
                .then(response => {
                        if(response.status==200){
                            if(response.data=="DELETED"){
                                Swal.fire({
                                    title:"Eliminación exitosa",
                                    icon:"success",

                                })
                                this.getEmpleados()
                             }
                        }
                }).catch(error => {
                    console.log(error);
                })
        },
        goToPage(page) {
            if (page >= 1 && page <= this.lastPage) {
                //window.history.pushState(null, '', `crudempleados?page=${page}`);
                this.getEmpleados(page);
            }
        },

        /*Modales*/
            openModal() {
             this.showModal = true;


        },
        closeModal() {
              this.showModal = false;
        },
        Agregar(){
            //console.log(this.form)
            axios.post("empleados",{name:this.form.name,email:this.form.email,phone:this.form.phone,departamento:this.form.department}).then(response =>{
                    if(response.status == 200 && response.data == "OK"){
                        Swal.fire({
                                    title:"Usuario Agregado Correctamente",
                                    icon:"success",
                                })
                                this.getEmpleados()
                                this.closeModal()
                    }
                    console.log(response.data)
            }).catch(error =>{
                console.log(error)
            })
            
        }

        }
    }
</script>