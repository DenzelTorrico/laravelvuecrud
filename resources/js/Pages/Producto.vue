<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';

</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <h1 class="text-2xl">Productos</h1>
                        <label>Buscar</label>
                        <input type="text" v-model="buscar" @input="getProductFilter(buscar)" name="buscar" id="buscar" placeholder="buscar">
                        <button class="bg-orange-500 hover:bg-orange-700 text-white font-bold py-2 px-4 rounded ml-2" @click="showFilterForm">Filtrar</button>
                        <label v-if="isLoading" class="mt-4">
                          Cargando<i class="fa-solid fa-rotate fa-spin"></i>
                        </label>
                          <!-- Componente FilterProduct -->
        <filter-product v-if="showFilter" @filter="applyFilter" />
                        <div class=" max-h-[500px] overflow-y-auto">
                          <table ref="productTable" class="min-w-full bg-white border border-gray-200">
  <thead>
    <tr>
      <th class="px-4 py-2 font-semibold text-left">ID</th>
      <th class="px-4 py-2 font-semibold text-left">Nombre</th>
      <th class="px-4 py-2 font-semibold text-left">Descripción</th>
      <th class="px-4 py-2 font-semibold text-left">Precio</th>
      <th class="px-4 py-2 font-semibold text-left">Stock</th>
      <th class="px-4 py-2 font-semibold text-left">Activo</th>
      <th class="px-4 py-2 font-semibold text-left">Marca</th>
      <th class="px-4 py-2 font-semibold text-left">Color</th>
      <th class="px-4 py-2 font-semibold text-left">Categoría</th>
      <th class="px-4 py-2 font-semibold text-left">Fecha</th>
    </tr>
  </thead>
  <tbody>
  <template v-if="products.length === 0">
    <tr>
      <td class="px-4 py-2 bg-blue-100 text-center" colspan="10">No se encontraron datos.</td>
    </tr>
  </template>
  <template v-else>
    <tr v-for="product in products" :key="product.id" class="hover:bg-gray-100">
      <td class="px-4 py-2">{{ product.id }}</td>
      <td class="px-4 py-2">{{ product.name }}</td>
      <td class="px-4 py-2">{{ product.description }}</td>
      <td class="px-4 py-2">{{ product.price }}</td>
      <td class="px-4 py-2">{{ product.stock }}</td>
      <td class="px-4 py-2">{{ product.active }}</td>
      <td class="px-4 py-2">{{ product.brand }}</td>
      <td class="px-4 py-2">{{ product.color }}</td>
      <td class="px-4 py-2">{{ product.category }}</td>
      <td class="px-4 py-2">{{ product.fecha }}</td>
    </tr>
  </template>
</tbody>

</table>
                        </div>

                        <div class="pagination flex items-center space-x-4">
                      <button class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded-md focus:outline-none" @click="changePage(currentPage - 1)" :disabled="currentPage === 1">Anterior</button>
                      <span>{{ currentPage }} de {{ lastPage }}</span>
                      <button class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-4 rounded-md focus:outline-none" @click="changePage(currentPage + 1)" :disabled="currentPage === lastPage">Siguiente</button>
                      <label v-if="isLoadingPagination" class="mt-4">
                          Cargando<i class="fa-solid fa-rotate fa-spin"></i>
                        </label>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>

<script>
import FilterProduct from '@/Components/FilterProduct.vue';

export default {
    data() {
        return {
            buscar: "",
            products: [],
            currentPage: 1,
            lastPage: 1,
            totalItems: 0,
            isLoading: false,
            isLoadingPagination:false,

        };
    },
    components: {
    FilterProduct,
  },
    mounted() {
        this.getProducts();
    },
    methods: {
      showFilterForm() {
      this.showFilter = true;
    },
    applyFilter(filterData) {
      // Aquí puedes hacer algo con los datos del filtro (marca, color, precio, categoría)
      // por ejemplo, realizar una llamada a la API para obtener los productos filtrados.

      // Una vez que hayas aplicado el filtro, puedes ocultar el formulario de filtro.
      this.showFilter = false;
    },
        getProductFilter(search,page) {
            this.currentPage = page
            this.isLoading = true; // Activa el indicador de carga
            axios.get('/getproductosfilter', {
                params: {
                    search: search,
                    page: page
                }
            })
            .then(response => {
                this.products = response.data.data;
                this.currentPage = response.data.current_page;
                this.lastPage = response.data.last_page;
                this.totalItems = response.data.total;
            })
            .catch(error => {
                console.log(error);
            }).finally(()=>{
              this.isLoading = false;
            });
        },
        getProducts(page) {
          this.isLoadingPagination = true; // Activa el indicador de carga
          this.currentPage = page; 
            axios.get('/getproductos', {
                params: {
                    page: page
                }
            })
            .then(response => {
                this.products = response.data.data;
                this.currentPage = response.data.current_page;
                this.lastPage = response.data.last_page;
                this.totalItems = response.data.total;
            })
            .catch(error => {
                console.log(error);
            }).finally(()=>{
              this.isLoadingPagination = false;
            });
        },
        changePage(page) {
  if (page >= 1 && page <= this.lastPage) {
    this.currentPage = page;

    const table = this.$refs.productTable;
    table.scrollIntoView({ behavior: 'smooth', block: 'start' });

    if (this.buscar) {
      this.getProductFilter(this.buscar,page);
    } else {
      this.getProducts(page);
    }
  }
}

    }
};
</script>
