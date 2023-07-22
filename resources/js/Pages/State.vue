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
                        <VueMultiselect
                            class="w-50"
                            v-model="selected"
                            :options="options"
                            :taggable="false"
                            :close-on-select="true"
                            @select="handleTag"
                            :disabled="isDisabled"
                            multiple
                            >
                        </VueMultiselect>
                        <button class="p-3 bg-blue-500 shadow rounded text-white mt-4" @click="seleccionar">Seleccionar</button>
          
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
        selected: [],
        options: ["Observado","Aprobado","Desaprobado"],
        isDisabled: false,

         }
        },
        methods:{
            handleTag(newTag) {
                console.log(this.selected)   
        },
            seleccionar(){
                    
            }
        }
    }
</script>
<style src="vue-multiselect/dist/vue-multiselect.css"></style>
