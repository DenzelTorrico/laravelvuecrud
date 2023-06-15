<template>
    <form @submit.prevent="submitFilter">
      <!-- Campos del formulario -->
      <div>
        <label for="marca">Marca</label>
        <input type="text" v-model="marca" id="marca" />
      </div>
      <div>
        <label for="color">Color</label>
        <input type="text" v-model="color" id="color" />
      </div>
      <div>
        <label for="precio">Precio</label>
        <input type="number" v-model="precio" id="precio" />
      </div>
      <div>
        <label for="categoria">Categoría</label>
        <input type="text" v-model="categoria" id="categoria" />
      </div>
  
      <!-- Botón de filtrar -->
      <button type="submit">Filtrar</button>
    </form>
  </template>
  
  <script>
  export default {
    data() {
      return {
        marca: '',
        color: '',
        precio: null,
        categoria: '',
      };
    },
  
    methods: {
      submitFilter() {
        // Aquí puedes realizar alguna acción con los datos del formulario,
        // como emitir un evento para enviar los datos al componente padre.
  
        const filterData = {
          marca: this.marca,
          color: this.color,
          precio: this.precio,
          categoria: this.categoria,
        };
  
        this.$emit('filter', filterData);
      },
    },
  };
  </script>
  