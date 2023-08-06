<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import VueMultiselect from 'vue-multiselect'

</script>

<template>
    <Head title="ESTADOS" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">STATE</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900 h-auto">
                        <h1 class="text-2xl mb-2">Escoge un estado</h1>
                       <table class="min-w-full bg-white border border-gray-200">
                           <thead>
                                <tr>
                                    <td class="px-4 py-2 font-semibold text-left">Titulo</td>
                                    <td class="px-4 py-2 font-semibold text-left">Tematico</td>
                                    <td class="px-4 py-2 font-semibold text-left">Metodologico</td>

                                </tr>
                           </thead>
                           <tr v-for="data in tesis" :key="data.id" class="hover:bg-gray-100">
                                <td>{{ data.titulo }}</td>
                                <td>
                                    <div v-for="state in data.state_tesis">
                                        <div v-if="state.tipo === 'tematico'">{{ state.state_date }}</div>
                                    </div>
                                </td>
                                <td>
                                    <div v-for="state in data.state_tesis">
                                        <div v-if="state.tipo === 'metodologico'">{{ state.state_date }}</div>
                                    </div>
                                </td>

                                
                           </tr>
                       </table>
                       
                    </div>
                    
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
    export default {
        
        data(){
             return {
    
        isDisabled: false,
        tesis:[]

         }
        },
        methods:{

            LoadData(){
                axios.get("api/tesis").then(response=>{
                        console.log(response.data)
                        this.tesis = response.data
                }).catch(error=>{
                    console.log(error)   
                })
            },
            handleTag(newTag) {
                console.log(this.selected)   
        },
            seleccionar(){
                    
            }
        },
        mounted(){
            this.LoadData()
        }
    }
</script>
<style src="vue-multiselect/dist/vue-multiselect.css"></style>
