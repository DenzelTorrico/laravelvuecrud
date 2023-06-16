<template>
  <div v-if="showModal" class="modal-overlay">
  
    <div class="modal">
      <form @submit.prevent="submitFilter" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
  <!-- Campos del formulario -->
  <h1 class="text-2xl font-bold mb-4">Filtrar</h1>

  <div class="filters-list">
        <div v-for="(value, key) in activeFilters" :key="key" class="filter-box">
          {{ key }}: {{ value }}
          <button @click="removeFilter(key)" class="filter-remove">X</button>
        </div>
      </div>

  <div class="mb-4">
    <label for="marca" class="block text-gray-700 text-sm font-bold mb-2">Marca</label>
    <input type="text" v-model="marca" id="marca" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
  </div>
  <div class="mb-4">
    <label for="color" class="block text-gray-700 text-sm font-bold mb-2">Color</label>
    <input type="text" v-model="color" id="color" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
  </div>
  <div class="mb-4">
    <label for="precio" class="block text-gray-700 text-sm font-bold mb-2">Precio</label>
    <input type="number" v-model="precio" id="precio" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
  </div>
  <div class="mb-4">
    <label for="categoria" class="block text-gray-700 text-sm font-bold mb-2">Categoría</label>
    <input type="text" v-model="categoria" id="categoria" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
  </div>

  <!-- Botón de filtrar -->
  <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Filtrar</button>
  <button class="bg-red-500 text-white font-bold p-2 rounded shadow ml-2">Cancelar</button>





</form>
</div>

  </div>
</template>

<script>
export default {
  props:{
    filterData:{
      type:Object,
      required:true,
    }
  },
  data() {
    return {
      showModal: true,
      marca: '',
      color: '',
      precio: null,
      categoria: '',
      activeFilters: {}
    };
  },
  mounted(){
    const parentData = this.filterData;
    this.marca = parentData.marca;
    this.color = parentData.color;
    this.precio = parentData.precio;
    this.categoria = parentData.categoria;

      // Añadir el filtro activo a la lista de filtros
      if (this.marca) {
        this.activeFilters['Marca'] = this.marca;
      }
      if (this.color) {
        this.activeFilters['Color'] = this.color;
      }
      if (this.precio) {
        this.activeFilters['Precio'] = this.precio;
      }
      if (this.categoria) {
        this.activeFilters['Categoría'] = this.categoria;
      }

  },
  methods: {
    submitFilter() {
      // Aquí puedes realizar alguna acción con los datos del formulario,
      // como emitir un evento para enviar los datos al componente padre.
      this.showModal = false;
      const filterData = {
        marca: this.marca,
        color: this.color,
        precio: this.precio,
        categoria: this.categoria,
        showModal:this.showModal
      };

      this.$emit('filter', filterData);
      
       // Cerrar el modal después de enviar el formulario

     

      // Resto del código...
    },
    removeFilter(key) {
      // Eliminar el filtro activo de la lista de filtros
      delete this.activeFilters[key];

            // Restablecer el valor correspondiente en el formulario

      if (key === 'Marca') {
        this.marca = '';
      } else if (key === 'Color') {
        this.color = '';
      } else if (key === 'Precio') {
        this.precio = null;
      } else if (key === 'Categoría') {
        this.categoria = '';
      }
    },
  },
};
</script>

<style>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal {
  background-color: white;
  padding: 20px;
}

.filters-list {
  margin-top: 20px;
}

.filter-box {
  display: inline-block;
  background-color: #f1f1f1;
  padding: 5px 10px;
  margin-right: 10px;
  margin-bottom: 10px;
  border-radius: 5px;
}

.filter-remove {
  background-color: #f44336;
  color: white;
  border: none;
  padding: 2px 5px;
  border-radius: 50%;
  cursor: pointer;
}
</style>
